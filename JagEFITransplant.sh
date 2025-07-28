#!/bin/bash

# 💉 JagEFITransplant - EFI Ritual Transplanter v9.9.9
# Transplants Clover/OpenCore EFI folder from legacy .img to live ESP.

clear
echo "🔮 Welcome to JagEFITransplant"
echo "🧙 Transplanting with caution and curses..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Editable Variables
IMG_PATH="/path/to/HighSierraZone.img"
LIVE_ESP="/Volumes/ESP"
EFI_SOURCE_OFFSET=1048576 # Example: offset in bytes, update as needed
EFI_NAME="CLOVER"  # Could also be "OC"

echo "📦 Mounting legacy .img with offset: $EFI_SOURCE_OFFSET..."
sudo mkdir /mnt/legacyEFI
sudo mount -o loop,rw,sync,offset=$EFI_SOURCE_OFFSET "$IMG_PATH" /mnt/legacyEFI

if [ $? -ne 0 ]; then
  echo "💥 ERROR: Failed to mount image. Check your offset."
  echo "🧟 This ritual cannot proceed until the spirits comply."
  exit 1
fi

echo "🚀 Transplanting EFI folder..."
if [ -d "/mnt/legacyEFI/EFI/$EFI_NAME" ]; then
  sudo cp -R "/mnt/legacyEFI/EFI/$EFI_NAME" "$LIVE_ESP/EFI/"
  echo "✅ EFI folder copied with precision. Bless this hackintosh."
else
  echo "💀 ERROR: Source EFI folder not found. Is it hiding in the shadows?"
fi

echo "🔧 Fixing permissions..."
sudo chmod -R 755 "$LIVE_ESP/EFI/$EFI_NAME"
sudo chown -R root:wheel "$LIVE_ESP/EFI/$EFI_NAME"

echo "🎉 Ritual complete. Your bootloader now wears new skin."
echo "🧙‍♂️ May your boot times be swift and your kexts compatible."
