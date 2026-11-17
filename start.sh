#!/bin/sh
# Komari agent on Abasthan (Background Worker).
# Reports this container as a node to the user's existing Komari panel,
# so it shows up alongside the user's other servers in one dashboard.
# Config comes from environment variables set in the Abasthan dashboard:
#   AGENT_ENDPOINT, AGENT_AUTO_DISCOVERY_KEY,
#   AGENT_DISABLE_WEB_SSH, AGENT_DISABLE_AUTO_UPDATE
set -e
BIN=/tmp/komari-agent
if [ ! -x "$BIN" ]; then
  python3 -c "import urllib.request; urllib.request.urlretrieve('https://github.com/komari-monitor/komari-agent/releases/latest/download/komari-agent-linux-amd64', '/tmp/komari-agent')"
  chmod +x "$BIN"
fi
exec "$BIN"
