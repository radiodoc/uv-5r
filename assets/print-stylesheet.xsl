<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
		xmlns:fo="http://www.w3.org/1999/XSL/Format"
		version='1.0'>
<!--
	<xsl:param name="fop1.extension">1</xsl:param>
-->
	<xsl:import href="fo-stylesheet.xsl"/>

	<!-- Page related Settings -->
	<xsl:param name="paper.type">A4</xsl:param>
	<xsl:param name="page.margin.top">1in</xsl:param>
	<xsl:param name="page.margin.bottom">1in</xsl:param>
	<xsl:param name="page.margin.outer">1in</xsl:param>
	<xsl:param name="page.margin.inner">1in</xsl:param>
	<xsl:param name="section.margin.bottom">2em</xsl:param>

	<xsl:param name="callout.unicode">1</xsl:param>
	<xsl:param name="callout.graphics">0</xsl:param>

	<!-- Custom font settings 
	<xsl:param name="title.font.family">sans-serif,SimHei</xsl:param>
	<xsl:param name="body.font.family">serif,SimSun</xsl:param>
	<xsl:param name="sans.font.family">sans-serif,SimHei</xsl:param>
	<xsl:param name="dingbat.font.family">serif,SimSun</xsl:param>
	<xsl:param name="monospace.font.family">monospace,FangSong,SimSun</xsl:param>
-->

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
		<xsl:attribute name="color">
			<xsl:choose>
				<xsl:when test="self::glossterm">blue</xsl:when>
				<xsl:when test="self::ulink">blue</xsl:when>
				<xsl:when test="self::xref">blue</xsl:when>
				<xsl:when test="self::uri">blue</xsl:when>
				<xsl:otherwise>red</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
	</xsl:attribute-set>
<!--

	<xsl:attribute-set name="sidebar.properties" use-attribute-sets="formal.object.properties">
		<xsl:attribute name="border-style">solid</xsl:attribute>
		<xsl:attribute name="border-width">.1mm</xsl:attribute>
		<xsl:attribute name="background-color">#EEEEEE</xsl:attribute>
	</xsl:attribute-set>
-->

</xsl:stylesheet>