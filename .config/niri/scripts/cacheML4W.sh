#!/usr/bin/env bash

# Default variables
CACHE_FOLDER="$HOME/.cache/ml4w/hyprland-dotfiles"
CACHE_FILE="$CACHE_FOLDER/current_wallpaper"
DEFAULT_WALLPAPER="$HOME/.config/ml4w/wallpapers/default.jpg"

# Colors for UI
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# --- UI Functions (Redirected to stderr) ---
info() { echo -e "${GREEN}[INFO]${NC} $1" >&2; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1" >&2; }
error() { echo -e "${RED}[ERROR]${NC} $1" >&2; }

# Ensure that cache folder exists
mkdir -p $HOME/.cache

# Set Wallpaper
mkdir -p $CACHE_FOLDER
if [ ! -f $CACHE_FILE ]; then
    touch $CACHE_FILE
    echo "$DEFAULT_WALLPAPER" >"$CACHE_FILE"
    info "Cache file created"
fi
