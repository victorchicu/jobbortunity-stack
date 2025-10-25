#!/usr/bin/env bash
set -euo pipefail
OUT=${1:-$HOME/Desktop/workley-backup.tar.gz}
TMP=$(mktemp -d)
mkdir -p "$TMP"

docker run --rm -v workley-stack_mongo_data:/data -v "$TMP":/backup busybox \
  tar czf /backup/workley-stack_mongo_data.tar.gz -C /data .

docker run --rm -v workley-stack_rabbitmq_data:/data -v "$TMP":/backup busybox \
  tar czf /backup/workley-stack_rabbitmq_data.tar.gz -C /data .

docker run --rm -v workley-stack_rabbitmq_log:/data -v "$TMP":/backup busybox \
  tar czf /backup/workley-stack_rabbitmq_log.tar.gz -C /data .

tar czf "$OUT" -C "$TMP" .
echo "Backup $OUT"
