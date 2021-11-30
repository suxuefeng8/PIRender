path_to_videos="/search/odin/sxf/data/voxceleb/vox/"
path_to_3dmm_coeff="/search/odin/sxf/data/voxceleb/3dmm/"
path_to_output_dir="/search/odin/sxf/data/voxceleb/lmdb/"

#python scripts/prepare_vox_lmdb.py --path $path_to_videos --coeff_3dmm_path $path_to_3dmm_coeff --out $path_to_output_dir

python -m torch.distributed.launch --nproc_per_node=4 --master_port 12345 train.py --config ./config/face.yaml --name face >train.log 2>&1 &
