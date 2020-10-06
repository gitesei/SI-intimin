#!/bin/bash
#SBATCH -p gpu
#SBATCH --gres=gpu:1
#SBATCH -n 5
#SBATCH -A XXXXXX
#SBATCH --mem-per-cpu=3100MB
#
# job time, change for what your job requires 
#SBATCH -t 168:00:00
# 
# job name
#SBATCH -J nvt
#
# filenames stdout and stderr - customise, include %j
#SBATCH -o nvt.out
#SBATCH -e nvt.err

cd $SLURM_SUBMIT_DIR

module purge
module load GCC/5.4.0-2.26  CUDA/8.0.44  OpenMPI/2.0.1
module load Amber/16-AT-17-gpu

pmemd.cuda -O -i nvt.in -o intimin_nvt1.out -c intimin_nvt.ncrst -p intimin.parm7 -r intimin_nvt1.ncrst -x intimin_nvt1.nc

