#!/bin/bash

# browsing.sh - Setup for Browsing Mode

source ./config/smartwmrc

SESSION_LOG="./logs/usage_stats.log"
BROWSING_URLS=(
    "https://news.ycombinator.com"
    "https://github.com"
    "https://stackoverflow.com"
    "https://www.google.com"
)

echo "🌐 Entering Browsing Mode..."

# 1. Launch browser with preferred tabs
if command -v "$DEFAULT_BROWSER" &> /dev/null; then
    for url in "${BROWSING_URLS[@]}"; do
        "$DEFAULT_BROWSER" "$url" &
    done
    echo "🧭 Launched browser with work-related tabs"
else
    echo "❌ Browser $DEFAULT_BROWSER not found!"
fi

# 2. Log browsing session
echo "$(date '+%Y-%m-%d %H:%M:%S') - Browsing Mode Started" >> "$SESSION_LOG"
