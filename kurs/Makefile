# Bequeme Shortcuts
LESSON?=2
SLUG?=dateien
TITLE?=Dateien & Ordner
PREFIX?=GL

new:
	./scripts/new-lesson.sh $(PREFIX) $(LESSON) $(SLUG) "$(TITLE)"

export:
	./scripts/export-slides.sh lessons/$(shell printf "%02d" $(LESSON))_$(SLUG)/slides.md
