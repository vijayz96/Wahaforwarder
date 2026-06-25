#!/bin/sh
# Start WAHA first (main process on port 3000)
waha start &
# Start the forwarding bot (on port 5000)
python3 /app/bot.py