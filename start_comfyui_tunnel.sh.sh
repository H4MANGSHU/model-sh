#!/bin/bash
set -e

cd /content/ComfyUI

echo "Installing cloudflared..."
if [ ! -f "/content/cloudflared" ]; then
  wget -q https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -O /content/cloudflared
  chmod +x /content/cloudflared
fi

echo "Installing localtunnel..."
npm install -g localtunnel

echo "Starting Cloudflare tunnel..."
/content/cloudflared tunnel --url http://127.0.0.1:8188 > /content/cloudflare.log 2>&1 &

echo "Starting localtunnel..."
lt --port 8188 > /content/localtunnel.log 2>&1 &

sleep 8

echo "=============================="
echo "Cloudflare URL:"
grep -o 'https://[-a-zA-Z0-9.]*trycloudflare.com' /content/cloudflare.log | head -n 1 || true

echo "=============================="
echo "LocalTunnel URL:"
grep -o 'https://[-a-zA-Z0-9.]*loca.lt' /content/localtunnel.log | head -n 1 || true

echo "=============================="
echo "Starting ComfyUI..."
python main.py --listen 0.0.0.0 --port 8188