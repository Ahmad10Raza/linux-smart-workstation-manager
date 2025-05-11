#!/bin/bash

# research.sh - Setup for Research Mode

source ./config/smartwmrc

SESSION_LOG="./logs/usage_stats.log"
DOCS_DIR="$HOME/Documents/research"
PDF_VIEWER="evince"
RESEARCH_URLS=(
    "https://scholar.google.com"
    "https://arxiv.org"
    "https://www.researchgate.net"
)

echo "🔍 Entering Research Mode..."

# 1. Open research folder
if [[ -d "$DOCS_DIR" ]]; then
    xdg-open "$DOCS_DIR" &> /dev/null &
    echo "📂 Opened research folder: $DOCS_DIR"
else
    echo "⚠️ Research folder not found at $DOCS_DIR"
fi

# 2. Open some research tabs
if command -v "$DEFAULT_BROWSER" &> /dev/null; then
    for url in "${RESEARCH_URLS[@]}"; do
        "$DEFAULT_BROWSER" "$url" &
    done
    echo "🌐 Opened research sites in $DEFAULT_BROWSER"
else
    echo "❌ Browser $DEFAULT_BROWSER not found!"
fi

# 3. Open a sample PDF (if available)
FIRST_PDF=$(find "$DOCS_DIR" -type f -name "*.pdf" | head -n 1)
if [[ -n "$FIRST_PDF" && -f "$FIRST_PDF" ]]; then
    if command -v "$PDF_VIEWER" &> /dev/null; then
        "$PDF_VIEWER" "$FIRST_PDF" &
        echo "📄 Opened sample PDF: $(basename "$FIRST_PDF")"
    fi
fi

# 4. Log session
echo "$(date '+%Y-%m-%d %H:%M:%S') - Research Mode Started" >> "$SESSION_LOG"
