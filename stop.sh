#!/bin/bash

echo "Stopping environment..."

case "$1" in
  production)
    echo "Using production environment variables..."
    ENV_FILE="./environments/environment.env"
    shift # Remove 'production' from the argument list
    ;;
  *)
    echo "Using development environment variables (default)..."
    ENV_FILE="./environments/environment.development.env"
    ;;
esac

if [ "$#" -eq 0 ]; then
  docker compose --env-file="$ENV_FILE" down
else
  docker compose --env-file="$ENV_FILE" down "$@"
fi

echo "Environment is stopped."
