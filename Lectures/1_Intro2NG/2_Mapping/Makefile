## Markdown extension (e.g. md, markdown, mdown).
MEXT = md

## All markdown files in the working directory
SRC = $(wildcard ?_*.$(MEXT))

PDFS=$(SRC:.md=.pdf)

BEAMERFLAGS=-V theme=Boadilla -V colortheme=beaver -V fonttheme=structurebold -t beamer -fmarkdown-implicit_figures

all: $(PDFS)
	echo $(PDFS)

%.pdf: %.md
	pandoc $(BEAMERFLAGS) -o $@ $<

clean:	
	rm -f $(PDFS)

#%.pdf:  %.md
#        pandoc -r markdown+simple_tables+table_captions+yaml_metadata_block -s -S --latex-engine=pdflatex --template=$(PREFIX)/templates/latex.template --filter pandoc-crossref --filter pandoc-citeproc --filter pandoc-citeproc-preamble --csl=$(PREFIX)/csl/$(CSL).csl --bibliography=$(BIB) -o $@ $<
