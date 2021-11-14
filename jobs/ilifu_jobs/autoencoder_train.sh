#!/bin/bash

#SBATCH --job-name='LAutoGZtraining'
#SBATCH --partition=GPUV100
#SBATCH --output=/users/ezraf/slurm_logs/LAutoGZtraining-%j-stdout.log
#SBATCH --error=/users/ezraf/slurm_logs/LAutoGZtraining-%j-stderr.log
#SBATCH --time=24:00:00

echo "Submitting SLURM job"
cp -r /idia/projects/hippo/gzd/lengau_auto_shards /scratch3/users/ezraf/
date
singularity exec /idia/software/containers/ASTRO-GPU.simg python /scratch3/users/ezraf/zoobot/train_auto.py
rm -r /scratch3/users/ezraf/lengau_auto_shards
echo "SLURM Job Complete"
