import requests
from flask import Flask, request

app = Flask(__name__)

WAHA_URL = "http://localhost:3000"
SOURCE_GROUP = "120363428389082831@g.us"   # CHANGE THIS LATER
TARGET_GROUP = "120363424960811886@g.us"   # CHANGE THIS LATER

@app.route('/', methods=['POST'])
def receive():
    data = request.json
    for msg in data.get('messages', []):
        if msg.get('from') == SOURCE_GROUP and msg.get('media'):
            media_id = msg['media']['id']
            img = requests.get(f"{WAHA_URL}/api/files/{media_id}").content
            requests.post(
                f"{WAHA_URL}/api/sendFile",
                data={"chatId": TARGET_GROUP, "caption": "Auto-Forwarded"},
                files={"file": ("image.jpg", img, "image/jpeg")}
            )
    return 'ok'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
