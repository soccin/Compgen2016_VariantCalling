## Markdown extension (e.g. md, markdown, mdown).
MEXT = md

## All markdown files in the working directory
SRC = $(wildcard *.$(MEXT))

PDFS=$(SRC:.md=.pdf)

all:	$(PDFS)
	echo $(PDFS)

%.pdf: %.md
	pandoc -t beamer -o $@ $<

clean:	
	rm $(PDFS)

#%.pdf:  %.md
#        pandoc -r markdown+simple_tables+table_captions+yaml_metadata_block -s -S --latex-engine=pdflatex --template=$(PREFIX)/templates/latex.template --filter pandoc-crossref --filter pandoc-citeproc --filter pandoc-citeproc-preamble --csl=$(PREFIX)/csl/$(CSL).csl --bibliography=$(BIB) -o $@ $<
