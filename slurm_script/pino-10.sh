#!/bin/bash

##Resource Request

#SBATCH --job-name pino-10
#SBATCH --mail-user=dor-hay.sha@campus.technion.ac.il
#SBATCH --mail-type=ALL           # Valid values are NONE, BEGIN, END, FAIL, REQUEUE, ALL
#SBATCH --output /home/dor-hay.sha/project/physics_informed/slurm_script/output/pino10-result-%j.out   ## filename of the output; the %j is equivalent to jobID; default is slurm-[jobID].out
#SBATCH --ntasks=1  ## number of tasks (analyses) to run
#SBATCH --gres=gpu:A40:1          # Request 1 gpu type A40
#SBATCH --time=0-2:10:00  ## time for analysis (day-hour:min:sec)

##Load the CUDA module
module load cuda

eval "$(conda shell.bash hook)"
conda activate pino-env

## Run the script
nvidia-smi
python train_spdc.py --config_path configs/ngc/SPDC-pino-10.yaml --mode train
echo Done