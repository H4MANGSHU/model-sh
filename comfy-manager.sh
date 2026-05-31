%cd /content/model-sh
!sed -i 's/\r$//' *.sh
!chmod +x *.sh

%cd /content/ComfyUI
!pip install -U --pre comfyui-manager

%cd /content/ComfyUI/custom_nodes
!rm -rf ComfyUI-Manager
!git clone https://github.com/ltdrdata/ComfyUI-Manager.git

%cd /content/ComfyUI/custom_nodes/ComfyUI-Manager
!pip install -r requirements.txt || true

%cd /content/model-sh
!sed -i 's/python main.py --listen 0.0.0.0 --port 8188/python main.py --listen 0.0.0.0 --port 8188 --enable-manager/g' start_comfyui_tunnel.sh

!bash start_comfyui_tunnel.sh
