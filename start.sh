#!/bin/sh
# Start the Flask bot on port 5000
/opt/venv/bin/python3 /app/bot.py &

# Start WAHA using node directly (this is what the original image does)
cd /app && node dist/main