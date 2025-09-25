#!/usr/bin/env bash
set -euo pipefail
OUT=${1:-$HOME/Desktop/jobbortunity-backup.tar.gz}
TMP=$(mktemp -d)
mkdir -p "$TMP"

docker run --rm -v mongo_data:/data -v "$TMP":/backup busybox \
  tar czf /backup/mongo_data.tar.gz -C /data .
docker run --rm -v rabbitmq_data:/data -v "$TMP":/backup busybox \
  tar czf /backup/rabbitmq_data.tar.gz -C /data .
docker run --rm -v rabbitmq_log:/data -v "$TMP":/backup busybox \
  tar czf /backup/rabbitmq_log.tar.gz -C /data .

tar czf "$OUT" -C "$TMP" .
echo "Backup $OUT"
