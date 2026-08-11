#!/bin/bash
# Guarda estado, hace commit y crea tag
set -e
DATE=$(date '+%d-%m-%Y %H:%M')
FEATURE="${1:-checkpoint}"

mkdir -p .claude/progress
{
  echo ""
  echo "## Checkpoint: $DATE"
  echo "- Feature: $FEATURE"
  echo "- Commit: $(git log -1 --oneline 2>/dev/null || echo 'sin commits previos')"
} >> .claude/progress/current.md

git add .
git commit -m "CHECKPOINT: $FEATURE"
git tag "v-$(date '+%Y%m%d-%H%M')-checkpoint"
echo "Checkpoint '$FEATURE' guardado: $(git log -1 --oneline)"
