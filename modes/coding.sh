#!/bin/bash

# coding.sh - Setup for Coding Mode

source ./config/smartwmrc

PROJECT_DIR="$HOME/Downloads/Data Science/Projects/linux-smart-workstation-manager"
SESSION_LOG="./logs/usage_stats.log"

echo "🛠️  Entering Coding Mode..."

# 1. Open your preferred editor
if command -v $DEFAULT_EDITOR &> /dev/null; then
    $DEFAULT_EDITOR "$PROJECT_DIR" &
    echo "📂 Opened $DEFAULT_EDITOR with $PROJECT_DIR"
else
    echo "❌ Editor $DEFAULT_EDITOR not found!"
fi

# 2. Start a new tmux session with two panes (optional)
if command -v tmux &> /dev/null; then
    SESSION_NAME="coding_session"
    tmux new-session -d -s $SESSION_NAME -c "$PROJECT_DIR"
    tmux split-window -v -t $SESSION_NAME
    tmux send-keys -t $SESSION_NAME:0.1 "htop" C-m
    tmux send-keys -t $SESSION_NAME:0.0 "cd $PROJECT_DIR" C-m
    tmux attach -t $SESSION_NAME
else
    echo "⚠️ tmux not installed. Skipping terminal split."
    gnome-terminal --working-directory="$PROJECT_DIR" &
fi

# 3. Log usage start
echo "$(date '+%Y-%m-%d %H:%M:%S') - Coding Mode Started" >> "$SESSION_LOG"
