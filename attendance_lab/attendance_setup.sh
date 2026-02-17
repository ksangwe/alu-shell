#!/usr/bin/env bash

PROJECT="attendance_tracker_v1"

cleanup() {
    echo ""
    echo "Interrupt received. Cleaning up..."

    ARCHIVE_DIR="./${PROJECT}/archive"
    mkdir -p "$ARCHIVE_DIR"

    TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
    ARCHIVE_NAME="archive_$TIMESTAMP"

    cp -r "$PROJECT" "$ARCHIVE_DIR/$ARCHIVE_NAME" 2>/dev/null

    echo "Project archived to $ARCHIVE_DIR/$ARCHIVE_NAME"
    echo "Exiting safely."
    exit 1
}

trap cleanup SIGINT

echo "Starting Attendance Tracker Setup..."

# Check Python installation
if command -v python3 >/dev/null 2>&1; then
    echo "Python version:"
    python3 --version
else
    echo "WARNING: python3 is not installed."
fi


# Keep the script running so it can receive Ctrl+C
while true; do
    sleep 1
done

