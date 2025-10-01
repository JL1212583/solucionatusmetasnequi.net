#!/usr/bin/env bash
# test.sh - envía un mensaje de prueba al endpoint local
set -e
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ENV_FILE="$ROOT/backend/.env"
if [ ! -f "$ENV_FILE" ]; then
  echo "No se encontró $ENV_FILE. Crea backend/.env con TELEGRAM_BOT_TOKEN y TELEGRAM_CHAT_ID antes de usar test.sh"
  exit 1
fi
API_KEY=$(grep -E '^API_CLIENT_KEY=' "$ENV_FILE" | cut -d'=' -f2- | tr -d '\"' || true)
API_KEY=${API_KEY:-CLAVE_FRONTEND_OPCIONAL}
echo "Usando API_KEY: $API_KEY"
curl -sS -X POST http://localhost:3000/send-message       -H 'Content-Type: application/json'       -H "x-api-key-authorization: $API_KEY"       -d '{"mensaje":"Mensaje de prueba desde test.sh"}' | jq || true
echo
