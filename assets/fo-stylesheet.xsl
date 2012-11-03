<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                version='1.0'>
        <xsl:import href="docbook-xsl-1.77.1/fo/docbook.xsl"/>
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


    <xsl:param name="header.image.filename" select="../build/xlestronix-logo.png"/>

    <xsl:param name="header.column.widths">1 0 1</xsl:param>
    <xsl:param name="marker.section.level" select="1"/>
    <xsl:template name="header.content">  
        <xsl:param name="pageclass" select="''"/>
        <xsl:param name="sequence" select="''"/>
        <xsl:param name="position" select="''"/>
        <xsl:param name="gentext-key" select="''"/>
        <fo:block>  
            <!-- sequence can be odd, even, first, blank -->
            <!-- position can be left, center, right -->
            <xsl:choose>
                <!-- First page -->
                <xsl:when test="$sequence = 'first' and $position = 'left'"> 
                    <!-- <xsl:text>first left</xsl:text> -->
                </xsl:when>
                <xsl:when test="$sequence = 'first' and $position = 'center'"> 
                    <!-- <xsl:text>first center</xsl:text> -->
                </xsl:when>
                <xsl:when test="$sequence = 'first' and $position = 'right'">  
                    <xsl:value-of select="ancestor-or-self::book/title"/>  
                </xsl:when>


                <!-- Odd page, single sided uses this layout only -->
                <xsl:when test="$sequence = 'odd' and $position = 'left'">  
                    <fo:retrieve-marker 
                        retrieve-class-name="section.head.marker"  
                        retrieve-position="first-including-carryover"
                        retrieve-boundary="page-sequence"/>
                </xsl:when>
                <xsl:when test="$sequence = 'odd' and $position = 'center'">
<!--                    <xsl:call-template name="draft.text"/>  -->
                </xsl:when>
                <xsl:when test="$sequence = 'odd' and $position = 'right'">
                    <xsl:value-of select="ancestor-or-self::book/title"/>  
                    <!-- 
                    <fo:external-graphic content-height="1.2cm">
                        <xsl:attribute name="src">
                            <xsl:call-template name="fo-external-image">
                                <xsl:with-param name="filename" select="$header.image.filename"/>
                                <xsl:with-param name="filename" select="../build/xlestronix-logo.png"/>
                            </xsl:call-template>
                        </xsl:attribute>
                    </fo:external-graphic>
                    -->
                    <!-- <xsl:text>odd right</xsl:text> -->
                </xsl:when>


                <!-- Even page, only used in double sided -->
                <xsl:when test="$sequence = 'even' and $position = 'left'">  
                    <xsl:text>The (Chinese) Radio Documentation Project</xsl:text>
                </xsl:when>
                <xsl:when test="$sequence = 'even' and $position = 'center'">
                    <xsl:call-template name="draft.text"/>
                </xsl:when>
                <xsl:when test="$sequence = 'even' and $position = 'right'">
                    <!-- <xsl:apply-templates select="." mode="titleabbrev.markup"/> -->
                </xsl:when>


                <!-- Blank page, only used in double sided -->
                <xsl:when test="$sequence = 'blank' and $position = 'left'">
                    <xsl:text>The (Chinese) Radio Documentation Project</xsl:text>
                    <!-- <xsl:text>blank left</xsl:text> -->
                </xsl:when>
                <xsl:when test="$sequence = 'blank' and $position = 'center'">
                    <!-- <xsl:text>This page intentionally left blank</xsl:text> -->
                </xsl:when>
                <xsl:when test="$sequence = 'blank' and $position = 'right'">
                    <!-- <xsl:apply-templates select="." mode="titleabbrev.markup"/> -->
                </xsl:when>

            </xsl:choose>
        </fo:block>
    </xsl:template>
    
    <xsl:param name="footer.column.widths">1 0 1</xsl:param>
    <xsl:template name="footer.content">  
        <xsl:param name="pageclass" select="''"/>
        <xsl:param name="sequence" select="''"/>
        <xsl:param name="position" select="''"/>
        <xsl:param name="gentext-key" select="''"/>
        <fo:block>  
            <!-- sequence can be odd, even, first, blank -->
            <!-- position can be left, center, right -->
            <xsl:choose>
                <!-- First page -->
                <xsl:when test="$sequence = 'first' and $position = 'left'"> 
                    <!-- <xsl:text>first left</xsl:text> -->
                </xsl:when>
                <xsl:when test="$sequence = 'first' and $position = 'center'"> 
                    <!-- <xsl:text>first center</xsl:text> -->
                </xsl:when>
                <xsl:when test="$sequence = 'first' and $position = 'right'">  
                    <!-- <xsl:text>first right</xsl:text> -->
                    <fo:page-number/>
                </xsl:when>


                <!-- Odd page, single sided uses this layout only -->
                <xsl:when test="$sequence = 'odd' and $position = 'left'">  
                    <xsl:apply-templates select="." mode="object.title.markup"/>
                </xsl:when>
                <xsl:when test="$sequence = 'odd' and $position = 'center'">
                    <!-- <xsl:text>odd center</xsl:text> -->
                </xsl:when>
                <xsl:when test="$sequence = 'odd' and $position = 'right'">
                    <fo:page-number/>
                </xsl:when>


                <!-- Even page, only used in double sided -->
                <xsl:when test="$sequence = 'even' and $position = 'left'">  
                    <fo:page-number/>
                </xsl:when>
                <xsl:when test="$sequence = 'even' and $position = 'center'">
                    <!-- <xsl:text>even center</xsl:text> -->
                </xsl:when>
                <xsl:when test="$sequence = 'even' and $position = 'right'">
                    <xsl:apply-templates select="." mode="titleabbrev.markup"/>  
                </xsl:when>


                <!-- Blank page, only used in double sided -->
                <xsl:when test="$sequence = 'blank' and $position = 'left'">
                    <fo:page-number/>
                </xsl:when>
                <xsl:when test="$sequence = 'blank' and $position = 'center'">
                    <!-- <xsl:text>blank center</xsl:text> -->
                </xsl:when>
                <xsl:when test="$sequence = 'blank' and $position = 'right'">
                    <!-- <xsl:text>blank right</xsl:text> -->
                    <xsl:apply-templates select="." mode="titleabbrev.markup"/>  
                </xsl:when>

            </xsl:choose>
        </fo:block>
    </xsl:template>
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


        <!-- Page related Settings -->
        <!--
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

<!--

        <xsl:attribute-set name="sidebar.properties" use-attribute-sets="formal.object.properties">
                <xsl:attribute name="border-style">solid</xsl:attribute>
                <xsl:attribute name="border-width">.1mm</xsl:attribute>
                <xsl:attribute name="background-color">#EEEEEE</xsl:attribute>
        </xsl:attribute-set>
-->

</xsl:stylesheet>