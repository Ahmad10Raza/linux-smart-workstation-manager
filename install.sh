#!/bin/bash

# install.sh - Installer for Smart Workstation Manager

INSTALL_DIR="/opt/smartwm"
BIN_LINK="/usr/local/bin/smartwm"
STARTER_SCRIPT="smartwm.sh"

echo "🔧 Installing Smart Workstation Manager..."

# 1. Create target directory
sudo mkdir -p "$INSTALL_DIR"
sudo cp -r ./* "$INSTALL_DIR"

# 2. Make all scripts executable
sudo find "$INSTALL_DIR" -type f -name "*.sh" -exec chmod +x {} \;

# 3. Create a symlink for the main launcher
if [[ -f "$BIN_LINK" ]]; then
    sudo rm "$BIN_LINK"
fi
sudo ln -s "$INSTALL_DIR/$STARTER_SCRIPT" "$BIN_LINK"

echo "✅ Installed SmartWM to $INSTALL_DIR"
echo "🚀 You can now run it from anywhere using: smartwm"

# 4. Optional: Create log and config folders if missing
mkdir -p "$INSTALL_DIR/logs"
mkdir -p "$INSTALL_DIR/config"
mkdir -p "$INSTALL_DIR/assets"

# 5. Reminder to customize
echo "📝 Don't forget to configure 'config/smartwmrc' and add your favorite URLs."
