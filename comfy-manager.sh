cd /content/ComfyUI

echo "Installing Python requirements..."
pip install -r requirements.txt

echo "Installing ComfyUI Manager..."
cd /content/ComfyUI/custom_nodes
if [ ! -d "ComfyUI-Manager" ]; then
  git clone https://github.com/ltdrdata/ComfyUI-Manager.git
