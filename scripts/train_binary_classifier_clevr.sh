#!/bin/bash
#SBATCH --job-name=binary_classifier_training
#SBATCH --output=logs/binary_%j.out
#SBATCH --error=logs/binary_%j.err
#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --mem=32G

# Load required modules (adjust as needed for your cluster)
module load Mambaforge/23.11.0-fasrc01
mamba activate visual_ebm

python train_classifier.py --train --spec_norm --norm --dataset clevr --lr 3e-4 --checkpoint_dir ./binary_classifier \
--data_path ./data/clevr_training_data_128.npz