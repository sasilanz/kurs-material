#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Nutzung: $0 <pfad/zu/slides/folien.md> [outdir]"
  exit 1
fi

SRC="$1"
OUTDIR="${2:-exports}"
BASENAME="$(basename "$(dirname "$SRC")")"   # z.B. GL2_dateien
mkdir -p "$OUTDIR"

if command -v marp >/dev/null 2>&1; then
  echo "→ Exportiere mit marp-cli …"
  marp --pdf --allow-local-files --input-dir "$(dirname "$SRC")" \
       --output "$OUTDIR/${BASENAME}.pdf" "$SRC"
  marp --html --allow-local-files --input-dir "$(dirname "$SRC")" \
       --output "$OUTDIR/${BASENAME}.html" "$SRC"
else
  echo "Warnung: 'marp' nicht gefunden. Fallback: Pandoc HTML (falls vorhanden) …"
  if command -v pandoc >/dev/null 2>&1; then
    pandoc "$SRC" -o "$OUTDIR/${BASENAME}.html"
  else
    echo "Kein Export-Tool verfügbar."
    exit 2
  fi
fi

echo "✓ Export in $OUTDIR/"