#!/bin/bash
#SBATCH -J raw_cpt                           # Job name
#SBATCH -o raw_cpt_%j.out                    # output file (%j expands to jobID)
#SBATCH -e raw_cpt_%j.err                    # error log file (%j expands to jobID)
#SBATCH --mail-type=ALL                      # Request status by email
#SBATCH --mail-user=mep296@cornell.edu       # Email address to send results to.
#SBATCH -N 1                                 # Total number of nodes requested
#SBATCH -n 16                                # Total number of cores requested
#SBATCH --get-user-env                       # retrieve the users login environment
#SBATCH --mem=32000                          # server memory requested (per node)
#SBATCH -t 24:00:00                          # Time limit (hh:mm:ss)
#SBATCH --partition=goyal                    # Request partition
#SBATCH --gres=gpu:2                         # Type/number of GPUs needed

echo "Running on $(hostname)"
nvidia-smi

bash /home/mep296/Synthetic_Continued_Pretraining/scripts/train.sh \
    --lr 5e-06 \
    --rr 0.1 \
    --epochs 4 \
    --bs 16 \
    --wd 0.01 \
    --warmup 0.05 \
    --task_name quality

echo "Job completed on $(date)"
