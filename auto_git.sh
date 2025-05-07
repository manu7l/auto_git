#!/bin/bash

# Verifica argumento
if [[ -z "$1" ]]; then
  echo "❌ Uso: $0 <archivo_script.sh>"
  exit 1
fi

# Ruta absoluta del archivo
SCRIPT_PATH="$(realpath "$1")"
SCRIPT_NAME="$(basename "$SCRIPT_PATH")"
PROJECT_NAME="${SCRIPT_NAME%.sh}"

# Usuario de GitHub
GITHUB_USER="USUARIO_GITHUB" 
TOKEN="$GITHUB_TOKEN"

# Validación del token
if [[ -z "$TOKEN" ]]; then
  echo "❌ Debes exportar tu token con: export GITHUB_TOKEN=tu_token"
  exit 1
fi

# Menú de visibilidad
echo "🔐 ¿Qué visibilidad deseas para el repositorio?"
select vis in "Público" "Privado"; do
  case $vis in
    "Público") PRIVATE=false; break ;;
    "Privado") PRIVATE=true; break ;;
    *) echo "❌ Opción inválida. Elige 1 o 2." ;;
  esac
done

# Crear carpeta del proyecto
mkdir "$PROJECT_NAME" || { echo "❌ No se pudo crear el directorio."; exit 1; }
cp "$SCRIPT_PATH" "$PROJECT_NAME/"

cd "$PROJECT_NAME" || exit 1

# Inicializar repo Git
git init
echo -e "*.log\n*.bak" > .gitignore
echo "# $PROJECT_NAME" > README.md

git add . 
git commit -m "🚀 Añade script $SCRIPT_NAME"
git branch -M main 

# Crear repositorio remoto en GitHub
RESPONSE=$(curl -s -H "Authorization: token $TOKEN" \
  -H "Content-Type: application/json" \
  -d "{\"name\": \"$PROJECT_NAME\", \"private\": $PRIVATE}" \
  https://api.github.com/user/repos)

HTML_URL=$(echo "$RESPONSE" | jq -r .html_url)
REPO_EXISTS=$(echo "$RESPONSE" | jq -r .errors[0].message)

if [[ "$REPO_EXISTS" == "name already exists on this account" ]]; then
  echo "❌ El repositorio '$PROJECT_NAME' ya existe en GitHub."
  exit 1
fi

# Añadir remoto usando HTTPS + token
REPO_URL="https://$GITHUB_USER:$TOKEN@github.com/$GITHUB_USER/$PROJECT_NAME.git"
git remote add origin "$REPO_URL"
git push -u origin main

# Eliminar archivo original
if [[ -f "$SCRIPT_PATH" ]]; then
  rm "$SCRIPT_PATH"
  echo "🗑️  Eliminado archivo original: $SCRIPT_PATH"
fi

# Mostrar resultado final
echo "✅ Script subido correctamente a:"
echo "🔗 $HTML_URL"

