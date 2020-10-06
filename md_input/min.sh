#!/bin/bash
#SBATCH -p gpu
#SBATCH --gres=gpu
#SBATCH -n 5
#SBATCH --mem-per-cpu=200MB
#SBATCH -A XXXXX
#
# job time, change for what your job requires 
#SBATCH -t 1:00:00
# 
# job name
#SBATCH -J min
#
# filenames stdout and stderr - customise, include %j
#SBATCH -o min.out
#SBATCH -e min.err

cd $SLURM_SUBMIT_DIR

module purge
module load GCC/5.4.0-2.26  CUDA/8.0.44  OpenMPI/2.0.1
module load Amber/16-AT-17-gpu

pmemd.cuda -O -i min.in -o intimin_min.out -c intimin.rst7 -p intimin.parm7 -r intimin_min.ncrst

