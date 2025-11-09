#!/bin/bash
#SBATCH --job-name=clevr_ebm_training
#SBATCH --output=logs/clevr_ebm_%j.out
#SBATCH --error=logs/clevr_ebm_%j.err
#SBATCH --time=48:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --gres=gpu:tesla_v100-pcie-32gb:1
#SBATCH --mem=32G

# Load required modules (adjust as needed for your cluster)
module load Mambaforge/23.11.0-fasrc01
mamba activate visual_ebm

python train.py --cond --dataset=clevr --exp=clevr_ebm --batch_size=10 --step_lr=300 \
--num_steps=60 --kl --gpus=1 --nodes=1 --filter_dim=128 --im_size=128 --self_attn \
--multiscale --norm --spec_norm --slurm --lr=1e-4 --cuda --replay_batch \
--numpy_data_path ./data/clevr_training_data_128.npz