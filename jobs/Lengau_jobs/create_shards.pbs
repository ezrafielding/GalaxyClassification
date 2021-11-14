#!/bin/bash
#PBS -P ASTR1169
#PBS -N tf_shards
#PBS -l select=1:ncpus=20:ngpus=2
#PBS -l walltime=5:00:00
#PBS -q gpu_2
#PBS -m abe
#PBS -M 3869003@myuwc.ac.za
#PBS -o /mnt/lustre3p/groups/ASTR1169/GalaxyZoo/logs/create_shards_output
#PBS -e /mnt/lustre3p/groups/ASTR1169/GalaxyZoo/logs/create_shards_error

module purge
module add chpc/python/anaconda/3-2019.10

echo Start Job - `date`

pushd /mnt/lustre3p/groups/ASTR1169/GalaxyZoo/zoobot
python create_shards.py --labelled-catalog /mnt/lustre3p/groups/ASTR1169/GalaxyZoo/GZD5/decals_lengau_train.csv  --unlabelled-catalog /mnt/lustre3p/groups/ASTR1169/GalaxyZoo/GZD5/decals_lengau_test.csv --shard-dir /mnt/lustre3p/groups/ASTR1169/GalaxyZoo/tf_shards --img-size 300  --eval-size 10000
popd

echo End Job - `date`
