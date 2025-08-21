#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 4 ]]; then
  echo "Usage: $0 <COURSE_PREFIX> <NUMBER> <slug> <\"Title with spaces\">"
  echo "Example: $0 GL 2 dateien \"Dateien & Ordner\""
  exit 1
fi

COURSE="$1"          # e.g. GL
NUM="$2"             # e.g. 2
SLUG="$3"            # e.g. dateien
TITLE="$4"           # e.g. "Dateien & Ordner"

printf -v PADNUM "%02d" "$NUM"
DIR="lessons/${PADNUM}_${SLUG}"
NAME="${COURSE}${NUM}_${SLUG}"

if [[ -d "$DIR" ]]; then
  echo "Fehler: Verzeichnis $DIR existiert bereits."
  exit 2
fi

echo "→ Lege Lektion an: $DIR"
mkdir -p "$DIR"

# Kopiere Template
cp -R "lessons/_TEMPLATE/." "$DIR/"

# Ersetze Platzhalter
DATE="$(date +%F)"
sed -i.bak -e "s/{{TITLE}}/${TITLE//\//\\/}/g" -e "s/{{TAGS}}/${SLUG}/g" "$DIR/README.md" "$DIR/slides.md"
rm "$DIR/README.md.bak" "$DIR/slides.md.bak" 2>/dev/null || true

# Mini-Header oben ins README einfügen
HEADER="<!-- ${NAME} | ${DATE} -->"
printf "%s\n\n%s" "$HEADER" "$(cat "$DIR/README.md")" > "$DIR/README.md"

echo "✓ Fertig: $DIR"
echo "  Tipp: Trage die Lektion im syllabus.md ein."
