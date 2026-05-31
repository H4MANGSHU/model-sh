#!/bin/bash
set -e

echo "=================================="
echo "INSTALLING COMFYUI MANAGER"
echo "=================================="

if [ ! -d "/content/ComfyUI" ]; then
  echo "ERROR: /content/ComfyUI not found."
  echo "Run install_comfyui.sh first."
  exit 1
fi

cd /content/ComfyUI

echo "Installing manager package..."
pip install -U --pre comfyui-manager || true

echo "Installing Manager custom node..."
mkdir -p /content/ComfyUI/custom_nodes
cd /content/ComfyUI/custom_nodes

if [ ! -d "ComfyUI-Manager" ]; then
  git clone https://github.com/ltdrdata/ComfyUI-Manager.git
else
  cd ComfyUI-Manager
  git pull || true
  cd ..
fi

cd /content/ComfyUI/custom_nodes/ComfyUI-Manager

echo "Installing Manager requirements..."
pip install -r requirements.txt || true

echo "=================================="
echo "COMFYUI MANAGER INSTALLED"
echo "Start ComfyUI with: --enable-manager"
echo "=================================="
