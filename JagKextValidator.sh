#!/bin/bash

# 🧙 JagKextValidator - EFI lore validator v9.9.9
# Validates kext presence, permissions, and mountpoints with flair.

clear
echo "🧙‍♂️ Invoking JagKextValidator Ritual..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

KEXT_DIR="/Volumes/ESP/EFI/CLOVER/kexts/Other"
REQUIRED_KEXTS=("FakeSMC.kext" "AppleIntelHD3000Graphics.kext" "NullCPUPowerManagement.kext")

# Step 1: Validate directory
if [ ! -d "$KEXT_DIR" ]; then
  echo "💥 ERROR: Kext directory not found: $KEXT_DIR"
  echo "🔮 Suggestion: Is the ESP mounted? Did Clover get banished?"
  exit 1
fi

# Step 2: Check each kext
for kext in "${REQUIRED_KEXTS[@]}"; do
  if [ -d "$KEXT_DIR/$kext" ]; then
    echo "✅ Found: $kext"
    
    PERMS=$(stat -f "%A" "$KEXT_DIR/$kext")
    if [[ "$PERMS" == "755" || "$PERMS" == "775" ]]; then
      echo "✨ Permissions: $PERMS - Acceptable"
    else
      echo "⚠️ Permissions: $PERMS - Might anger the kernel spirits"
    fi
  else
    echo "🧟 MISSING: $kext"
    echo "💀 Your GPU may weep in confusion"
  fi
done

# Step 3: Optional ritual
echo "🎭 Injecting emoji aura into terminal..."
echo "🌈 Kext audit complete. Bless your bootloader and may your EFI stay unbricked."
