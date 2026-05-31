#!/bin/bash
set -e

echo "Installing ComfyUI custom nodes..."

cd /content/ComfyUI/custom_nodes

install_node() {
  REPO_URL="$1"
  FOLDER_NAME="$2"

  echo "=================================="
  echo "Installing: $FOLDER_NAME"
  echo "=================================="

  if [ ! -d "$FOLDER_NAME" ]; then
    git clone "$REPO_URL" "$FOLDER_NAME"
  else
    cd "$FOLDER_NAME"
    git pull || true
    cd ..
  fi

  if [ -f "$FOLDER_NAME/requirements.txt" ]; then
    echo "Installing requirements for $FOLDER_NAME"
    pip install -r "$FOLDER_NAME/requirements.txt" || true
  fi
}

install_node "https://github.com/pythongosssss/ComfyUI-Custom-Scripts.git" "ComfyUI-Custom-Scripts"
install_node "https://github.com/yolain/ComfyUI-Easy-Use.git" "ComfyUI-Easy-Use"
install_node "https://github.com/Fannovel16/ComfyUI-Frame-Interpolation.git" "ComfyUI-Frame-Interpolation"
install_node "https://github.com/kijai/ComfyUI-KJNodes.git" "ComfyUI-KJNodes"
install_node "https://github.com/kijai/ComfyUI-WanVideoWrapper.git" "ComfyUI-WanVideoWrapper"

echo "Installing common video dependencies..."
pip install imageio imageio-ffmpeg opencv-python-headless ffmpeg-python einops safetensors accelerate transformers sentencepiece protobuf || true

echo "Custom nodes installed successfully."
echo "Restart ComfyUI after this."
