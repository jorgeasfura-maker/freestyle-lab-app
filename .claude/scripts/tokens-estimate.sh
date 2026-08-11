#!/bin/bash
# Cuenta tokens aproximados (1 token ~= 0.75 palabras) de todo .claude/*.md
find .claude -name '*.md' -type f | while read -r file; do
  words=$(wc -w < "$file")
  tokens=$(awk -v w="$words" 'BEGIN{printf "%d", w/0.75}')
  echo "$tokens $file"
done | sort -rn | awk '{tokens=$1; $1=""; printf "%s: ~%d tokens\n", $0, tokens}'
