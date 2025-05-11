#!/bin/bash

# smartwm.sh - Smart Workstation Manager

CONFIG_FILE="./config/smartwmrc"
LOG_FILE="./logs/session.log"
USAGE_LOG="./logs/usage_stats.log"
ASCII_LOGO="./assets/logo.txt"

# Load config
if [[ -f "$CONFIG_FILE" ]]; then
    source "$CONFIG_FILE"
else
    echo "❌ Config file not found!"
    exit 1
fi

# Display banner
if [[ -f "$ASCII_LOGO" ]]; then
    cat "$ASCII_LOGO"
else
    echo "🧠 Smart Workstation Manager"
fi

# Logging function
log_session() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

start_mode() {
    MODE=$1
    log_session "Starting $MODE mode"

    case "$MODE" in
        coding)
            ./modes/coding.sh
            ;;
        browsing)
            ./modes/browsing.sh
            ;;
        research)
            ./modes/research.sh
            ;;
        stats)
            ./scripts/stats.sh
            ;;
        restore)
            ./scripts/restore.sh
            ;;
        voice)
            ./scripts/voice.sh
            ;;
        *)
            echo "⚠️ Unknown mode: $MODE"
            echo "Usage: ./smartwm.sh [coding|browsing|research|stats|restore|voice]"
            ;;
    esac
}

# Optional: Theme based on time
set_theme() {
    HOUR=$(date +"%H")
    if (( HOUR >= 19 || HOUR < 7 )); then
        # Night mode
        xrandr --output "$DISPLAY_OUTPUT" --brightness 0.7 2>/dev/null
    else
        # Day mode
        xrandr --output "$DISPLAY_OUTPUT" --brightness 1.0 2>/dev/null
    fi
}

# Set theme on start
set_theme

# Handle input
if [[ -z "$1" ]]; then
    echo "ℹ️ Please specify a mode. Example: ./smartwm.sh coding"
    exit 1
else
    start_mode "$1"
fi
