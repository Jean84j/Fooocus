#!/bin/bash

echo "==> [1/4] Копируем pony_v6.json как пресет по умолчанию..."
cp ./presets/pony_v6.json ./presets/default.json

echo "==> [2/4] Скачиваем модели ponyDiffusionV6XL (если еще не скачаны)..."
mkdir -p ./models/checkpoints
mkdir -p ./models/vae

if [ ! -f "./models/checkpoints/ponyDiffusionV6XL.safetensors" ]; then
  wget -O ./models/checkpoints/ponyDiffusionV6XL.safetensors \
    https://huggingface.co/mashb1t/fav_models/resolve/main/fav/ponyDiffusionV6XL.safetensors
fi

if [ ! -f "./models/vae/ponyDiffusionV6XL_vae.safetensors" ]; then
  wget -O ./models/vae/ponyDiffusionV6XL_vae.safetensors \
    https://huggingface.co/mashb1t/fav_models/resolve/main/fav/ponyDiffusionV6XL_vae.safetensors
fi

echo "==> [3/4] Запускаем Fooocus с нужными параметрами..."
python entry_with_update.py --share --always-high-vram
