<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
        <sch:pattern id="relativePathCheck">
            <!-- Check that all topicrefs with html format and relative href paths have the scope attr set to 'peer' -->
            <sch:rule context="*[contains(@class, ' map/topicref ')]">
                <sch:report test="@format='html' and (not(@scope) or @scope!='peer') and not(matches(@href,'^http(s?)://' ))" sqf:fix="setScopeAttr" role="error">
                    Topicrefs with relative paths should have the scope attribute set to peer.
                </sch:report>
                <sqf:fix id="setScopeAttr">
                    <sqf:description>
                        <sqf:title>Click here to set scope attribute to peer</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="scope" select="'peer'"/>
                </sqf:fix>
            </sch:rule>
        </sch:pattern>
    
    <sch:pattern id="indexCheck">
        <!-- Check file added to map is not named index.dita/index.md/index.html/index.ditamap etc. -->
        <sch:rule context="*[contains(@class, ' map/topicref ')]">
            <sch:report test="matches(@href,'^index\.','i')"  role="error">
                Do not add files named 'index' to this map. Please rename this file.
            </sch:report>
        </sch:rule>
    </sch:pattern>
    
    
    <!-- Check that all Warehouse topicrefs have the processing-role attr set to 'resource-only'  -->
    <!-- <sch:pattern id="warehouseProcessingRoles">
            <sch:rule context="*[contains(@class, ' map/topicref ')]">
                <sch:report test="starts-with(@href, 'conref') and (not(@processing-role) or @processing-role!='resource-only') and not(parent::*/@processing-role='resource-only')" sqf:fix="setProcessAttr" role="error">
                    Warehouse topics should have the processing-role attribute set to 'resource-only'.
                </sch:report>
                <sqf:fix id="setProcessAttr">
                    <sqf:description>
                        <sqf:title>Click here to set processing-role attribute to 'resource-only'</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="processing-role" select="'resource-only'"/>
                </sqf:fix>
             </sch:rule>
        </sch:pattern> -->
    
    
    <!-- Check for topicrefs with chunks within chunks -->
    <sch:pattern id="chunksWithinChunks">
        <sch:rule context="*[contains(@class, ' map/topicref ')]">
            <sch:report test="@chunk and ancestor::*/@chunk" sqf:fix="chunkError" role="error">
                Do not add chunks within chunks.
            </sch:report>
            <sqf:fix id="chunkError">
                <sqf:description>
                    <sqf:title>Delete the chunk attribute in this topicref</sqf:title>
                </sqf:description>
                <sqf:delete  match="@chunk"/>
            </sqf:fix>
        </sch:rule>
    </sch:pattern>   
    
    <!-- Set chunk children @toc to no -->
    <sch:pattern id="chunkChildTocNo">
        <sch:rule context="*[contains(@class, ' map/topicref ')]">
            <sch:report test="not(@toc) and ancestor::*/@chunk" sqf:fix="TocWarning" role="warning">
                This topicref requires toc="no".
            </sch:report>
            <sqf:fix id="TocWarning">
                <sqf:description>
                    <sqf:title>Click here to add toc="no".</sqf:title>
                </sqf:description>
                <sqf:add node-type="attribute" target="toc" select="'no'"/>
            </sqf:fix>
        </sch:rule>
    </sch:pattern>   
    
    <!-- Check for orphaned reltable topicrefs -->
 <!-- <sch:pattern id="reltableOrphans">
        <sch:rule context="*[contains(@class, ' map/relcell ')]/*[contains(@class, ' map/topicref ')]">
            <sch:report test="not(@keyref) and not(preceding::*/@href = @href)" role="error" sqf:fix="deleteReltableOrphan">This reltable topicref has no equivalent in the map. Either remove it or add an equivalent topicref to the map.</sch:report>
            <sqf:fix id="deleteReltableOrphan">
                <sqf:description>
                    <sqf:title>Click here to delete this reltable topicref.</sqf:title>
                </sqf:description>
                <sqf:delete match="."/>
            </sqf:fix>
        </sch:rule>
    </sch:pattern> -->
    
</sch:schema>