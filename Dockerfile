FROM n8nio/n8n:latest

USER root

# Python 3 und pip über apt installieren für Edge-TTS
RUN apt-get update && apt-get install -y python3 python3-pip && \
    pip3 install --no-cache-dir --break-system-packages edge-tts

USER node
