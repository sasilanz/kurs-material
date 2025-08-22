# IT‑Kurs – Repository

Dieses Repo enthält alle Unterlagen, Folien und Übungen für den **Grundkurs** (später erweiterbar um weitere Kurse).

## Ordnerstruktur
- `syllabus.md` – Fahrplan mit Lernzielen & Stundenplan
- `lessons/` – **eine Lektion = ein Ordner** mit fester Mini-Struktur
- `assets/` – kursweite Bilder/Logos
- `scripts/` – kleine Helferlein (neue Lektion anlegen, Slides exportieren, …)

## Quickstart
```bash
# Neue Lektion anlegen (Beispiel: GL2_dateien)
scripts/new-lesson.sh GL 2 dateien "Dateien & Ordner"

# Slides als PDF/HTML exportieren (benötigt 'marp-cli' in PATH)
scripts/export-slides.sh lessons/02_dateien/slides.md
```
## md file als pdf in export ordner exportieren
im Repo-root kurs-material ausführen:
mkdir -p exports/grundkurs

docker run --rm -v "$PWD":/data pandoc/latex:3-ubuntu \
  -V geometry:margin=2cm \
  -o exports/grundkurs/L01_handout.pdf \
  grundkurs/lektionen/L01/handout.md

docker run --rm -v "$PWD":/data pandoc/latex:3-ubuntu \
  -V geometry:margin=2cm \
  -o exports/grundkurs/L02_handout.pdf \
  grundkurs/lektionen/L02/handout.md

  