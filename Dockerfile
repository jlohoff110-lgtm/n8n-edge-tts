FROM n8nio/n8n:latest

USER root

# Python 3 und pip installieren für Edge-TTS
RUN apk update && apk add --no-cache python3 py3-pip && \
    python3 -m pip install --no-cache-dir --break-system-packages edge-tts

USER node
