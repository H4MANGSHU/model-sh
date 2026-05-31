#!/bin/bash
set -e

cd /content/ComfyUI

mkdir -p models/diffusion_models
mkdir -p models/text_encoders
mkdir -p models/vae
mkdir -p user/default/workflows

echo "Downloading Wan2.2 5B diffusion model..."
wget -c -O models/diffusion_models/wan2.2_ti2v_5B_fp16.safetensors \
"https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/diffusion_models/wan2.2_ti2v_5B_fp16.safetensors"

echo "Downloading text encoder..."
wget -c -O models/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors \
"https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors"

echo "Downloading VAE..."
wget -c -O models/vae/wan_2.1_vae.safetensors \
"https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/vae/wan_2.1_vae.safetensors"

echo "Models downloaded."