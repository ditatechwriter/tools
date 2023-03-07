<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="2.0">

    <xsl:template match="*" mode="placeImage">
        <xsl:param name="imageAlign"/>
        <xsl:param name="href"/>
        <xsl:param name="height"/>
        <xsl:param name="width"/>
        <!--DITA for Print-->
        <!--Using align attribute set according to image @align attribute-->
        <xsl:choose>
            <xsl:when test="not(@align)">
                <xsl:call-template name="processAttrSetReflection">
                    <xsl:with-param name="attrSet" select="concat('__align__', 'center')"/>
                    <xsl:with-param name="path" select="'../../cfg/fo/attrs/commons-attr.xsl'"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="processAttrSetReflection">
                    <xsl:with-param name="attrSet" select="concat('__align__', $imageAlign)"/>
                    <xsl:with-param name="path" select="'../../cfg/fo/attrs/commons-attr.xsl'"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>               
        <!--DITA for Print-->
        <xsl:choose>
            <xsl:when test="@placement='break'">
                <fo:external-graphic src="url({$href})" xsl:use-attribute-sets="image__block">
                    <!--Setting image height if defined-->
                    <xsl:if test="$height">
                        <xsl:attribute name="content-height">
                            <!--The following test was commented out because most people found the behavior
                 surprising.  It used to force images with a number specified for the dimensions
                 *but no units* to act as a measure of pixels, *if* you were printing at 72 DPI.
                 Uncomment if you really want it. -->
                            <xsl:choose>
                                <!--xsl:when test="not(string(number($height)) = 'NaN')">
                        <xsl:value-of select="concat($height div 72,'in')"/>
                      </xsl:when-->
                                <xsl:when test="not(string(number($height)) = 'NaN')">
                                    <xsl:value-of select="concat($height, 'px')"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$height"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                    </xsl:if>
                    <!--Setting image width if defined-->
                    <xsl:if test="$width">
                        <xsl:attribute name="content-width">
                            <xsl:choose>
                                <!--xsl:when test="not(string(number($width)) = 'NaN')">
                        <xsl:value-of select="concat($width div 72,'in')"/>
                      </xsl:when-->
                                <xsl:when test="not(string(number($width)) = 'NaN')">
                                    <xsl:value-of select="concat($width, 'px')"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$width"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="not($width) and not($height) and @scale">
                        <xsl:attribute name="content-width">
                            <xsl:value-of select="concat(@scale,'%')"/>
                        </xsl:attribute>
                    </xsl:if>
                </fo:external-graphic>
            </xsl:when>			
            <xsl:otherwise>
                <fo:external-graphic src="url({$href})" xsl:use-attribute-sets="image__inline">
                    <!--Setting image height if defined-->
                    <xsl:if test="$height">
                        <xsl:attribute name="content-height">
                            <!--The following test was commented out because most people found the behavior
                 surprising.  It used to force images with a number specified for the dimensions
                 *but no units* to act as a measure of pixels, *if* you were printing at 72 DPI.
                 Uncomment if you really want it. -->
                            <xsl:choose>
                                <!--xsl:when test="not(string(number($height)) = 'NaN')">
                        <xsl:value-of select="concat($height div 72,'in')"/>
                      </xsl:when-->
                                <xsl:when test="not(string(number($height)) = 'NaN')">
                                    <xsl:value-of select="concat($height, 'px')"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$height"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                    </xsl:if>
                    <!--Setting image width if defined-->
                    <xsl:if test="$width">
                        <xsl:attribute name="content-width">
                            <xsl:choose>
                                <!--xsl:when test="not(string(number($width)) = 'NaN')">
                        <xsl:value-of select="concat($width div 72,'in')"/>
                      </xsl:when-->
                                <xsl:when test="not(string(number($width)) = 'NaN')">
                                    <xsl:value-of select="concat($width, 'px')"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$width"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="not($width) and not($height) and @scale">
                        <xsl:attribute name="content-width">
                            <xsl:value-of select="concat(@scale,'%')"/>
                        </xsl:attribute>
                    </xsl:if>
                </fo:external-graphic>
            </xsl:otherwise>
        </xsl:choose>        
    </xsl:template>

    <xsl:template match="*[contains(@class,' topic/draft-comment ')]">
        <xsl:if test="$publishRequiredCleanup = 'yes' or $DRAFT='yes'">
            <fo:block xsl:use-attribute-sets="draft-comment">
                <xsl:call-template name="commonattributes"/>
                <fo:block xsl:use-attribute-sets="draft-comment__label">
                    <xsl:text>Comment: </xsl:text>
                    <!--xsl:text>Disposition: </xsl:text>
                    <xsl:value-of select="@disposition"/>
                    <xsl:text> / </xsl:text>
                    <xsl:text>Status: </xsl:text>
                    <xsl:value-of select="@status"/-->
                </fo:block>
                <xsl:apply-templates/>
            </fo:block>
        </xsl:if>
    </xsl:template>
    
    <!--  MMCL 2021-5-28 - Note styles  -->
    
    <xsl:template match="*" mode="placeNoteContent">
                <xsl:choose>
                    <xsl:when test="@type='note' or not(@type)">
                        <fo:block xsl:use-attribute-sets="note">
                            <xsl:call-template name="commonattributes"/>
                        <fo:inline xsl:use-attribute-sets="note__label__note">
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'Note'"/>
                            </xsl:call-template>
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'#note-separator'"/>
                            </xsl:call-template>
                        </fo:inline>
                            <xsl:text>  </xsl:text>
                            <xsl:apply-templates/>
                        </fo:block>
                    </xsl:when>
                    <xsl:when test="@type='notice'">
                        <fo:block xsl:use-attribute-sets="note">
                            <xsl:call-template name="commonattributes"/>
                        <fo:inline xsl:use-attribute-sets="note__label__notice">
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'Notice'"/>
                            </xsl:call-template>
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'#note-separator'"/>
                            </xsl:call-template>
                        </fo:inline>
                           <xsl:text>  </xsl:text>
                           <xsl:apply-templates/>
                        </fo:block>
                    </xsl:when>
                    <xsl:when test="@type='tip'">
                        <fo:block xsl:use-attribute-sets="tip">
                            <xsl:call-template name="commonattributes"/>
                        <fo:inline xsl:use-attribute-sets="note__label__tip">
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'Tip'"/>
                            </xsl:call-template>
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'#note-separator'"/>
                            </xsl:call-template>
                        </fo:inline>
                           <xsl:text>  </xsl:text>
                           <xsl:apply-templates/>
                        </fo:block>
                    </xsl:when>
                    <xsl:when test="@type='fastpath'">
                        <fo:block xsl:use-attribute-sets="note">
                            <xsl:call-template name="commonattributes"/>
                        <fo:inline xsl:use-attribute-sets="note__label__fastpath">
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'Fastpath'"/>
                            </xsl:call-template>
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'#note-separator'"/>
                            </xsl:call-template>
                        </fo:inline>
                          <xsl:text>  </xsl:text>
                          <xsl:apply-templates/>
                        </fo:block>
                    </xsl:when>
                    <xsl:when test="@type='restriction'">
                        <fo:block xsl:use-attribute-sets="restriction">
                            <xsl:call-template name="commonattributes"/>
                        <fo:inline xsl:use-attribute-sets="note__label__restriction">
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'Restriction'"/>
                            </xsl:call-template>
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'#note-separator'"/>
                            </xsl:call-template>
                        </fo:inline>
                           <xsl:text>  </xsl:text>
                           <xsl:apply-templates/>
                        </fo:block>
                    </xsl:when>
                    <xsl:when test="@type='important'">
                        <fo:block xsl:use-attribute-sets="important">
                            <xsl:call-template name="commonattributes"/>
                        <fo:inline xsl:use-attribute-sets="note__label__important">
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'Important'"/>
                            </xsl:call-template>
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'#note-separator'"/>
                            </xsl:call-template>
                        </fo:inline>
                           <xsl:text>  </xsl:text>
                           <xsl:apply-templates/>
                        </fo:block>
                    </xsl:when>
                    <xsl:when test="@type='remember'">
                        <fo:block xsl:use-attribute-sets="note">
                            <xsl:call-template name="commonattributes"/>
                        <fo:inline xsl:use-attribute-sets="note__label__remember">
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'Remember'"/>
                            </xsl:call-template>
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'#note-separator'"/>
                            </xsl:call-template>
                        </fo:inline>
                           <xsl:text>  </xsl:text>
                           <xsl:apply-templates/>
                        </fo:block>
                    </xsl:when>
                    <xsl:when test="@type='attention'">
                        <fo:block xsl:use-attribute-sets="note">
                            <xsl:call-template name="commonattributes"/>
                        <fo:inline xsl:use-attribute-sets="note__label__attention">
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'Attention'"/>
                            </xsl:call-template>
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'#note-separator'"/>
                            </xsl:call-template>
                        </fo:inline>
                           <xsl:text>  </xsl:text>
                           <xsl:apply-templates/>
                        </fo:block>
                    </xsl:when>
                    <xsl:when test="@type='caution'">
                        <fo:block xsl:use-attribute-sets="caution">
                            <xsl:call-template name="commonattributes"/>
                        <fo:inline xsl:use-attribute-sets="note__label__caution">
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'Caution'"/>
                            </xsl:call-template>
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'#note-separator'"/>
                            </xsl:call-template>
                        </fo:inline>
                           <xsl:text>  </xsl:text>
                           <xsl:apply-templates/>
                        </fo:block>
                    </xsl:when>
                    <xsl:when test="@type='danger'">
                        <fo:block xsl:use-attribute-sets="note">
                            <xsl:call-template name="commonattributes"/>
                        <fo:inline xsl:use-attribute-sets="note__label__danger">
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'Danger'"/>
                            </xsl:call-template>
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'#note-separator'"/>
                            </xsl:call-template>
                        </fo:inline>
                           <xsl:text>  </xsl:text>
                           <xsl:apply-templates/>
                        </fo:block>
                    </xsl:when>
                    <xsl:when test="@type='warning'">
                        <fo:block xsl:use-attribute-sets="caution">
                            <xsl:call-template name="commonattributes"/>
                        <fo:inline xsl:use-attribute-sets="note__label__danger">
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'Warning'"/>
                            </xsl:call-template>
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'#note-separator'"/>
                            </xsl:call-template>
                        </fo:inline>
                           <xsl:text>  </xsl:text>
                           <xsl:apply-templates/>
                        </fo:block>
                    </xsl:when>
                    <xsl:when test="@type='trouble'">
                        <fo:block xsl:use-attribute-sets="note">
                            <xsl:call-template name="commonattributes"/>
                        <fo:inline xsl:use-attribute-sets="note__label__trouble">
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'Trouble'"/>
                            </xsl:call-template>
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'#note-separator'"/>
                            </xsl:call-template>
                        </fo:inline>
                           <xsl:text>  </xsl:text>
                           <xsl:apply-templates/>
                        </fo:block>
                    </xsl:when>                  
                    <xsl:when test="@type='other'">
                        <fo:block xsl:use-attribute-sets="other">
                            <xsl:call-template name="commonattributes"/>
                        <fo:inline xsl:use-attribute-sets="note__label__other">
                            <xsl:choose>
                                <xsl:when test="@othertype">
                                    <xsl:value-of select="@othertype"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text>[</xsl:text>
                                    <xsl:value-of select="@type"/>
                                    <xsl:text>]</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'#note-separator'"/>
                            </xsl:call-template>
                        </fo:inline>
                           <xsl:text>  </xsl:text>
                           <xsl:apply-templates/>
                        </fo:block>
                    </xsl:when>
                </xsl:choose>
    </xsl:template>
    
    <xsl:template match="*[contains(@class,' topic/navtitle ')]">
        <fo:block xsl:use-attribute-sets="navtitle">
            <xsl:call-template name="commonattributes"/>
            <fo:inline xsl:use-attribute-sets="navtitle__label">
                <xsl:call-template name="getVariable">
                    <xsl:with-param name="id" select="'Navigation title'"/>
                </xsl:call-template>
                <!-- MMCL 18-1-2022 LWDITA frontmatter from navtitle -->
                <xsl:text><!--: --></xsl:text>
            </fo:inline>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

</xsl:stylesheet>