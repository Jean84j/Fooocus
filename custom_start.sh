#!/bin/bash

echo "==> [1/5] Копируем пресет по умолчанию..."
cp ./presets/pony_v6.json ./presets/default.json

echo "==> [2/5] Скачиваем модели (если ещё не скачаны)..."
mkdir -p ./models/checkpoints
mkdir -p ./models/vae

pip install -q gdown

  gdown --id 1V53zegdkUV5jt2KOYHw0nF3EK4aCW0_O -O ./models/checkpoints/cyberrealisticPony_semiRealV30.safetensors

  # gdown --id 1Xp4XSVWDO6PCcAwWQ1LZNc4gdAE9hWPe -O ./models/checkpoints/cyberillustrious_v40.safetensors


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
