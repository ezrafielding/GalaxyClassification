#!/bin/bash

#SBATCH --job-name='galaxy10_train'
#SBATCH --partition=GPU
#SBATCH --output=/users/ezraf/slurm_logs/galaxy10Train-%j-stdout.log
#SBATCH --error=/users/ezraf/slurm_logs/galaxy10Train-%j-stderr.log
#SBATCH --time=24:00:00

echo "Submitting SLURM job"
export SINGULARITYENV_LD_LIBRARY_PATH=/scratch3/users/ezraf/cuda/bin:/scratch3/users/ezraf/cuda/lib64:/scratch3/users/ezraf/cuda/cuda/lib64:/scratch3/users/ezraf/cuda/include:/scratch3/users/ezraf/cuda/extras/CUPTI/lib64:$LD_LIBRARY_PATH
export SINGULARITYENV_PATH=/scratch3/users/ezraf/cuda/bin:$PATH
pushd /scratch3/users/ezraf/galaxy10/Galaxy10-convXpress/train_model.py
cp /idia/projects/hippo/gzd/galaxy10prep/Galaxy10_DECals.h5 /scratch3/users/ezraf/galaxy10/
date
singularity exec /idia/software/containers/ASTRO-PY3.simg /users/ezraf/gzTrain/bin/python /scratch3/users/ezraf/galaxy10/Galaxy10-convXpress/train_model.py
date
rm /scratch3/users/ezraf/galaxy10/Galaxy10_DECals.h5
popd
echo "SLURM Job Complete"
