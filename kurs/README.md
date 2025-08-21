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
