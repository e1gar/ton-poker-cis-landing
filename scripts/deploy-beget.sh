#!/usr/bin/env bash
set -euo pipefail
# Использование: ./deploy-beget.sh SSH_USER HOST REMOTE_PUBLIC_HTML_PATH
# Пример: ./deploy-beget.sh elgar elgar.beget.tech "/home/u12345/webpoker.info/public_html"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(dirname "$SCRIPT_DIR")"
REMOTE_PATH="${3:?укажи путь к public_html на Beget}"
USER="${1:-elgar}"
HOST="${2:-elgar.beget.tech}"

cd "$ROOT"
npm run build
REMOTE="${USER}@${HOST}:${REMOTE_PATH%/}/"
echo "rsync -> $REMOTE"
rsync -avz --delete "$ROOT/dist/" "$REMOTE"
echo "Готово"
