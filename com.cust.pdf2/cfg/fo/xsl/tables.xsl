<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:opentopic-func="http://www.idiominc.com/opentopic/exsl/function"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:dita2xslfo="http://dita-ot.sourceforge.net/ns/200910/dita2xslfo"
    xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot"
    exclude-result-prefixes="opentopic-func xs dita2xslfo dita-ot"
    version="2.0">
    
 
    <!--  DEFINITION LIST -->
    <!-- KLL 2018-12-12: DIP-114 Change how Definition Lists are output in PDF -->
    <xsl:template match="*[contains(@class, ' topic/dl ')]">
        <!--<fo:table xsl:use-attribute-sets="dl">-->
        <xsl:call-template name="commonattributes"/>
        <xsl:apply-templates select="*[contains(@class, ' topic/dlhead ')]"/>
        <!--<fo:table-body xsl:use-attribute-sets="dl__body">-->
        <xsl:choose>
            <xsl:when test="contains(@otherprops, 'sortable')">
                <xsl:apply-templates select="*[contains(@class, ' topic/dlentry ')]">
                    <xsl:sort select="opentopic-func:getSortString(normalize-space(opentopic-func:fetchValueableText(*[contains(@class, ' topic/dt ')])))" lang="{$locale}"/>
                </xsl:apply-templates>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="*[contains(@class, ' topic/dlentry ')]"/>
            </xsl:otherwise>
        </xsl:choose>
        <!--</fo:table-body>-->
        <!--</fo:table>-->
    </xsl:template>
    <xsl:template match="*[contains(@class, ' topic/dl ')]/*[contains(@class, ' topic/dlhead ')]">
        <!--<fo:table-header xsl:use-attribute-sets="dl.dlhead">-->
        <xsl:call-template name="commonattributes"/>
        <!--<fo:table-row xsl:use-attribute-sets="dl.dlhead__row">-->
        <xsl:apply-templates/>
        <!--</fo:table-row>-->
        <!--</fo:table-header>-->
    </xsl:template>
    <xsl:template match="*[contains(@class, ' topic/dlhead ')]/*[contains(@class, ' topic/dthd ')]">
        <!--<fo:table-cell xsl:use-attribute-sets="dlhead.dthd__cell">-->
        <xsl:call-template name="commonattributes"/>
        <fo:block xsl:use-attribute-sets="dlhead.dthd__content">
            <xsl:apply-templates/>
        </fo:block>
        <!--</fo:table-cell>-->
    </xsl:template>
    <xsl:template match="*[contains(@class, ' topic/dlhead ')]/*[contains(@class, ' topic/ddhd ')]">
        <!--<fo:table-cell xsl:use-attribute-sets="dlhead.ddhd__cell">-->
        <xsl:call-template name="commonattributes"/>
        <fo:block xsl:use-attribute-sets="dlhead.ddhd__content">
            <xsl:apply-templates/>
        </fo:block>
        <!--</fo:table-cell>-->
    </xsl:template>
    <xsl:template match="*[contains(@class, ' topic/dlentry ')]">
        <!--<fo:table-row xsl:use-attribute-sets="dlentry">-->
        <xsl:call-template name="commonattributes"/>
        <fo:block xsl:use-attribute-sets="dlentry.dt">
            <xsl:apply-templates select="*[contains(@class, ' topic/dt ')]"/>
        </fo:block>
        <fo:block xsl:use-attribute-sets="dlentry.dd">
            <xsl:apply-templates select="*[contains(@class, ' topic/dd ')]"/>
        </fo:block>
        <!--</fo:table-row>-->
    </xsl:template>
    <xsl:template match="*[contains(@class, ' topic/dt ')]">
        <fo:block xsl:use-attribute-sets="dlentry.dt__content">
            <xsl:call-template name="commonattributes"/>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    <xsl:template match="*[contains(@class, ' topic/dd ')]">
        <fo:block xsl:use-attribute-sets="dlentry.dd__content">
            <xsl:call-template name="commonattributes"/>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

</xsl:stylesheet>