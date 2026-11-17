#!/bin/sh
# Komari agent on Abasthan (Web Service).
# Reports this container as a node to the user's existing Komari panel,
# so it shows up alongside the user's other servers in one dashboard.
# Config comes from environment variables set in the Abasthan dashboard:
#   AGENT_ENDPOINT, AGENT_AUTO_DISCOVERY_KEY,
#   AGENT_DISABLE_WEB_SSH, AGENT_DISABLE_AUTO_UPDATE
# A tiny HTTP server listens on $PORT so the platform sees a healthy
# web service (and so a keepalive ping can wake it); the agent runs
# in the foreground.
set -e
BIN=/tmp/komari-agent
if [ ! -x "$BIN" ]; then
  python3 -c "import urllib.request; urllib.request.urlretrieve('https://github.com/komari-monitor/komari-agent/releases/latest/download/komari-agent-linux-amd64', '/tmp/komari-agent')"
  chmod +x "$BIN"
fi
python3 -m http.server "${PORT:-8080}" >/dev/null 2>&1 &
exec "$BIN"
