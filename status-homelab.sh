#!/bin/bash
# Shows container status for each phase

function status_phase() {
  phase=$1
  echo "Status for Phase $phase:"
  cd "$(dirname "$0")/phase${phase}-"* || { echo "Phase $phase directory not found."; exit 1; }
  docker compose ps
  cd - > /dev/null
  echo ""
}

if [ "$1" == "--all" ]; then
  for p in 1 2 3; do
    status_phase $p
  done
elif [ "$1" == "--phase" ]; then
  if [[ "$2" =~ ^[1-3]$ ]]; then
    status_phase $2
  else
    echo "Invalid phase number. Choose 1, 2, or 3."
    exit 1
  fi
else
  echo "Usage: ./status-homelab.sh [--phase <1|2|3>] [--all]"
  exit 0
fi
