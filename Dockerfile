# Stufe 1: Saubere Alpine-Umgebung zum Bauen von edge-tts
FROM python:3.11-alpine AS builder
python3 -m edge_tts --voice de-DE-KillianNeural --text "{{ $json.narration }}" --write-media "/tmp/scene_{{ $itemIndex }}.mp3" --write-subtitles "/tmp/scene_{{ $itemIndex }}.vtt"
RUN python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --no-cache-dir edge-tts

# Stufe 2: Offizielles n8n-Image (ohne eigenen Paketmanager)
FROM n8nio/n8n:latest

USER root

# Nur die fertige Python-Umgebung aus Stufe 1 herüberkopieren
COPY --from=builder /opt/venv /opt/venv

# Den Pfad setzen, damit n8n den Befehl "edge-tts" direkt findet
ENV PATH="/opt/venv/bin:$PATH"

USER node
