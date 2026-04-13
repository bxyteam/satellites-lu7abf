#!/bin/bash

# Check if argument is provided
if [ -z "$1" ]; then
    echo "[WARNING] Usage: $0 <script_name_without_extension>"
    exit 1
fi

SCRIPT_NAME="$1"
BAT_FILE="${SCRIPT_NAME}.bat"
LOG_FILE="/var/satellite/logs/${SCRIPT_NAME}.log"
CONFIG_FILE="/var/satellite/data/github/it/dosbox.conf"
IT_DIR="/var/satellite/data/github/it"

mkdir -p /var/satellite/logs ${IT_DIR}/captures
chmod -R ugo+rwx ${IT_DIR}

# Rotate old log if it exists
if [ -f "$LOG_FILE" ]; then
    TIMESTAMP=$(date '+%Y%m%d_%H%M%S')
    mv "$LOG_FILE" "${LOG_FILE}.${TIMESTAMP}"
fi

# Ensure the log file exists before tailing
touch "$LOG_FILE"

# Write DOSBox config
cat <<EOF > "$CONFIG_FILE"
[sdl]
fullscreen=false
autolock=false
output=surface

[mixer]
nosound=true

[speaker]
pcspeaker=false
tandy=off
disney=false

[sblaster]
sbtype=none

[gus]
gus=false

[dosbox]
captures=${IT_DIR}/captures

[render]
frameskip=1

[cpu]
core=auto
cputype=auto
cycles=150000
cycleup=10
cycledown=20

[autoexec]
mount c ${IT_DIR}
c:
call ${BAT_FILE}
exit
EOF

# Start Xvfb manually
XVFB_DISPLAY=":99"
Xvfb $XVFB_DISPLAY -screen 0 640x480x16 &
XVFB_PID=$!

# Wait a moment for Xvfb to start
sleep 1

# Export display
export DISPLAY=$XVFB_DISPLAY

# Cleanup function
cleanup() {
    echo "[INFO] $(date '+%Y-%m-%d %H:%M:%S') - Cleaning up Xvfb and DOSBox for $SCRIPT_NAME"
    
    # Kill the entire process group (timeout and its children including DOSBox)
    if [ ! -z "$TIMEOUT_PID" ]; then
        # Kill the process group
        kill -TERM -$TIMEOUT_PID 2>/dev/null
        sleep 2
        kill -KILL -$TIMEOUT_PID 2>/dev/null
        wait $TIMEOUT_PID 2>/dev/null
    fi
    
    # Backup cleanup - kill any remaining DOSBox processes
    pkill -9 -f "dosbox.*$CONFIG_FILE" 2>/dev/null
    pkill -9 dosbox 2>/dev/null
    
    # Kill Xvfb
    if [ ! -z "$XVFB_PID" ]; then
        kill -9 $XVFB_PID 2>/dev/null
        wait $XVFB_PID 2>/dev/null
    fi
    
    exit $1
}

# Trap to ensure cleanup runs on exit
trap 'cleanup $?' EXIT INT TERM

# Run DOSBox in background with process group
echo "[INFO] $(date '+%Y-%m-%d %H:%M:%S') - Starting DOSBox for $SCRIPT_NAME..." | tee -a "$LOG_FILE"

# Start timeout in a new process group so we can kill the entire group
setsid timeout --preserve-status --kill-after=5s 15m dosbox -conf "$CONFIG_FILE" -noconsole >> "$LOG_FILE" 2>&1 &
TIMEOUT_PID=$!

# Wait for the timeout or completion of the DOSBox process
wait $TIMEOUT_PID
DOSBOX_EXIT_CODE=$?

# Detect timeout
if [ $DOSBOX_EXIT_CODE -eq 124 ]; then
    echo "[ERROR] $(date '+%Y-%m-%d %H:%M:%S') - DOSBox terminated due to timeout after 30 minutes." | tee -a "$LOG_FILE"
    cleanup 124
fi

# Detect fatal X11 error
if grep -q "fatal IO error 11" "$LOG_FILE"; then
    echo "[ERROR] $(date '+%Y-%m-%d %H:%M:%S') - Fatal IO error 11 (Resource temporarily unavailable) detected." | tee -a "$LOG_FILE"
    cleanup 1
fi

# If DOSBox crashed with error
if [ $DOSBOX_EXIT_CODE -ne 0 ]; then
    echo "[ERROR] $(date '+%Y-%m-%d %H:%M:%S') - DOSBox exited with code $DOSBOX_EXIT_CODE" | tee -a "$LOG_FILE"
    cleanup $DOSBOX_EXIT_CODE
fi

echo "[INFO] $(date '+%Y-%m-%d %H:%M:%S') - DOSBox completed for $SCRIPT_NAME" | tee -a "$LOG_FILE"
exit 0
