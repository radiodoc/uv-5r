#REV = $(shell git show-ref refs/heads/master | cut -d " " -f 1 | cut -c 0-10)
REV = $(shell git describe --tags)
FOP = d:/bin/fop/fop
XSL = assets/docbook-xsl-1.77.1/fo/docbook.xsl
SRC = book.xml
DST = build/uv-5r_$(REV)
#$(CURDIR)
all: pdf

pdf:
	$(FOP) -xml $(SRC) -xsl $(XSL) -pdf $(DST).pdf
	
#html:
#epub: