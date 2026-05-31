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

