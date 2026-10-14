#!/usr/bin/env bash
# run.sh — entry points. Run ./init.sh once first.
#   ./run.sh [serve]            uvicorn main:app --reload on http://127.0.0.1:8000 (default)
#   ./run.sh crawl              crawler.py — pull the SpaceX API into local Mongo (:27017)
#   ./run.sh compose <args>     docker compose <args>  (up -d --build | down | logs …)
#   ./run.sh test [--integration]   every check (delegates to ./test.sh)
#   ./run.sh help               this text
set -euo pipefail
cd "$(dirname "$0")"
VENV=.venv
PY="$VENV/bin/python"

cmd="${1:-serve}"
[ $# -gt 0 ] && shift
case "$cmd" in
  help|-h|--help) sed -n '2,7p' "$0" | sed 's/^# \{0,1\}//'; exit 0 ;;
  test) exec ./test.sh "$@" ;;
  compose) exec docker compose "$@" ;;
  serve|crawl) ;;
  *) echo "unknown command: $cmd" >&2; exit 2 ;;
esac
[ -x "$PY" ] || { echo "no $VENV: run ./init.sh first" >&2; exit 1; }
case "$cmd" in
  serve)
    "$PY" -c 'import uvicorn' 2>/dev/null \
      || { echo "uvicorn is not in requirements.txt (the Dockerfile relies on the base image); add it or use ./run.sh compose up" >&2; exit 1; }
    exec "$PY" -m uvicorn main:app --reload --host 127.0.0.1 --port "${PORT:-8000}" "$@" ;;
  crawl) exec "$PY" crawler.py "$@" ;;
  *) echo "unknown command: $cmd" >&2; sed -n '2,7p' "$0" | sed 's/^# \{0,1\}//' >&2; exit 2 ;;
esac
