FOP = d:/bin/fop/fop
ZIP = d:/bin/zip/zip
XSLTPROC = d:/bin/libxml/bin/xsltproc
KINDLEGEN = "D:\bin\Amazon\Kindle Previewer\lib\kindlegen.exe"

##############################   END SETUP   ##############################
#####################   DO NOT ALTER BELOW THIS LINE   ####################

MODEL = uv-5r
SRC = book.xml

REV = $(shell git describe --tags)
FILENAME = $(MODEL)_$(REV)

PDF_DST = build/$(FILENAME).pdf
PDF_XSL = assets/fo-stylesheet.xsl
#PDF_XSL = assets/docbook-xsl-1.77.1/fo/docbook.xsl

HTML_DST = build/$(FILENAME).html
HTML_XSL = assets/docbook-xsl-1.77.1/html/docbook.xsl

# EPUB uses a path relative to build/epub...
EPUB_DST = $(FILENAME).epub
EPUB_XSL = assets/docbook-xsl-1.77.1/epub/docbook.xsl


all: pdf html epub kindle

pdf:
	$(FOP) -xml $(SRC) -xsl $(PDF_XSL) -pdf $(PDF_DST)
	
html:
	$(XSLTPROC) --output $(HTML_DST) $(HTML_XSL) $(SRC)

rawepub:
	$(XSLTPROC) --output build/epub/ $(EPUB_XSL) $(SRC)

epub: rawepub
	cd build/epub/; \
	echo "application/epub+zip" > mimetype; \
	$(ZIP) -0Xq ../$(EPUB_DST) mimetype; \
	$(ZIP) -Xr9D ../$(EPUB_DST) *; \
	cd ../../

kindle: epub
	$(KINDLEGEN) build/$(EPUB_DST)

clean:
	rm -r build/epub
