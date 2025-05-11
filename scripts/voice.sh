#!/bin/bash

# voice.sh - Voice-based launcher for SmartWM

source ./config/smartwmrc
SESSION_LOG="./logs/usage_stats.log"

echo "🎙️ Listening for command... (say: coding, browsing, research)"

# 1. Check dependencies
if ! command -v arecord &> /dev/null || ! command -v ffmpeg &> /dev/null || ! command -v curl &> /dev/null; then
    echo "⚠️ Dependencies missing: arecord, ffmpeg, curl"
    exit 1
fi

# 2. Record short voice input
arecord -d 4 -f cd voice.wav &> /dev/null

# 3. Convert to FLAC for Google Speech API
ffmpeg -loglevel quiet -y -i voice.wav voice.flac

# 4. Send to Google Speech-to-Text (anonymous public API)
RESPONSE=$(curl -s -X POST --data-binary @voice.flac \
  --header "Content-Type: audio/x-flac; rate=44100" \
  "https://www.google.com/speech-api/v2/recognize?output=json&lang=en-us&key=AIzaSyA...FAKE_KEY...")

# 5. Extract transcript
COMMAND=$(echo "$RESPONSE" | grep -oP '"transcript":"\K[^"]+')

echo "🔎 You said: $COMMAND"

case "$COMMAND" in
    *coding*)
        ./modes/coding.sh ;;
    *browsing*)
        ./modes/browsing.sh ;;
    *research*)
        ./modes/research.sh ;;
    *)
        echo "❌ Could not recognize or match a mode!" ;;
esac
