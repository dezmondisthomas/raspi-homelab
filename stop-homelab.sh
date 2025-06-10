#!/bin/bash
# Stops running containers for each phase

function stop_phase() {
  phase=$1
  echo "Stopping Phase $phase..."
  cd "$(dirname "$0")/phase${phase}-"* || { echo "Phase $phase directory not found."; exit 1; }
  docker compose down
  echo "Phase $phase stopped."
  cd - > /dev/null
}

if [ "$1" == "--all" ]; then
  for p in 1 2 3; do
    stop_phase $p
  done
elif [ "$1" == "--phase" ]; then
  if [[ "$2" =~ ^[1-3]$ ]]; then
    stop_phase $2
  else
    echo "Invalid phase number. Choose 1, 2, or 3."
    exit 1
  fi
else
  echo "Usage: ./stop-homelab.sh [--phase <1|2|3>] [--all]"
  exit 0
fi
