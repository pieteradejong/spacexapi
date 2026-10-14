#!/usr/bin/env bash
# test.sh — every check in one place. Exit 0 = green. `run.sh test` runs this script.
#   ./test.sh                 offline: venv matches requirements, compile every tracked .py,
#                             the FastAPI app imports, shell syntax and shellcheck, no tracked .env
#   ./test.sh --integration   also `docker compose up --build`, GET /status, `down` (needs colima)
#   ./test.sh --help          this text
set -euo pipefail
cd "$(dirname "$0")"
INTEGRATION=0
for arg in "$@"; do
  case "$arg" in
    --integration) INTEGRATION=1 ;;
    -h|--help) sed -n '2,6p' "$0" | sed 's/^# \{0,1\}//'; exit 0 ;;
    *) echo "unknown option: $arg (see ./test.sh --help)" >&2; exit 2 ;;
  esac
done

VENV=.venv
PY="$VENV/bin/python"
[ -x "$PY" ] || { echo "no $VENV: run ./init.sh first" >&2; exit 1; }

echo "== python"; "$PY" --version
echo "== deps"; "$PY" -m pip check
echo "== compile (tracked .py)"
git ls-files '*.py' | xargs "$PY" -m compileall -q
echo "== app imports"
"$PY" -c 'import main; assert main.app.title'
echo "== shell"
for f in ./*.sh; do bash -n "$f"; /bin/bash -n "$f"; done
if command -v shellcheck >/dev/null 2>&1; then shellcheck -S warning ./*.sh
else echo "shellcheck not installed — syntax-checked only (brew install shellcheck)"; fi
echo "== secrets"
tracked="$(git ls-files | grep -E '(^|/)\.env(\..+)?$' | grep -vE '\.env\.(example|template)$' || true)"
[ -z "$tracked" ] || { echo "tracked env files:"; echo "$tracked"; exit 1; }
if [ "$INTEGRATION" -eq 1 ]; then
  echo "== integration (docker compose)"
  docker compose config -q
  docker compose up -d --build
  trap 'docker compose down' EXIT
  for _ in 1 2 3 4 5 6 7 8 9 10; do
    curl -fsS http://127.0.0.1:8000/status >/dev/null 2>&1 && break; sleep 2
  done
  curl -fsS http://127.0.0.1:8000/status
  echo
else
  echo "== integration — skipped (pass --integration; needs colima start)"
fi
echo "== all green"
