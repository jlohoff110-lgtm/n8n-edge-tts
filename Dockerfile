FROM node:18-alpine

USER root

# System-Abhängigkeiten und Python/pip für Alpine installieren
RUN apk update && \
    apk add --no-cache python3 py3-pip && \
    python3 -m pip install --no-cache-dir --break-system-packages edge-tts

# n8n global installieren
RUN npm install -g n8n

EXPOSE 5678

USER node

CMD ["n8n","start"]
