#!/bin/bash
export DISPLAY=${DISPLAY:-:0}
export XAUTHORITY=${XAUTHORITY:-/home/emilog/.Xauthority}

PIDFILE="/tmp/screencast.pid"
OUTDIR="/home/emilog/Videos"
OUTPUT="$OUTDIR/recording-$(date +'%Y%m%d-%H%M%S').mp4"

if [ -f "$PIDFILE" ]; then
    kill -2 $(cat "$PIDFILE")
    sleep 1
    rm "$PIDFILE"
    notify-send "Recording Stopped" "Saved to $OUTPUT"
else
    mkdir -p "$OUTDIR"
    RES=$(xdpyinfo | awk '/dimensions:/{print $2}')
    notify-send "Recording Started" "Press <mod>+r to stop"
    ffmpeg -y -f x11grab -video_size "$RES" -framerate 30 \
        -i "$DISPLAY" -c:v libx264 -preset veryslow -crf 18 \
        -c:a aac -b:a 128k \
        "$OUTPUT" > /home/emilog/ffmpeg.log 2>&1 &
    echo $! > "$PIDFILE"
fi

