#!/bin/bash
set -e

cd /content

echo "Installing system packages..."
apt-get update -y
apt-get install -y git wget aria2 python3-venv

echo "Cloning ComfyUI..."
if [ ! -d "/content/ComfyUI" ]; then
  git clone https://github.com/comfyanonymous/ComfyUI.git /content/ComfyUI
fi

cd /content/ComfyUI

echo "Installing Python requirements..."
pip install -r requirements.txt

echo "Installing ComfyUI Manager..."
cd /content/ComfyUI/custom_nodes
if [ ! -d "ComfyUI-Manager" ]; then
  git clone https://github.com/ltdrdata/ComfyUI-Manager.git
fi

echo "ComfyUI installed."