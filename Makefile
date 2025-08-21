# Bequeme Shortcuts
KURS?=grundkurs
NR?=2
SLUG?=dateien
TITLE?=Dateien \& Ordner

neue:
	./scripts/neue-lektion.sh $(KURS) $(NR) $(SLUG) "$(TITLE)"

export:
	./scripts/exportiere-folien.sh $(KURS)/lektionen/GL$(NR)_$(SLUG)/slides/folien.md