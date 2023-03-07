<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="processing-instruction('pagebreak')">
        
        <fo:block break-after="page"></fo:block>
        
    </xsl:template>
</xsl:stylesheet>