<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
		xmlns:fo="http://www.w3.org/1999/XSL/Format"
		version='1.0'>

	<xsl:import href="fo-stylesheet.xsl"/>

	<!-- Page related Settings -->
	<xsl:param name="double.sided">1</xsl:param>
	<xsl:param name="paper.type">A4</xsl:param>

<!--
	<xsl:param name="page.margin.top">1in</xsl:param>
	<xsl:param name="page.margin.bottom">1in</xsl:param>
	<xsl:param name="page.margin.outer">1in</xsl:param>
	<xsl:param name="page.margin.inner">1in</xsl:param>
-->

<!-- Van de Graaf:
-->
	<xsl:param name="page.margin.top">16.5mm</xsl:param>
	<xsl:param name="page.margin.bottom">33mm</xsl:param>

	<xsl:param name="body.margin.top">16.5mm</xsl:param>
	<xsl:param name="body.margin.bottom">33mm</xsl:param>

	<xsl:param name="region.before.extent">16.6mm</xsl:param>
	<xsl:param name="region.after.extent">33mm</xsl:param>


	<xsl:param name="page.margin.inner">23mm</xsl:param>
	<xsl:param name="page.margin.outer">47mm</xsl:param>
	<xsl:param name="section.margin.bottom">2em</xsl:param>

 	
	<!-- Custom font settings 
	<xsl:template match="link">
		<xsl:text>[</xsl:text>
		<xsl:call-template name="inline.boldseq"/>
		<xsl:text>]</xsl:text>
	</xsl:template>

-->
	<xsl:param name="callout.unicode">1</xsl:param>
	<xsl:param name="callout.graphics">0</xsl:param>

	<xsl:param name="title.font.family">sans-serif,SimHei</xsl:param>
	<xsl:param name="body.font.family">serif,SimSun</xsl:param>
	<xsl:param name="sans.font.family">sans-serif,SimHei</xsl:param>
	<xsl:param name="dingbat.font.family">serif,SimSun</xsl:param>
	<xsl:param name="monospace.font.family">monospace,FangSong,SimSun</xsl:param>

	<xsl:attribute-set name="part.properties">
		<xsl:attribute name="border-style">solid</xsl:attribute>
		<xsl:attribute name="border-width">.1mm</xsl:attribute>
		<xsl:attribute name="background-color">#EEEEEE</xsl:attribute>
	</xsl:attribute-set>

	<!-- Admonitions and callouts settings 
	<xsl:param name="admon.textlabel" select="0" />
	<xsl:param name="admon.graphics" select="1" />
	<xsl:param name="admon.graphics.path">images/</xsl:param>
	<xsl:param name="admon.graphics.extension">.png</xsl:param>
	<xsl:param name="callout.graphics" select="1" />
	<xsl:param name="callout.graphics.extension">.png</xsl:param>

	<xsl:param name="variablelist.as.blocks" select="1" />
-->

	<!-- Uncomment this to enable auto-numbering of sections -->
	<!-- xsl:param name="section.autolabel" select="1" / -->

	<!-- Breaking long lines 
	<xsl:param name="hyphenate.verbatim">0</xsl:param>
	<xsl:attribute-set name="monospace.verbatim.properties"
			use-attribute-sets="verbatim.properties monospace.properties">
		<xsl:attribute name="wrap-option">wrap</xsl:attribute>
		<xsl:attribute name="hyphenation-character">&#x25BA;</xsl:attribute>
	</xsl:attribute-set>
-->

	<!-- Colourize links in output -->
	<xsl:attribute-set name="xref.properties">
		<xsl:attribute name="color">black</xsl:attribute>
	</xsl:attribute-set>
<!--

	<xsl:attribute-set name="sidebar.properties" use-attribute-sets="formal.object.properties">
		<xsl:attribute name="border-style">solid</xsl:attribute>
		<xsl:attribute name="border-width">.1mm</xsl:attribute>
		<xsl:attribute name="background-color">#EEEEEE</xsl:attribute>
	</xsl:attribute-set>
-->

</xsl:stylesheet>