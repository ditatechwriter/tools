<?xml version='1.0'?>

<!--
Copyright ? 2004-2006 by Idiom Technologies, Inc. All rights reserved.
IDIOM is a registered trademark of Idiom Technologies, Inc. and WORLDSERVER
and WORLDSTART are trademarks of Idiom Technologies, Inc. All other
trademarks are the property of their respective owners.

IDIOM TECHNOLOGIES, INC. IS DELIVERING THE SOFTWARE "AS IS," WITH
ABSOLUTELY NO WARRANTIES WHATSOEVER, WHETHER EXPRESS OR IMPLIED,  AND IDIOM
TECHNOLOGIES, INC. DISCLAIMS ALL WARRANTIES, EXPRESS OR IMPLIED, INCLUDING
BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
PURPOSE AND WARRANTY OF NON-INFRINGEMENT. IDIOM TECHNOLOGIES, INC. SHALL NOT
BE LIABLE FOR INDIRECT, INCIDENTAL, SPECIAL, COVER, PUNITIVE, EXEMPLARY,
RELIANCE, OR CONSEQUENTIAL DAMAGES (INCLUDING BUT NOT LIMITED TO LOSS OF
ANTICIPATED PROFIT), ARISING FROM ANY CAUSE UNDER OR RELATED TO  OR ARISING
OUT OF THE USE OF OR INABILITY TO USE THE SOFTWARE, EVEN IF IDIOM
TECHNOLOGIES, INC. HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.

Idiom Technologies, Inc. and its licensors shall not be liable for any
damages suffered by any person as a result of using and/or modifying the
Software or its derivatives. In no event shall Idiom Technologies, Inc.'s
liability for any damages hereunder exceed the amounts received by Idiom
Technologies, Inc. as a result of this transaction.

These terms and conditions supersede the terms and conditions in any
licensing agreement to the extent that such terms and conditions conflict
with those set forth herein.

