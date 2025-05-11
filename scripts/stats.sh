#!/bin/bash

# stats.sh - View usage statistics dashboard

USAGE_LOG="./logs/usage_stats.log"

echo "📊 Productivity Dashboard"
echo "────────────────────────────"

# Ensure log exists
if [[ ! -f "$USAGE_LOG" ]]; then
    echo "⚠️ No usage stats found yet."
    exit 1
fi

# Get today's date
TODAY=$(date "+%Y-%m-%d")

# Collect time per mode
declare -A mode_counts
declare -A mode_times

# Simulate usage as fixed 30 mins per session for simplicity
while IFS= read -r line; do
    [[ "$line" == "$TODAY"* ]] || continue
    MODE=$(echo "$line" | awk -F'- ' '{print $2}' | awk '{print $1}')
    mode_counts[$MODE]=$((mode_counts[$MODE]+1))
done < "$USAGE_LOG"

# Display results
for MODE in "${!mode_counts[@]}"; do
    COUNT=${mode_counts[$MODE]}
    TIME=$((COUNT * 30))  # assume 30 mins per session
    BAR=$(printf '█%.0s' $(seq 1 $((TIME / 10))))
    printf " %-10s | %-20s %2d min\n" "$MODE" "$BAR" "$TIME"
done

echo "────────────────────────────"
echo "🕒 (Each bar ≈ 10 mins, assumes 30 mins/session)"
