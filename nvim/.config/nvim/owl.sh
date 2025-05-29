#!/usr/bin/env bash

set -e

if ! command -v ascii-image-converter &> /dev/null; then
    echo "ascii-image-converter is not installed."
    echo "Install with go install github.com/TheZoraiz/ascii-image-converter@latest"
    exit 1
fi

BASE_URL="https://owlsintowels.org"
IMAGE_URL=$(curl -s "$BASE_URL" | \
  grep -o '<a[^>]*>.*<img[^>]*src="[^"]*"[^>]*>.*</a>' | \
  grep -o 'src="[^"]*"' | \
  sed 's/src="//; s/"//' | \
  sort -R | \
  head -n 1)

if [ -z "$IMAGE_URL" ]; then
    echo "No image URLs found"
    exit 1
fi

if [[ "$IMAGE_URL" =~ ^/ ]]; then
    IMAGE_URL="$BASE_URL$IMAGE_URL"
elif [[ ! "$IMAGE_URL" =~ ^https?:// ]]; then
    IMAGE_URL="$BASE_URL/$IMAGE_URL"
fi

# ascii-image-converter --color --complex -d80,40 "$IMAGE_URL"
ascii-image-converter --color --braille --threshold 1 -d80,40 "$IMAGE_URL"
# TODO: test:  curl -s "$IMAGE_URL" | chafa --format symbols --symbols vhalf --size 80x30 --stretch
# curl -s "$IMAGE_URL" | viu -
# kitty +kitten icat $IMAGE_URL
