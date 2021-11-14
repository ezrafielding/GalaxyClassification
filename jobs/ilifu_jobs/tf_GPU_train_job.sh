#!/bin/bash

#SBATCH --job-name='GZtraining'
#SBATCH --partition=GPU
#SBATCH --output=/users/ezraf/slurm_logs/GZtraining-%j-stdout.log
#SBATCH --error=/users/ezraf/slurm_logs/GZtraining-%j-stderr.log
#SBATCH --time=96:00:00

echo "Submitting SLURM job"
export SINGULARITYENV_LD_LIBRARY_PATH=/scratch3/users/ezraf/cuda/bin:/scratch3/users/ezraf/cuda/lib64:/scratch3/users/ezraf/cuda/cuda/lib64:/scratch3/users/ezraf/cuda/include:/scratch3/users/ezraf/cuda/extras/CUPTI/lib64:$LD_LIBRARY_PATH
export SINGULARITYENV_PATH=/scratch3/users/ezraf/cuda/bin:$PATH
cp -r /idia/projects/hippo/gzd/tf_shards /scratch3/users/ezraf/
date
singularity exec /idia/software/containers/ASTRO-PY3.simg /users/ezraf/gzTrain/bin/python /scratch3/users/ezraf/zoobot/train_model.py --experiment-dir /scratch3/users/ezraf/results --shard-img-size 300 --train-dir /scratch3/users/ezraf/tf_shards/train_shards --eval-dir /scratch3/users/ezraf/tf_shards/eval_shards --epochs 1500 --batch-size 64 --resize-size 224
date
rm -r /scratch3/users/ezraf/tf_shards
echo "SLURM Job Complete"
