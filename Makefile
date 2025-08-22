# --- Konfiguration ---
PANDOC := docker run --rm -v "$(PWD)":/data pandoc/latex:3-ubuntu
GEOM   := -V geometry:margin=2cm

COURSE_SLUG   := grundkurs      # Zielordner (auch in der Webapp)
COURSE_PREFIX := G              # Kurskürzel: G = Grundkurs
LESSONS       := 01 02          # später einfach erweitern: 01 02 03 ... 16

EXPORT_DIR := exports/$(COURSE_SLUG)
EXPORTS    := $(foreach L,$(LESSONS),$(EXPORT_DIR)/$(COURSE_PREFIX)L$(L)_handout.pdf)

all: handouts
handouts: $(EXPORTS)

# Muster-Regel: aus grundkurs/lektionen/LXX/handout.md -> exports/grundkurs/GLXX_handout.pdf
$(EXPORT_DIR)/$(COURSE_PREFIX)L%_handout.pdf: ./$(COURSE_SLUG)/lektionen/L%/handout.md
	@mkdir -p $(EXPORT_DIR)
	$(PANDOC) $(GEOM) -o $@ $<

# Deploy in die Webapp (Pfad ggf. anpassen, hier: kurs-webapp/docs/grundkurs)
WEBAPP_DOCS := ../it-kurs/kurs-webapp/docs/$(COURSE_SLUG)

deploy: handouts
	@mkdir -p $(WEBAPP_DOCS)
	cp -v $(EXPORT_DIR)/*_handout.pdf $(WEBAPP_DOCS)/
	@echo "Kopiert nach $(WEBAPP_DOCS)"

.PHONY: all handouts deploy