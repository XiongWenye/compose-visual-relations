#!/bin/bash
#SBATCH --job-name=clevr_ebm_inference
#SBATCH --output=logs/test_ebm_%j.out
#SBATCH --error=logs/test_ebm_%j.err
#SBATCH --time=48:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --mem=32G

# Load required modules (adjust as needed for your cluster)
module load Mambaforge/23.11.0-fasrc01
mamba activate visual_ebm

# NUM_RELS range from 1 to 3
# data folder is the directory in which you place the numpy data file
python inference.py --checkpoint_folder ./checkpoints --model_name clevr_ebm \
--output_folder ./outputs --dataset clevr --resume_iter best \
--batch_size 32 --num_steps 80 --num_rels 1 --data_folder ./data --mode generation