This file is part of the DITA Open Toolkit project.
See the accompanying LICENSE file for applicable license.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:dita2xslfo="http://dita-ot.sourceforge.net/ns/200910/dita2xslfo"
    xmlns:opentopic="http://www.idiominc.com/opentopic"
    xmlns:opentopic-index="http://www.idiominc.com/opentopic/index"
    exclude-result-prefixes="opentopic opentopic-index dita2xslfo"
    version="2.0">

    <!-- Determines whether to generate titles for task sections. Values are YES and NO. -->
    <xsl:param name="GENERATE-TASK-LABELS">
        <xsl:choose>
            <xsl:when test="$antArgsGenerateTaskLabels='YES'"><xsl:value-of select="$antArgsGenerateTaskLabels"/></xsl:when>
            <xsl:otherwise>NO</xsl:otherwise>
        </xsl:choose>
    </xsl:param>
  
  <xsl:template match="*[contains(@class, ' task/task ')]" mode="processTopic"
                name="processTask">
    <fo:block xsl:use-attribute-sets="task">
      <xsl:apply-templates select="." mode="commonTopicProcessing"/>
    </fo:block>
  </xsl:template>
  
  <!-- Deprecated, retained for backwards compatibility -->
  <xsl:template match="*" mode="processTask">
    <xsl:call-template name="processTask"/>
  </xsl:template>
  
    <xsl:template match="*[contains(@class, ' task/taskbody ')]">
        <fo:block xsl:use-attribute-sets="taskbody">
            <xsl:call-template name="commonattributes"/>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' task/prereq ')]">
        <fo:block xsl:use-attribute-sets="prereq">
            <xsl:call-template name="commonattributes"/>
            <xsl:apply-templates select="." mode="dita2xslfo:task-heading">
                  <xsl:with-param name="use-label">
                    <xsl:apply-templates select="." mode="dita2xslfo:retrieve-task-heading">
                      <xsl:with-param name="pdf2-string">Task Prereq</xsl:with-param>
                      <xsl:with-param name="common-string">task_prereq</xsl:with-param>
                    </xsl:apply-templates>
                </xsl:with-param>
            </xsl:apply-templates>
            <fo:block xsl:use-attribute-sets="prereq__content">
              <xsl:apply-templates/>
            </fo:block>
        </fo:block>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' task/context ')]">
        <fo:block xsl:use-attribute-sets="context">
            <xsl:call-template name="commonattributes"/>
            <!--xsl:apply-templates select="." mode="dita2xslfo:task-heading">
                <xsl:with-param name="use-label">
                    <xsl:apply-templates select="." mode="dita2xslfo:retrieve-task-heading">
                      <xsl:with-param name="pdf2-string">Task Context</xsl:with-param>
                      <xsl:with-param name="common-string">task_context</xsl:with-param>
                    </xsl:apply-templates>
                </xsl:with-param>
            </xsl:apply-templates-->
            <fo:block xsl:use-attribute-sets="context__content">
              <xsl:apply-templates/>
            </fo:block>
        </fo:block>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' task/result ')]">
        <fo:block xsl:use-attribute-sets="result">
            <xsl:call-template name="commonattributes"/>
            <!--xsl:apply-templates select="." mode="dita2xslfo:task-heading">
                <xsl:with-param name="use-label">
                    <xsl:apply-templates select="." mode="dita2xslfo:retrieve-task-heading">
                      <xsl:with-param name="pdf2-string">Task Result</xsl:with-param>
                      <xsl:with-param name="common-string">task_results</xsl:with-param>
                    </xsl:apply-templates>
                </xsl:with-param>
            </xsl:apply-templates-->
            <fo:block xsl:use-attribute-sets="result__content">
              <xsl:apply-templates/>
            </fo:block>
        </fo:block>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' task/postreq ')]">
        <fo:block xsl:use-attribute-sets="postreq">
            <xsl:call-template name="commonattributes"/>
            <!--xsl:apply-templates select="." mode="dita2xslfo:task-heading">
                <xsl:with-param name="use-label">
                    <xsl:apply-templates select="." mode="dita2xslfo:retrieve-task-heading">
                      <xsl:with-param name="pdf2-string">Task Postreq</xsl:with-param>
                      <xsl:with-param name="common-string">task_postreq</xsl:with-param>
                    </xsl:apply-templates>
                </xsl:with-param>
            </xsl:apply-templates-->
            <fo:block xsl:use-attribute-sets="postreq__content">
              <xsl:apply-templates/>
            </fo:block>
        </fo:block>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' task/steps ')]" name="steps">
      <!--xsl:apply-templates select="." mode="dita2xslfo:task-heading">
          <xsl:with-param name="use-label">
            <xsl:apply-templates select="." mode="dita2xslfo:retrieve-task-heading">
              <xsl:with-param name="pdf2-string">Task Steps</xsl:with-param>
              <xsl:with-param name="common-string">task_procedure</xsl:with-param>
            </xsl:apply-templates>
          </xsl:with-param>
      </xsl:apply-templates-->
      <xsl:choose>
        <xsl:when test="count(*[contains(@class, ' task/step ')]) eq 1">
          <fo:block>
            <xsl:call-template name="commonattributes"/>
            <xsl:apply-templates mode="onestep"/>
          </fo:block>
        </xsl:when>
        <xsl:otherwise>
          <fo:list-block xsl:use-attribute-sets="steps">
            <xsl:call-template name="commonattributes"/>
            <xsl:apply-templates/>
          </fo:list-block>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:template>
    
    
    <xsl:template match="*[contains(@class, ' task/steps ')]/*[contains(@class, ' task/step ')]">
        <xsl:variable name="format">
            <xsl:call-template name="getVariable">
                <xsl:with-param name="id" select="'Step Format'"/>
            </xsl:call-template>
        </xsl:variable>
        <fo:list-item xsl:use-attribute-sets="steps.step" keep-together.within-page="always">
            <xsl:call-template name="commonattributes"/>
            <fo:list-item-label xsl:use-attribute-sets="steps.step__label">
                <fo:block xsl:use-attribute-sets="steps.step__label__content">
                    <xsl:if test="preceding-sibling::*[contains(@class, ' task/step ')] | following-sibling::*[contains(@class, ' task/step ')]">
                        <xsl:call-template name="getVariable">
                            <xsl:with-param name="id" select="'Step Number'"/>
                            <xsl:with-param name="params" as="element()*">
                                <number>
                                    <xsl:number format="{$format}" count="*[contains(@class, ' task/step ')]"/>
                                </number>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:if>
                </fo:block>
            </fo:list-item-label>
            
            <fo:list-item-body xsl:use-attribute-sets="steps.step__body">
                <fo:block xsl:use-attribute-sets="steps.step__content">
                    <xsl:apply-templates/>
                </fo:block>
            </fo:list-item-body>
            
        </fo:list-item>
    </xsl:template>
</xsl:stylesheet>
