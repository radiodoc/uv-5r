# The (Chinese) Radio Documentation Project

This book is released for free under a
Creative Commons Attribution-ShareAlike 3.0 Unported License.

## Baofeng UV-5R

In the `source/` directory you'll find the XML sources for the manual to
the Baofeng UV-5R dual band handheld transceiver.

## Build instructions.

1. Check out the toolchain repo:

   ```
   % git clone git@github.com:radiodoc/open-toolchain.git toolchain
   ```

2. Clone the manual repo and enter the directory:

   ```
   % git clone git@github.com:radiodoc/uv-5r.git
   % cd uv-5r/
   ```
   
3. Rasterise the SVGs to PNG:

	```
   % make png
   ```

4. Build the various target documents:

   ```
   % make print
   ```
   
### Targets

Tested and working targets:

* `pdf`:  Produces PDFs for both `print` and `ipad` targets.
* `print`: PDF optimised for printing (A4 paper, double sided printing, expanded targets and all black).
* `ipad`: Web optimised PDF (no empty verso pages, all references hyperlinked and coloured).
* `kindle`: PDF optimised for the small monochrome screen on the kindle (actual reflowable `.mobi` not currently a viable option).

Experimental and broken targets:

* `epub`: Produces a reflowable `.epub` document for non-Amazon e-readers.
  * Known issues:  Image assets not resizing properly and breaking layouts.
* `html`: Chunked HTML for web viewing.  Stylesheets not finished and buggy.