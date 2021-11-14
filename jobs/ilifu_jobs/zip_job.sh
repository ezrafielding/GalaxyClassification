#!/bin/bash

#SBATCH --job-name='packGZData'
#SBATCH --cpus-per-task=2
#SBATCH --output=/users/ezraf/slurm_logs/packGZ-%j-stdout.log
#SBATCH --error=/users/ezraf/slurm_logs/packGZ-%j-stderr.log
#SBATCH --time=12:00:00

echo "Submitting SLURM job"
tar zcf /idia/projects/hippo/gzdgz_dr5.tar.gz /idia/projects/hippo/gzd/dr5
echo "SLURM Job Complete"
