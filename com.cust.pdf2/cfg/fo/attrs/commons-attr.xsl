<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="2.0">
    
    <xsl:attribute-set name="__force__page__count">
        <xsl:attribute name="force-page-count">
            <xsl:choose>
                <xsl:when test="/*[contains(@class, ' bookmap/bookmap ')]">
                    <xsl:value-of select="'auto'"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="'auto'"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>
    
    <!-- titles -->
    <xsl:attribute-set name="common.title">
        <xsl:attribute name="font-family">Ubuntu</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="base-font">
        <xsl:attribute name="font-size"><xsl:value-of select="$default-font-size"/></xsl:attribute>
        <xsl:attribute name="font-family">Ubuntu</xsl:attribute>
    </xsl:attribute-set>
    
    
</xsl:stylesheet>