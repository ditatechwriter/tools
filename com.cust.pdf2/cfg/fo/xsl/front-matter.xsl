<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:opentopic="http://www.idiominc.com/opentopic"
    exclude-result-prefixes="opentopic"
    version="2.0">
 
    <xsl:template name="createFrontMatter">
        <xsl:if test="$generate-front-cover">
            <fo:page-sequence master-reference="front-matter" xsl:use-attribute-sets="page-sequence.cover">
                <xsl:call-template name="insertFrontMatterStaticContents"/>
                <fo:flow flow-name="xsl-region-body">
                    <fo:block-container xsl:use-attribute-sets="__frontmatter">
                        <xsl:call-template name="createFrontCoverContents"/>
                    </fo:block-container>
                </fo:flow>
            </fo:page-sequence>
        </xsl:if>
    </xsl:template>
    
    <xsl:template name="createFrontCoverContents">
        <!-- Add logo - MMcL -->
        <fo:block-container absolute-position="absolute" top="0cm" left="0cm">
            <fo:block xsl:use-attribute-sets="__frontmatter__logo">
                <fo:external-graphic src="url(Customization/OpenTopic/common/artwork/optiva-cover.jpg)"/>
            </fo:block>
        </fo:block-container>
        <fo:block-container absolute-position="absolute" top="15cm" left="0cm">
            <fo:block xsl:use-attribute-sets="__frontmatter__prodname">
                <xsl:value-of select="$productName"/><xsl:text> </xsl:text><xsl:value-of select="$productVersion"/>
            </fo:block>
            <fo:block xsl:use-attribute-sets="__frontmatter__docname">
                <xsl:value-of select="$bookTitle"/>
            </fo:block>
        </fo:block-container>
        <!-- set the title --><!--
        <fo:block xsl:use-attribute-sets="__frontmatter__title">
            <xsl:choose>
                <xsl:when test="$map/*[contains(@class,' topic/title ')][1]">
                    <xsl:apply-templates select="$map/*[contains(@class,' topic/title ')][1]"/>
                </xsl:when>
                <xsl:when test="$map//*[contains(@class,' bookmap/mainbooktitle ')][1]">
                    <xsl:apply-templates select="$map//*[contains(@class,' bookmap/mainbooktitle ')][1]"/>
                </xsl:when>
                <xsl:when test="//*[contains(@class, ' map/map ')]/@title">
                    <xsl:value-of select="//*[contains(@class, ' map/map ')]/@title"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="/descendant::*[contains(@class, ' topic/topic ')][1]/*[contains(@class, ' topic/title ')]"/>
                </xsl:otherwise>
            </xsl:choose>
        </fo:block>-->
        
        <!--<fo:block-container>
            <xsl:apply-templates select="$map//*[contains(@class,' topic/prodname ')]"/>
            <fo:block xsl:use-attribute-sets="__frontmatter__owner">
                <xsl:apply-templates select="$map/*[contains(@class,' topic/prodname ')]"/>
                <xsl:apply-templates select="$map/*[contains(@class,' topic/vrm ')]"/>
            </fo:block> 
        </fo:block-container>-->
        
        <fo:block-container absolute-position="absolute" top="24cm" left="0cm" xsl:use-attribute-sets="__frontmatter__pubDate">
            <fo:block xsl:use-attribute-sets="__frontmatter__pubDate_text"><xsl:text>Document version: </xsl:text> <xsl:value-of select="$bookVersion"/></fo:block>
            <fo:block xsl:use-attribute-sets="__frontmatter__pubDate_text">
                <xsl:text>Published: </xsl:text><xsl:value-of select="$pubDate"/>
            </fo:block>
        </fo:block-container>
         <!--set the subtitle -->
    </xsl:template>
    
    <xsl:template name="createBackCover">
        <xsl:if test="$generate-back-cover">
            <fo:page-sequence master-reference="back-cover" xsl:use-attribute-sets="back-cover">
                <xsl:call-template name="insertBackCoverStaticContents"/>
                <fo:flow flow-name="xsl-region-body">
                    <fo:block-container xsl:use-attribute-sets="__back-cover">
                        <xsl:call-template name="createBackCoverContents"/>
                    </fo:block-container>
                </fo:flow>
            </fo:page-sequence>
        </xsl:if>
    </xsl:template>
    
    <xsl:template name="createBackCoverContents">
        <fo:block-container xsl:use-attribute-sets="__backmatter__bg" height="200mm"> 
            <fo:block xsl:use-attribute-sets="__backmatter__strapline">
                <xsl:text>Guiding CSPs to profitable growth</xsl:text>
            </fo:block>
        <fo:block xsl:use-attribute-sets="__backmatter__logo">
                <fo:inline>
                    <fo:external-graphic src="url(Customization/OpenTopic/common/artwork/Optiva_Logo_sm.png)"/>
                </fo:inline>
            </fo:block>
                <fo:block xsl:use-attribute-sets="__backmatter__addr">
                    <fo:inline font-weight="600"><xsl:text>Corporate Headquarters:</xsl:text></fo:inline>
                </fo:block>
                <fo:block xsl:use-attribute-sets="__backmatter__addr"><xsl:text>2233 Argentia Rd., East Tower</xsl:text></fo:block>
                <fo:block xsl:use-attribute-sets="__backmatter__addr"><xsl:text>Suite 302</xsl:text></fo:block>
                <fo:block xsl:use-attribute-sets="__backmatter__addr"><xsl:text>Mississauga, ON</xsl:text></fo:block>
                <fo:block xsl:use-attribute-sets="__backmatter__addr"><xsl:text>Canada L5N 2X7</xsl:text></fo:block>
                <fo:block xsl:use-attribute-sets="__backmatter__addr"><xsl:text>Tel: +1 905 625 2622</xsl:text></fo:block>
       </fo:block-container> 
    </xsl:template>
    

</xsl:stylesheet>