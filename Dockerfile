FROM node:18-alpine

USER root

RUN apk update && \
    apk add --no-cache python3 py3-pip && \
    python3 -m pip install --no-cache-dir --break-system-packages edge-tts && \
    npm install -g n8n

ENV N8N_PORT=5678
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

EXPOSE 5678

USER node

ENTRYPOINT ["/bin/sh", "-c", "exec node /usr/local/lib/node_modules/n8n/bin/n8n"]
