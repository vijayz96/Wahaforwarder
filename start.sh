#!/bin/sh
# Start the Python bot in the background
python3 /app/bot.py &
# Start WAHA (main process)
waha start
