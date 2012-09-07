<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
		xmlns:fo="http://www.w3.org/1999/XSL/Format"
		version='1.0'>
<!--
	<xsl:param name="fop1.extension">1</xsl:param>
-->
	<xsl:import href="fo-stylesheet.xsl"/>
<!--
	<xsl:template name="book.titlepage.recto">
	<fo:block>
		<fo:external-graphic src="url(images/logo.png)"/> 
	</fo:block>
	</xsl:template>

	 <xsl:template match="title">
		<xsl:choose>
			<xsl:when test="(parent::section)">
				<fo:block break-before="page">   
					<xsl:apply-imports />
				</fo:block>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-imports />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
-->
<!-- PARAMETER REFERENCE:                                       -->
	<!-- http://docbook.sourceforge.net/release/xsl/current/doc/fo/ -->

	<!-- Move to FO_XSLTPROC_OPTS for support fop1 and xep, etc.
	<xsl:param name="fop.extensions" select="1" />
	-->

	<!-- xsltproc can't support these extensions
	<xsl:param name="use.extensions">1</xsl:param>
	<xsl:param name="callouts.extension">1</xsl:param>
	<xsl:param name="linenumbering.extension">1</xsl:param>
	<xsl:param name="tablecolumns.extension">1</xsl:param>
	<xsl:param name="textinsert.extension">1</xsl:param>
	-->


	<!-- iPad screen: 196x146mm -->
	<!-- Page related Settings -->
	<xsl:param name="page.height">200mm</xsl:param>
	<xsl:param name="page.width">150mm</xsl:param>
	<xsl:param name="page.margin.top">2mm</xsl:param>
	<xsl:param name="page.margin.bottom">2mm</xsl:param>
	<xsl:param name="page.margin.outer">5mm</xsl:param>
	<xsl:param name="page.margin.inner">5mm</xsl:param>


	<xsl:param name="callout.unicode">1</xsl:param>
	<xsl:param name="callout.graphics">0</xsl:param>

	<!--
	<xsl:param name="double.sided">1</xsl:param>
	<xsl:param name="double.sided" select="1" />
	<xsl:param name="title.margin.left">0pt</xsl:param>
	<xsl:param name="body.start.indent">0pt</xsl:param>
	<xsl:param name="body.end.indent">0pt</xsl:param>
<fo:simple-page-master master-name="A4" page-width="297mm"
	page-height="210mm" margin-top="1cm" margin-bottom="1cm"
	margin-left="1cm" margin-right="1cm">
	<fo:region-body margin="3cm"/>
	<fo:region-before extent="2cm"/>
	<fo:region-after extent="2cm"/>
	<fo:region-start extent="2cm"/>
	<fo:region-end extent="2cm"/>
</fo:simple-page-master>
-->

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
				<xsl:when test="self::link">blue</xsl:when>
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