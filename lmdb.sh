set -eux

path_to_videos="/search/odin/sxf/data/host/256/"
path_to_3dmm_coeff="/search/odin/sxf/data/host/256_3dmm"
path_to_output_dir="/search/odin/sxf/data/host/256_lmdb"

if [ ! -d $path_to_output_dir ];then
    mkdir $path_to_output_dir
fi


python scripts/prepare_vox_lmdb.py --path $path_to_videos --coeff_3dmm_path $path_to_3dmm_coeff --out $path_to_output_dir
