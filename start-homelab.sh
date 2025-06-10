#!/bin/bash

# Master launcher for raspi-homelab
set -e

function start_phase() {
  phase=$1
  echo "Starting Phase $phase..."
  cd "$(dirname "$0")/phase${phase}-"* || { echo "Phase $phase directory not found."; exit 1; }
  docker compose up -d
  echo "Phase $phase started successfully."
  cd - > /dev/null
}

function show_help() {
  echo "Usage: ./start-homelab.sh [--phase <1|2|3>] [--all]"
  echo "  --phase <n> : Start a specific phase"
  echo "  --all       : Start all phases (1, 2, and 3)"
  exit 0
}

if [ "$1" == "--all" ]; then
  for p in 1 2 3; do
    start_phase $p
  done
elif [ "$1" == "--phase" ]; then
  if [[ "$2" =~ ^[1-3]$ ]]; then
    start_phase $2
  else
    echo "Invalid phase number. Choose 1, 2, or 3."
    exit 1
  fi
else
  show_help
fi
