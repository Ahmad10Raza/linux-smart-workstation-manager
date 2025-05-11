#!/bin/bash

# break.sh - Periodic break reminder

INTERVAL_MINUTES=45
NOTIFY_TITLE="☕ Time for a break!"
NOTIFY_MSG="Stand up, stretch, and rest your eyes for 5 minutes."

echo "🕒 Break reminder started. You'll be notified every $INTERVAL_MINUTES minutes."

while true; do
    sleep "$((INTERVAL_MINUTES * 60))"
    
    # Display desktop notification
    if command -v notify-send &> /dev/null; then
        notify-send "$NOTIFY_TITLE" "$NOTIFY_MSG"
    fi

    # Optional sound alert
    if command -v paplay &> /dev/null; then
        paplay /usr/share/sounds/freedesktop/stereo/complete.oga
    fi

    echo "$(date '+%H:%M:%S') - Break reminder sent"
done
