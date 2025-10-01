#!/usr/bin/env bash
# check.sh - Verifica que Dockerfile y docker-compose estén bien ubicados

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "📂 Directorio actual: $ROOT"
echo

# Verificar Dockerfile
if [ -f "$ROOT/backend/Dockerfile" ]; then
  echo "✅ Se encontró: backend/Dockerfile"
else
  echo "❌ ERROR: No existe backend/Dockerfile"
  echo "   → Debes crear este archivo con el contenido de tu Dockerfile."
fi

# Verificar docker-compose.yml
if [ -f "$ROOT/docker-compose.yml" ]; then
  echo "✅ Se encontró: docker-compose.yml en la raíz"
else
  echo "❌ ERROR: No existe docker-compose.yml en la raíz del proyecto."
  echo "   → Asegúrate de crear o mover el archivo aquí."
fi

echo
echo "👉 Si todo está ✅, ahora puedes correr:"
echo "   docker compose up --build"
