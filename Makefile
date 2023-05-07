include config.mk

DAT_FILES=$(patsubst books/%.txt, %.dat, $(TXT_FILES))
TXT_FILES=$(wildcard books/*.txt)
PNG_FILES=$(wildcard plots/*.png)
JPG_FILES=$(patsubst plots/%.png, myfiles/%.jpg, $(PNG_FILES))

## variables   : Print variables.
.PHONY : variables
variables:
	@echo TXT_FILES: $(TXT_FILES)
	@echo DAT_FILES: $(DAT_FILES)
	@echo PNG_FILES: $(PNG_FILES)
	@echo JPG_FILES: $(JPG_FILES)

## results.txt : Generate Zipf summary table.
results.txt: $(ZIPF_SRC)  $(DAT_FILES)
	$(LANGUAGE) $^ >$@

## dats        : Count words in text files.
# dats is up to date if both isles.dat and abyss.dat are up to date
.PHONY: dats
dats: $(DAT_FILES) 

# Count words.

%.dat: $(COUNT_SRC) books/%.txt
	$(LANGUAGE) $^ $@

#isles.dat: books/isles.txt countwords.py
#	python3 countwords.py $< $@

#abyss.dat: books/abyss.txt countwords.py
#	python3 countwords.py $< $@

#last.png: books/last.dat plotcounts.py
#	python3 plotcounts.py $< $@
#

.PHONY: jpgs
jpgs: $(JPG_FILES)

myfiles/%.jpg:  plots/%.png
	convert $^ $@

myfiles/manifest.txt: $(JPG_FILES)

.PHONY: figures.zip
figures.zip: myfiles/manifest.txt
	 zip -r figures.zip myfiles


## clean       : Remove auto-generated files.
.PHONY: clean
clean:
	rm -f $(DAT_FILES)
	rm -f results.txt
	rm - $(JPG_FILES)

.PHONY: help
help : Makefile
	@sed -n 's/^##//p' $<




