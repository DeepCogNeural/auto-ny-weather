#!/bin/bash

LOG_FILE="$HOME/Github/ny-weather-claude/ny_weather.log"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

PROMPT="What is the current weather in New York City? Include temperature, feels-like, conditions, humidity, and any notable weather alerts. Be concise."

RESPONSE=$(echo "$PROMPT" | claude --print --model claude-haiku-4-5-20251001 --dangerously-skip-permissions 2>&1)

{
    echo ""
    echo "=== $TIMESTAMP ==="
    echo "$RESPONSE"
} >> "$LOG_FILE"
