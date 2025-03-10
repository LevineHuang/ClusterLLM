export OPENAI_API_KEY="OPENAI_API_KEY"
TOML_FILE_PATH="/mnt/workspace/huanglvjun/ClusterLLM/secrets.toml"

for dataset in banking77
do
    link_path=sampled_triplet_results/${dataset}_embed=instructor_s=small_m=1024_d=67.0_sf_choice_seed=100.json
    # link_path=sampled_triplet_results/${dataset}_embed=instructor_s=large_m=1024_d=67.0_sf_choice_seed=100.json
    OMP_NUM_THREADS=4 MKL_NUM_THREADS=4 python predict_triplet.py \
        --dataset $dataset \
        --data_path $link_path \
        --openai_org "OPENAI_ORG" \
        --model_name gpt-4o \
        --toml_file_path $TOML_FILE_PATH \
        --temperature 0
done

