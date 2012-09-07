# The (Chinese) Radio Documentation Project

This book is (will be...) released for free under a
Creative Commons Attribution-ShareAlike 3.0 Unported License.

## Baofeng UV-5R

_TBA..._

## Compiling from sources

### Prerequisites

* `Apache FOP`, needed to make PDF files.

* `zip`, needed for creating EPUB packages.

* `xsltproc`, needed for generating EPUB and HTML transformations.

* `kindlegen`, needed for Amazon Kindle `.mobi` format.
* * Depends on EPUB output from `xsltproc` and `zip`.

* `make`, if you intend to use the included `Makefile`.

### Setup

The following instructions assume you've already installed all the 
previously mentioned packages on your system.

#### Update your Makefile

Before you decide to punch in `make all`, please make the following edits to
the `Makefile`:

* Set `FOP` to your fop executable, on most systems this will be `FOP = fop`

* Set `ZIP` to your zip executable, on most systems this will be `ZIP = zip`

* Set `XSLTPROC` to your xsltproc executable.

* Set `KINDLEGEN` to your kindlegen executable.

### Time to make some files.

To make all formats (PDF, HTML, EPUB, Kindle), simply type `make` or `make all`
followed by `make clean`. All `make clean` does is remove the EPUB temp 
directory and files.

To make just one format, run `make <format>` where `<format>` is any one of
the following: `pdf`, `html`, `epub`, `kindle`.

If you for some reason want the EPUB files "naked", without being packaged
into an .epub file, run `make rawepub` (or run `make epub` or `make all`
without running `make clean` afterwards).

##