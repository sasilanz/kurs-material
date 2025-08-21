#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 4 ]]; then
  echo "Nutzung: $0 <kurs> <nummer> <slug> <\"Titel\">"
  echo "Beispiel: $0 grundkurs 2 dateien \"Dateien & Ordner\""
  exit 1
fi

KURS="$1"       # z.B. grundkurs
NUM="$2"        # z.B. 2
SLUG="$3"       # z.B. dateien
TITLE="$4"      # z.B. "Dateien & Ordner"

printf -v PADNUM "%d" "$NUM"
DIR="${KURS}/lektionen/GL${PADNUM}_${SLUG}"

if [[ -d "$DIR" ]]; then
  echo "Fehler: $DIR existiert bereits."
  exit 2
fi

echo "→ Lege Lektion an: $DIR"
mkdir -p "$DIR"/{slides,uebungen,loesungen,assets}

# README.md Grundgerüst
cat > "$DIR/README.md" <<EOF
---
title: "${TITLE}"
tags: [${SLUG}]
dauer: 90
---
# ${TITLE}

## Ziele
- …

## Ablauf
1. Einstieg (5’)
2. Input (30’)
3. Übung (40’)
4. Rückblick (15’)

## Notizen (für dich)
- …

## Handout (für Teilnehmende)
- …
EOF

# Slides Grundgerüst
cat > "$DIR/slides/folien.md" <<'EOF'
---
marp: true
paginate: true
size: 16:9
title: "{{TITLE}}"
class: lead
---

# {{TITLE}}

_IT‑Kurs – {{TITLE}}_

---

## Heute
- Ziele
- Kurzinput
- Übung
- Rückblick
EOF

# Platzhalter-Dateien (falls sinnvoll)
touch "$DIR/uebungen/.gitkeep" "$DIR/loesungen/.gitkeep" "$DIR/assets/.gitkeep"

echo "✓ Fertig: $DIR"
echo "  Tipp: Trage die Lektion im ${KURS}/syllabus.md ein."