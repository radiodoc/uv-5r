FOP = d:/bin/fop/fop
ZIP = d:/bin/zip/zip
MOGRIFY = d:/bin/ImageMagick/mogrify.exe
INKSCAPE = d:/bin/inkscape/inkscape.exe
XSLTPROC = d:/bin/libxml/bin/xsltproc
KINDLEGEN = "D:\bin\Amazon\Kindle Previewer\lib\kindlegen.exe"

##############################   END SETUP   ##############################
#####################   DO NOT ALTER BELOW THIS LINE   ####################

MODEL = uv-5r
SRC = book.xml

REV = $(shell git describe --tags)
FILENAME = $(MODEL)_$(REV)

PDF_DST = $(FILENAME).pdf
PDF_XSL = assets/fo-stylesheet.xsl
#PDF_XSL = assets/docbook-xsl-1.77.1/fo/docbook.xsl

HTML_DST = $(FILENAME).html
HTML_XSL = assets/docbook-xsl-1.77.1/html/docbook.xsl
CHUNK_XSL = assets/docbook-xsl-1.77.1/html/chunk.xsl

# EPUB uses a path relative to build/epub...
EPUB_DST = $(FILENAME).epub
EPUB_XSL = assets/docbook-xsl-1.77.1/epub/docbook.xsl

KINDLE_DST = $(FILENAME).mobi

all: pdf html epub kindle

png:
	cd assets/images/; \
	echo "Processing SVG assets"; \
	for file in *.svg; do \
		$(INKSCAPE) -d 300 -f $(CURDIR)/assets/images/$$file \
		 -e $(CURDIR)/assets/tmp/$$file.png --export-area-snap; \
		echo "processed" $$file; \
	done; cd ../tmp/; \
	echo "Done processing SVG assets"

pdf: png
	$(FOP) -xml $(SRC) -xsl $(PDF_XSL) -pdf build/$(PDF_DST)
	
html: 
	$(XSLTPROC) --output build/$(HTML_DST) $(HTML_XSL) $(SRC)

chunkhtml: png
	$(XSLTPROC) --output build/html/ $(CHUNK_XSL) $(SRC); \
	mkdir -p build/html/assets/png; \
	cp assets/png/* build/html/assets/png/

rawepub: png
	$(XSLTPROC) --output build/epub/ $(EPUB_XSL) $(SRC); \
	mkdir -p build/epub/OEBPS/assets/png; \
	cp assets/png/* build/epub/OEBPS/assets/png/

epub: rawepub
	cd build/epub/; \
	echo "application/epub+zip" > mimetype; \
	$(ZIP) -0Xq ../$(EPUB_DST) mimetype; \
	$(ZIP) -Xr9D ../$(EPUB_DST) *; \
	cd ../../

kindle: epub
	-$(KINDLEGEN) build/$(EPUB_DST)

bundle: all 
	cd build/; \
	cp ../LICENSE LICENSE; \
	cp ../README README; \
	$(ZIP) -Xr9D $(PDF_DST).zip $(PDF_DST) LICENSE README; \
	$(ZIP) -Xr9D $(EPUB_DST).zip $(EPUB_DST) LICENSE README; \
	$(ZIP) -Xr9D $(HTML_DST).zip $(HTML_DST) LICENSE README; \
	$(ZIP) -Xr9D $(KINDLE_DST).zip $(KINDLE_DST) LICENSE README; \
	cd ../

bundleclean: bundle clean
	-cd build/; \
	rm $(PDF_DST); \
	rm $(EPUB_DST); \
	rm $(HTML_DST); \
	rm $(KINDLE_DST); \
	rm README; \
	rm LICENSE; \
	cd ..

clean:
	-rm -r build/epub