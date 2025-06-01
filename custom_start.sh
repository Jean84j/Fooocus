#!/bin/bash
echo "==> [2/5] Скачиваем модели (если ещё не скачаны)..."
mkdir -p ./models/checkpoints
mkdir -p ./models/vae

pip install -q gdown

  gdown --id 1V53zegdkUV5jt2KOYHw0nF3EK4aCW0_O -O ./models/checkpoints/cyberrealisticPony_semiRealV30.safetensors

  # gdown --id 1Xp4XSVWDO6PCcAwWQ1LZNc4gdAE9hWPe -O ./models/checkpoints/cyberillustrious_v40.safetensors


echo "==> [3/5] Запускаем Fooocus..."
python entry_with_update.py --share --always-high-vram
