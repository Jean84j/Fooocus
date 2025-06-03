#!/bin/bash
echo "==> [2/5] Скачиваем модели (если ещё не скачаны)..."
mkdir -p ./models/checkpoints
mkdir -p ./models/vae

pip install -q gdown


   # gdown --id 1WCI4-hxB2Y4boSkNljuds7Bsq99Vil-D -O ./models/checkpoints/ilustmix_v6.safetensors

   # gdown --id 11L0siJlm0FanLGymsXOgquGqr9xpiuJa -O ./models/checkpoints/nostraillustriousmix_mainMixVAELUNA.safetensors

    # gdown --id 1KZAXe3CYsgNWjXT7BtRAsWI1KxCq7sWU -O ./models/checkpoints/nostrarealisticmix_v10SDXLVAE.safetensors

    gdown --id 1TXeQf0xvm_gTVjccgHoWWa3tCTlktiGl -O ./models/checkpoints/coolnameil_v4VAE.safetensors


echo "==> [3/5] Запускаем Fooocus..."
python entry_with_update.py --share --always-high-vram
