<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="2.0">
    
    <!--scale block images-->
    <xsl:attribute-set name="image__block">
        <xsl:attribute name="content-width">scale-to-fit</xsl:attribute>
        <xsl:attribute name="content-height">100%</xsl:attribute>
        <xsl:attribute name="width">100%</xsl:attribute>
        <xsl:attribute name="scaling">uniform</xsl:attribute>
    </xsl:attribute-set>
    
    <!--scale inline images-->
    <xsl:attribute-set name="image__inline">
        <xsl:attribute name="content-width">auto</xsl:attribute>
        <xsl:attribute name="content-height">auto</xsl:attribute>
        <xsl:attribute name="width">auto</xsl:attribute>
        <xsl:attribute name="scaling">uniform</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="draft-comment__border">
        <xsl:attribute name="border-color">red</xsl:attribute>
        <xsl:attribute name="border-width">1pt</xsl:attribute>
        <xsl:attribute name="border-style">solid</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="draft-comment" use-attribute-sets="draft-comment__border">
        <xsl:attribute name="background-color">#FFDEAD</xsl:attribute>
        <xsl:attribute name="color">#000000</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="draft-comment__label">
        <xsl:attribute name="font-weight">bold</xsl:attribute>
    </xsl:attribute-set>
    
    <!--  MMCL 2021-5-28 - Note styles  -->
    <xsl:attribute-set name="note">
        <xsl:attribute name="border-left">2pt solid #ffae1a</xsl:attribute>
        <xsl:attribute name="padding-left">5pt</xsl:attribute>
        <xsl:attribute name="padding-top">5pt</xsl:attribute>
        <xsl:attribute name="padding-bottom">5pt</xsl:attribute>
        <xsl:attribute name="background-color">#f5f8fa</xsl:attribute>
        <xsl:attribute name="border-bottom">0.5px solid #5d6f7a</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="note__label__note">
        <xsl:attribute name="border-start-width">0pt</xsl:attribute>
        <xsl:attribute name="border-end-width">0pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="remember">
        <xsl:attribute name="border-left">2pt solid #ffae1a</xsl:attribute>
        <xsl:attribute name="padding-left">5pt</xsl:attribute>
        <xsl:attribute name="padding-top">5pt</xsl:attribute>
        <xsl:attribute name="padding-bottom">5pt</xsl:attribute>
        <xsl:attribute name="background-color">#f5f8fa</xsl:attribute>
        <xsl:attribute name="border-bottom">0.5px solid #5d6f7a</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="note__label__remember">
        <xsl:attribute name="border-start-width">0pt</xsl:attribute>
        <xsl:attribute name="border-end-width">0pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="tip">
        <xsl:attribute name="border-left">2pt solid #58a1f5</xsl:attribute>
        <xsl:attribute name="padding-left">5pt</xsl:attribute>
        <xsl:attribute name="padding-top">5pt</xsl:attribute>
        <xsl:attribute name="padding-bottom">5pt</xsl:attribute>
        <xsl:attribute name="margin-top">2pt</xsl:attribute>
        <xsl:attribute name="background-color">#f5f8fa</xsl:attribute>
        <xsl:attribute name="border-bottom">0.5px solid #5d6f7a</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="note__label__tip">
        <xsl:attribute name="border-start-width">0pt</xsl:attribute>
        <xsl:attribute name="border-end-width">0pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="important">
        <xsl:attribute name="border-left">2pt solid #a263ff</xsl:attribute>
        <xsl:attribute name="padding-left">5pt</xsl:attribute>
        <xsl:attribute name="padding-top">5pt</xsl:attribute>
        <xsl:attribute name="padding-bottom">5pt</xsl:attribute>
        <xsl:attribute name="margin-top">2pt</xsl:attribute>
        <xsl:attribute name="background-color">#f5f8fa</xsl:attribute>
        <xsl:attribute name="border-bottom">0.5px solid #5d6f7a</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="note__label__important">
        <xsl:attribute name="border-start-width">0pt</xsl:attribute>
        <xsl:attribute name="border-end-width">0pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="restriction">
        <xsl:attribute name="border-left">2pt solid #ffa899</xsl:attribute>
        <xsl:attribute name="padding-left">5pt</xsl:attribute>
        <xsl:attribute name="padding-top">5pt</xsl:attribute>
        <xsl:attribute name="padding-bottom">5pt</xsl:attribute>
        <xsl:attribute name="background-color">#f5f8fa</xsl:attribute>
        <xsl:attribute name="border-bottom">0.5px solid #5d6f7a</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="note__label__restriction">
        <xsl:attribute name="border-start-width">0pt</xsl:attribute>
        <xsl:attribute name="border-end-width">0pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="caution">
        <xsl:attribute name="border-left">2pt solid #d63700</xsl:attribute>
        <xsl:attribute name="padding-left">5pt</xsl:attribute>
        <xsl:attribute name="padding-top">5pt</xsl:attribute>
        <xsl:attribute name="padding-bottom">5pt</xsl:attribute>
        <xsl:attribute name="background-color">#f5f8fa</xsl:attribute>
        <xsl:attribute name="border-bottom">0.5px solid #5d6f7a</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="note__label__caution">
        <xsl:attribute name="border-start-width">0pt</xsl:attribute>
        <xsl:attribute name="border-end-width">0pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="other">
        <xsl:attribute name="border-left">2pt solid #149380</xsl:attribute>
        <xsl:attribute name="padding-left">5pt</xsl:attribute>
        <xsl:attribute name="padding-top">5pt</xsl:attribute>
        <xsl:attribute name="padding-bottom">5pt</xsl:attribute>
        <xsl:attribute name="background-color">#f5f8fa</xsl:attribute>
        <xsl:attribute name="border-bottom">0.5px solid #5d6f7a</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="note__label__other">
        <xsl:attribute name="border-start-width">0pt</xsl:attribute>
        <xsl:attribute name="border-end-width">0pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
    </xsl:attribute-set>
    
    <!-- titles -->
    
    <xsl:attribute-set name="topic.title" use-attribute-sets="common.title common.border__bottom">
        <xsl:attribute name="border-after-width">0pt</xsl:attribute>
        <xsl:attribute name="space-before">0pt</xsl:attribute>
        <xsl:attribute name="space-after">16.8pt</xsl:attribute>
        <xsl:attribute name="font-size">20pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="padding-top">16.8pt</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
        <xsl:attribute name="color">#09C9FF</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="topic.title__content">
        <xsl:attribute name="line-height">100%</xsl:attribute>
        <xsl:attribute name="border-start-width">0pt</xsl:attribute>
        <xsl:attribute name="border-end-width">0pt</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="topic.topic.title" use-attribute-sets="common.title common.border__bottom">
        <xsl:attribute name="space-before">15pt</xsl:attribute>
        <xsl:attribute name="space-before">12pt</xsl:attribute>
        <xsl:attribute name="space-after">5pt</xsl:attribute>
        <xsl:attribute name="font-size">16pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="padding-top">12pt</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
        <xsl:attribute name="color">#003050</xsl:attribute>
        <xsl:attribute name="border-width">0pt</xsl:attribute>
        <xsl:attribute name="border-after-width">0pt</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="topic.topic.title__content">
        <xsl:attribute name="border-start-width">0pt</xsl:attribute>
        <xsl:attribute name="border-end-width">0pt</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="topic.topic.topic.title" use-attribute-sets="common.title">
        <xsl:attribute name="space-before">12pt</xsl:attribute>
        <xsl:attribute name="space-after">2pt</xsl:attribute>
        <xsl:attribute name="font-size">14pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
        <xsl:attribute name="color">#003050</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="topic.topic.topic.title__content">
    </xsl:attribute-set>
    
    <xsl:attribute-set name="topic.topic.topic.topic.title" use-attribute-sets="base-font common.title">
        <xsl:attribute name="space-before">10pt</xsl:attribute>
        <xsl:attribute name="start-indent"><xsl:value-of select="$side-col-width"/></xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="topic.topic.topic.topic.title__content">
    </xsl:attribute-set>
    
    <xsl:attribute-set name="topic.topic.topic.topic.topic.title" use-attribute-sets="base-font common.title">
        <xsl:attribute name="start-indent"><xsl:value-of select="$side-col-width"/></xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
        <xsl:attribute name="color">#003050</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="topic.topic.topic.topic.topic.title__content">
    </xsl:attribute-set>
    
    <xsl:attribute-set name="topic.topic.topic.topic.topic.topic.title" use-attribute-sets="base-font common.title">
        <xsl:attribute name="start-indent"><xsl:value-of select="$side-col-width"/></xsl:attribute>
        <xsl:attribute name="font-style">italic</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
        <xsl:attribute name="color">#003050</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="topic.topic.topic.topic.topic.topic.title__content">
    </xsl:attribute-set>
    
    <xsl:attribute-set name="section.title" use-attribute-sets="common.title">
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="space-before">15pt</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
        <xsl:attribute name="color">#003050</xsl:attribute>
        <xsl:attribute name="border-start-width">0pt</xsl:attribute>
        <xsl:attribute name="border-end-width">0pt</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="example.title" use-attribute-sets="common.title">
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
        <xsl:attribute name="space-after">5pt</xsl:attribute>
        <xsl:attribute name="color">#003050</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="section">
        <xsl:attribute name="space-before">0.6em</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="section__content">
    </xsl:attribute-set>
    
</xsl:stylesheet>