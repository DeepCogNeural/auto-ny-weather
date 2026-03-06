#!/bin/bash

VERSIONS_DIR="$HOME/.local/share/claude/versions"
LOG_FILE="$HOME/Github/ny-weather-claude/claude_cleanup.log"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

# Get all versions sorted oldest to newest, keep the latest, delete the rest
LATEST=$(ls "$VERSIONS_DIR" | sort -V | tail -1)
OLD_VERSIONS=$(ls "$VERSIONS_DIR" | sort -V | sed '$d')  # all but last line (macOS compatible)

if [ -z "$OLD_VERSIONS" ]; then
    echo "$TIMESTAMP \u2014 Nothing to clean, only one version ($LATEST) installed." >> "$LOG_FILE"
    exit 0
fi

FREED=0
while IFS= read -r version; do
    SIZE=$(stat -f%z "$VERSIONS_DIR/$version" 2>/dev/null)
    SIZE_MB=$(echo "$SIZE / 1048576" | bc)
    rm -f "$VERSIONS_DIR/$version"
    FREED=$((FREED + SIZE_MB))
    echo "$TIMESTAMP \u2014 Deleted version $version (${SIZE_MB}MB)" >> "$LOG_FILE"
done <<< "$OLD_VERSIONS"

echo "$TIMESTAMP \u2014 Kept latest: $LATEST. Total freed: ${FREED}MB" >> "$LOG_FILE"
