#!/bin/bash

LOG_FILE="$HOME/Github/ny-weather-claude/ny_weather.log"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

PROMPT="NYC today's observed high temp so far. Check: 1)NOAA weather.gov obs 2)Weather Underground 3)METAR KLGA. Reply ONE line only, no explanation: NOAA=X°F/X°C|WU=X°F/X°C|METAR=X°F/X°C"

RESPONSE=$(echo "$PROMPT" | claude --print --model claude-haiku-4-5-20251001 --dangerously-skip-permissions 2>&1)

echo "$TIMESTAMP $RESPONSE" >> "$LOG_FILE"
