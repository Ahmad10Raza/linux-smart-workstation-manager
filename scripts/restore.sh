#!/bin/bash

# restore.sh - Restore the last used mode

SESSION_LOG="./logs/usage_stats.log"

echo "⏪ Restoring last session..."

if [[ ! -f "$SESSION_LOG" ]]; then
    echo "⚠️ No session history found!"
    exit 1
fi

# Get the last used mode from the log
LAST_MODE=$(grep -E 'Mode Started' "$SESSION_LOG" | tail -n 1 | awk -F'- ' '{print $2}' | awk '{print $1}')

if [[ -z "$LAST_MODE" ]]; then
    echo "⚠️ No mode found in logs."
    exit 1
fi

echo "🔁 Restarting $LAST_MODE mode..."
sleep 1
../modes/$LAST_MODE.sh
