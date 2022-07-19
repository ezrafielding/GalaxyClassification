#!/bin/bash
#PBS -P ASTR1169
#PBS -N decals_eval
#PBS -l select=1:ncpus=20:ngpus=2
#PBS -l walltime=2:30:00
#PBS -q gpu_2
#PBS -m abe
#PBS -M 3869003@myuwc.ac.za
#PBS -o /mnt/lustre3p/groups/ASTR1169/GalaxyZoo/logs/model_eval_output
#PBS -e /mnt/lustre3p/groups/ASTR1169/GalaxyZoo/logs/model_eval_error

module purge
module add chpc/python/anaconda/3-2020.11

echo Start Job - `date`

pushd /mnt/lustre3p/groups/ASTR1169/GalaxyZoo/zoobot
python eval_model.py
popd

echo End Job - `date`
