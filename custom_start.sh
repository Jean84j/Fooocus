#!/bin/bash
echo "==> [2/5] Скачиваем модели (если ещё не скачаны)..."
mkdir -p ./models/checkpoints
mkdir -p ./models/vae

pip install -q gdown


   gdown --id 1WCI4-hxB2Y4boSkNljuds7Bsq99Vil-D -O ./models/checkpoints/ilustmix_v6.safetensors


echo "==> [3/5] Запускаем Fooocus..."
python entry_with_update.py --share --always-high-vram
