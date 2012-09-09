<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
		xmlns:fo="http://www.w3.org/1999/XSL/Format"
		version='1.0'>
	<xsl:import href="base-stylesheet.xsl"/>

	<xsl:param name="fop1.extensions">1</xsl:param>
	<xsl:param name="generate.toc">
		appendix  nop
		article   nop
		book      toc,title
		chapter   nop
		part      nop
		preface   nop
		qandadiv  nop
		qandaset  nop
		reference nop
		sect1     nop
		sect2     nop
		sect3     nop
		sect4     nop
		sect5     nop
		section   nop
		set       nop
	</xsl:param>
</xsl:stylesheet>
