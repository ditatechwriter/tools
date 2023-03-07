<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0"
    exclude-result-prefixes="xs">
    
    <xsl:attribute-set name="__frontmatter__logo">
        <xsl:attribute name="text-align">left</xsl:attribute>
        <xsl:attribute name="margin-top">0mm</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__frontmatter">
        <xsl:attribute name="text-align">center</xsl:attribute>
        <xsl:attribute name="font-size">24pt</xsl:attribute>
        <xsl:attribute name="font-weight">600</xsl:attribute>
        <xsl:attribute name="font-family">Ubuntu</xsl:attribute>
        <xsl:attribute name="color">#09C9FF</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__frontmatter__pubDate">
        <xsl:attribute name="background-color">#FFB52A</xsl:attribute>
        <xsl:attribute name="height">15mm</xsl:attribute>
        <xsl:attribute name="padding-top">3mm</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__frontmatter__pubDate_text">
        <xsl:attribute name="text-align">left</xsl:attribute>
        <xsl:attribute name="font-size">12pt</xsl:attribute>
        <xsl:attribute name="font-weight">300</xsl:attribute>
        <xsl:attribute name="font-family">Ubuntu</xsl:attribute>
        <xsl:attribute name="color">white</xsl:attribute>
        <xsl:attribute name="margin-left">15mm</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__frontmatter__prodname">
        <xsl:attribute name="text-align">center</xsl:attribute>
        <xsl:attribute name="font-size">30pt</xsl:attribute>
        <xsl:attribute name="font-weight">600</xsl:attribute>
        <xsl:attribute name="font-family">Ubuntu</xsl:attribute>
        <xsl:attribute name="color">#09C9FF</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__frontmatter__docname">
        <xsl:attribute name="text-align">center</xsl:attribute>
        <xsl:attribute name="font-size">24pt</xsl:attribute>
        <xsl:attribute name="font-weight">600</xsl:attribute>
        <xsl:attribute name="font-family">Ubuntu</xsl:attribute>
        <xsl:attribute name="color">#09C9FF</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__backmatter__bg">
        <xsl:attribute name="background-color">#003050</xsl:attribute>
        <xsl:attribute name="width">8.5in</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__backmatter__logo">
        <xsl:attribute name="position">absolute</xsl:attribute>
        <xsl:attribute name="margin-top">55mm</xsl:attribute>
        <xsl:attribute name="margin-left">6.0in</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__backmatter__strapline">
        <xsl:attribute name="color">white</xsl:attribute>
        <xsl:attribute name="font-size">27pt</xsl:attribute>
        <xsl:attribute name="font-family">Helvetica</xsl:attribute>
        <xsl:attribute name="margin-top">75mm</xsl:attribute>
        <xsl:attribute name="margin-left">40mm</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__backmatter__addr">
        <xsl:attribute name="margin-left">6.0in</xsl:attribute>
        <xsl:attribute name="color">white</xsl:attribute>
        <xsl:attribute name="font-size">12pt</xsl:attribute>
        <xsl:attribute name="font-family">Helvetica</xsl:attribute>
    </xsl:attribute-set>
    
</xsl:stylesheet>