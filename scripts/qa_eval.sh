#!/bin/bash
#SBATCH -J qa_eval                           # Job name
#SBATCH -o qa_eval_%j.out                    # output file (%j expands to jobID)
#SBATCH -e qa_eval_%j.err                    # error log file (%j expands to jobID)
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

python /home/mep296/Synthetic_Continued_Pretraining/evaluation.py --model_path=/home/mep296/Synthetic_Continued_Pretraining/ckpts/quality-lr5e-06-rr0.1-epochs5-bs16-wd0.01-warmup0.05-MetaLlama38B/checkpoint-448

echo "Job completed on $(date)"
