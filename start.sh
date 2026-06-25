#!/bin/sh
# Start the Flask bot FIRST on port 5000
/opt/venv/bin/python3 /app/bot.py &

# Start WAHA on port 3000 (this becomes the foreground process)
waha start