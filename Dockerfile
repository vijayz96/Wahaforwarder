FROM devlikeapro/waha:latest

USER root

RUN apt-get update && apt-get install -y python3 python3-pip python3-venv

RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

RUN pip install requests flask

COPY bot.py /app/bot.py
COPY start.sh /start.sh

RUN chmod +x /start.sh

CMD ["/start.sh"]