#!/usr/bin/env bash
set -e
ORIG="/usr/local/bin/docker-entrypoint.sh"
KEY="/etc/mongo-keyfile"

if [ -z "$(ls -A /data/db 2>/dev/null)" ]; then
  echo "[mongo] First boot: starting WITHOUT keyFile so init scripts can run"
  exec "$ORIG" mongod --replSet rs0 --bind_ip_all
else
  echo "[mongo] Subsequent boot: starting WITH keyFile (auth for RS)"
  exec "$ORIG" mongod --replSet rs0 --bind_ip_all --keyFile "$KEY"
fi