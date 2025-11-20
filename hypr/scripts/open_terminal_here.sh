#!/bin/bash

# Get PID of focused window
PID=$(hyprctl activewindow -j | jq '.pid')

# Resolve working directory from /proc
if [[ -d "/proc/$PID/cwd" ]]; then
    CWD=$(readlink -f /proc/$PID/cwd)
else
    CWD="$HOME"
fi

# Launch kitty in that directory
kitty --directory "$CWD"
