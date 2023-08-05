#!/bin/bash
#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=1:mem=8gb



cd $PBS_O_WORKDIR

module load anaconda3/personal
source activate fenicsproject

cd Incompact3d_Flaps

python3 convergeflow.py

exit 0