set -eux

#path_to_videos="/search/odin/sxf/data/action_male/limu_256"
#path_to_3dmm_coeff="/search/odin/sxf/data/action_male/limu_256_3dmm"
#path_to_output_dir="/search/odin/sxf/data/action_male/limu_256_lmdb"

path_to_videos="/search/odin/sxf/data/pirender/concat_video/"
path_to_3dmm_coeff="/search/odin/sxf/data/pirender/concat_video_3dmm"
path_to_output_dir="/search/odin/sxf/data/pirender/concat_video_lmdb"

if [ ! -d $path_to_output_dir ];then
    mkdir $path_to_output_dir
fi

config="config/limu.yaml"
result="result/limu/"

python scripts/prepare_vox_lmdb.py --path $path_to_videos --coeff_3dmm_path $path_to_3dmm_coeff --out $path_to_output_dir

python -m torch.distributed.launch --nproc_per_node=1 --master_port 12345 inference.py --config $config --name face --no_resume --output_dir $result
