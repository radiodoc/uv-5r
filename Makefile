FOP = d:/bin/fop/fop
XSL = ../docbook-xsl-1.77.1/fo/docbook.xsl
SRC = book.xml
DST = build/uv-5r
#$(CURDIR)

all: pdf

pdf:
	$(FOP) -xml $(SRC) -xsl $(XSL) -pdf $(DST).pdf
	
#html:
#epub: