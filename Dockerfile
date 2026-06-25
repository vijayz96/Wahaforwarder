FROM devlikeapro/waha:latest

USER root

RUN apt-get update && apt-get install -y python3 python3-pip python3-venv

# Create and activate virtual environment
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install Python packages inside venv
RUN pip install requests flask

# Copy your scripts
COPY bot.py /app/bot.py
COPY start.sh /start.sh

RUN chmod +x /start.sh

# Expose WAHA (3000) and bot (5000) ports
EXPOSE 3000 5000

CMD ["/start.sh"]