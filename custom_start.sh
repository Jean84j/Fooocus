#!/bin/bash
echo "==> [2/5] Скачиваем модели (если ещё не скачаны)..."
mkdir -p ./models/checkpoints
mkdir -p ./models/vae

pip install -q gdown

  # gdown --id 1Xp4XSVWDO6PCcAwWQ1LZNc4gdAE9hWPe -O ./models/checkpoints/cyberillustrious_v40.safetensors

   gdown --id 15rQGgOoPwUS416NnXtZtKVhAUz7RCXIb -O ./models/checkpoints/novaCartoonXL_v10.safetensors

 
echo "==> [3/5] Запускаем Fooocus..."
python entry_with_update.py --share --always-high-vram
