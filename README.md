# auto-ny-weather

Two shell scripts for automating NYC weather checks and Claude CLI version cleanup on macOS, intended to run on a schedule via launchd.(help to refresh the 5hr Claude session limits)

## Scripts

### `ny_weather_check.sh`
Sends a weather prompt to Claude CLI and appends the timestamped response to a log file.

- Uses `claude-haiku-4-5-20251001` model
- Logs to `~/Github/ny-weather-claude/ny_weather.log`

### `claude_cleanup.sh`
Deletes old Claude CLI binary versions from `~/.local/share/claude/versions/`, keeping only the latest.

- Logs freed space to `~/Github/ny-weather-claude/claude_cleanup.log`

## Setup

1. Make scripts executable:
   ```bash
   chmod +x ny_weather_check.sh claude_cleanup.sh
   ```

2. Schedule with launchd by creating plist files in `~/Library/LaunchAgents/`.

3. Ensure `claude` is on PATH in the launchd plist via `EnvironmentVariables`, since launchd does not inherit your shell's PATH.
