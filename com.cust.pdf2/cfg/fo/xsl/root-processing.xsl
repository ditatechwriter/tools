<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:opentopic-i18n="http://www.idiominc.com/opentopic/i18n"
    xmlns:opentopic-index="http://www.idiominc.com/opentopic/index"
    xmlns:opentopic="http://www.idiominc.com/opentopic"
    xmlns:opentopic-func="http://www.idiominc.com/opentopic/exsl/function"
    xmlns:ot-placeholder="http://suite-sol.com/namespaces/ot-placeholder"
    xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot"
    exclude-result-prefixes="opentopic-index opentopic opentopic-i18n opentopic-func dita-ot xs ot-placeholder"
    version="2.0">
    
    <!-- Variables -->
    
    <xsl:variable name="productName">
        <xsl:variable name="mapProdname" select="(/*/opentopic:map//*[contains(@class, ' topic/prodname ')])[1]" as="element()?"/>
        <xsl:choose>
            <xsl:when test="exists($mapProdname)">
                <xsl:apply-templates select="$mapProdname" mode="set-product-name"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="getVariable">
                    <xsl:with-param name="id" select="'Product Name'"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    
    <xsl:variable name="bookTitle" select="(/*/opentopic:map//*[contains(@class, ' bookmap/mainbooktitle ')])[1]" as="element()?"/>
    
    <xsl:variable name="productVersion" select="(/*/opentopic:map//*[contains(@class, ' topic/vrm ')]/@version)[1]"/>
    
    <xsl:variable name="copyright" select="(/*/opentopic:map//*[contains(@class, ' bookmap/organization ')])[1]"/>
    
    <xsl:variable name="copyryear" select="(/*/opentopic:map//*[contains(@class, ' bookmap/copyrfirst ')]/*[contains(@class, ' bookmap/year ')])[1]"/>
    
    <xsl:variable name="pubDate" select="(/*/opentopic:map//*[contains(@class, ' topic/revised ')]/@modified)[1]"/>
    
    <xsl:variable name="bookVersion" select="(/*/opentopic:map//*[contains(@class, ' bookmap/revisionid ')])[1]"/>
    
</xsl:stylesheet>