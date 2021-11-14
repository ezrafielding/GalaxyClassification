#!/bin/bash

#SBATCH --job-name='makeAutotfShards'
#SBATCH --partition=GPU
#SBATCH --output=/users/ezraf/slurm_logs/makeAutotfShards-%j-stdout.log
#SBATCH --error=/users/ezraf/slurm_logs/makeAutotfShards-%j-stderr.log
#SBATCH --time=06:00:00

echo "Submitting SLURM job"
singularity exec /idia/software/containers/ASTRO-GPU.simg python /idia/projects/hippo/gzd/zoobot/create_shards.py --labelled-catalog /idia/projects/hippo/gzd/Ilifu_data/decals_lengau_train.csv  --unlabelled-catalog /idia/projects/hippo/gzd/Ilifu_data/decals_lengau_test.csv --shard-dir /idia/projects/hippo/gzd/lengau_auto_shards --img-size 224  --eval-size 5000
echo "SLURM Job Complete"
