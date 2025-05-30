#!/bin/bash

echo "==> [1/5] Копируем пресет по умолчанию..."
cp ./presets/pony_v6.json ./presets/default.json

echo "==> [2/5] Скачиваем модели (если ещё не скачаны)..."
mkdir -p ./models/checkpoints
mkdir -p ./models/vae

# if [ ! -f "./models/checkpoints/ponyDiffusionV6XL.safetensors" ]; then
#   wget -O ./models/checkpoints/ponyDiffusionV6XL.safetensors \
#     https://huggingface.co/mashb1t/fav_models/resolve/main/fav/ponyDiffusionV6XL.safetensors
# fi

# if [ ! -f "./models/vae/ponyDiffusionV6XL_vae.safetensors" ]; then
#   wget -O ./models/vae/ponyDiffusionV6XL_vae.safetensors \
#     https://huggingface.co/mashb1t/fav_models/resolve/main/fav/ponyDiffusionV6XL_vae.safetensors
# fi

# if [ ! -f "./models/checkpoints/waiNSFWIllustrious_v120.safetensors" ]; then
#   wget -O ./models/checkpoints/waiNSFWIllustrious_v120.safetensors \
#     # https://civitai.com/api/download/models/1490781?type=Model&format=SafeTensor&size=pruned&fp=fp16
#     https://drive.google.com/file/d/1V53zegdkUV5jt2KOYHw0nF3EK4aCW0_O/view?usp=drive_link
# fi

  # https://civitai.com/api/download/models/799879?type=Model&format=SafeTensor&size=pruned&fp=bf16

  # https://civitai.com/api/download/models/1692717?type=Model&format=SafeTensor&size=pruned&fp=fp16


pip install -q gdown

if [ ! -f "./models/checkpoints/waiNSFWIllustrious_v120.safetensors" ]; then
  gdown --id 1V53zegdkUV5jt2KOYHw0nF3EK4aCW0_O -O ./models/checkpoints/waiNSFWIllustrious_v120.safetensors

fi


echo "==> [3/5] Запускаем Fooocus..."
python entry_with_update.py --share --always-high-vram

echo "==> [4/5] Подключаем Google Диск..."
# Проверяем, смонтирован ли диск
if [ ! -d "/content/drive" ]; then
  echo "⚠️ Google Drive не смонтирован. Пожалуйста, сначала подключи его в Colab:"
  echo "from google.colab import drive"
  echo "drive.mount('/content/drive')"
  exit 1
fi

# Создаем папку с временной меткой
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
target_dir="/content/drive/MyDrive/Fooocus_Images/$timestamp"
mkdir -p "$target_dir"

echo "==> [5/5] Сохраняем изображения в $target_dir ..."
cp -r ./outputs/* "$target_dir"

echo "✅ Готово! Изображения сохранены в: $target_dir"
