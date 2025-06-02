#!/bin/bash
echo "==> [2/5] Скачиваем модели (если ещё не скачаны)..."
mkdir -p ./models/checkpoints
mkdir -p ./models/vae

pip install -q gdown


   gdown --id 1GT71_JQzBfOuvvpP8lMq91fAm-uJvYR9 -O ./models/checkpoints/illustriousXL20_v20.safetensors

 
echo "==> [3/5] Запускаем Fooocus..."
python entry_with_update.py --share --always-high-vram
