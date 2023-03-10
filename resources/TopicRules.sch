<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <!-- Warn against use of "will". -->
    <sch:pattern id="willCheck">
        <sch:rule context="text()">
            <sch:report test="contains(., 'will')" role="info" sqf:fix="willWarn">
                Avoid the use of "will" and the future tense generally in topics. Use the simple present instead.
            </sch:report>
            <sqf:fix id="willWarn">
                <sqf:description>
                    <sqf:title>Click here to delete 'will'</sqf:title>
                    <sqf:p>Don't forget to replace it with the simple present tense.</sqf:p>
                </sqf:description>
                <sqf:stringReplace regex="will"></sqf:stringReplace>
            </sqf:fix>
        </sch:rule>
    </sch:pattern>
    
    <!-- Warn against use of "won't". -->
    <sch:pattern id="wontCheck">
        <sch:rule context="text()">
            <sch:report test="contains(., 'won''t')" role="info" sqf:fix="wontWarn">
                Avoid the use of "won't" and the future tense generally in topics. Use the simple present instead.
            </sch:report>
            <sqf:fix id="wontWarn">
                <sqf:description>
                    <sqf:title>Click here to delete 'won't'</sqf:title>
                    <sqf:p>Don't forget to replace it with the simple present tense.</sqf:p>
                </sqf:description>
                <sqf:stringReplace regex="won\'t"></sqf:stringReplace>
            </sqf:fix>
        </sch:rule>
    </sch:pattern>
    
    <!-- Warn against use of "click on". DIP-468 -->
    <sch:pattern id="clickCheck">
        <sch:rule context="text()">
            <sch:report test="matches(., 'click on', 'i')" role="info">
                Avoid the use of "click on". Just use "click" instead.
            </sch:report>
        </sch:rule>
    </sch:pattern>
    
    <!-- Warn against use of "should/shouldn't". -->
  <sch:pattern id="shouldCheck">
        <sch:rule context="text()">
            <sch:report test="contains(., 'should')" role="info" sqf:fix="shouldWarn">
                Avoid using "should" and "shouldn't" in topics.
            </sch:report>
            <sqf:fix id="shouldWarn">
                <sqf:description>
                    <sqf:title>Click here to delete. </sqf:title>
                    <sqf:p>Remember to replace it with something else.</sqf:p>
                    <sqf:p>Say what a user 'must do' rather than 'should do'.</sqf:p>
                    <sqf:p>Use the present tense to document what 'happens' rather than what 'should happen'.</sqf:p>
                </sqf:description>
                <sqf:stringReplace regex="shouldn\'t|should"></sqf:stringReplace>
            </sqf:fix>
        </sch:rule>
    </sch:pattern>
    
    <!-- Add section ID attribute if section title contains a period - DIP-375. -->
    <sch:pattern id="sectionIDCheck">
        <sch:rule context="*[contains(@class, ' topic/section ')]/*[contains(@class, ' topic/title ')]">
            <sch:report test=" descendant-or-self::*/text()[contains(., '.')] and not(parent::*/@id)" role="error">
                Section titles that contain periods cause anchor links to break. To avoid this, add an ID attribute based on the section title (without periods!) to the section element, e.g. &lt;section id="version-1-0-0"&gt;.
            </sch:report>
        </sch:rule>
    </sch:pattern>
    
    <!-- Do not add special characters as part of Section ID - DIP-375. -->
    <sch:pattern id="sectionIDFormat">
        <sch:rule context="*[contains(@class, ' topic/section ')]">
            <sch:report test="contains(@id, '.') or contains(@id, '?') or contains(@id, '!') or contains(@id, '$') or contains(@id, '#') or contains(@id, '*') or contains(@id, '^') or contains(@id, '#') or contains(@id, '@') or contains(@id, '''') or contains(@id, ',') or contains(@id, '/') or contains(@id, '\') or contains(@id, ':') or contains(@id, ';') or contains(@id, '&amp;')" role="error">
                Do not add any of the following special characters as part of the ID attribute in this section element: !?@$%^&amp;*.,:;'"&gt;&lt;/#\=
            </sch:report>
        </sch:rule>
    </sch:pattern>
    
    <!-- Do not add special characters as part of Topic ID  - DIP-375. -->
    <sch:pattern id="TopicIDFormat">
        <sch:rule context="*[contains(@class, ' topic/topic ')]">
            <sch:report test="contains(@id, '.') or contains(@id, '?') or contains(@id, '!') or contains(@id, '$') or contains(@id, '#') or contains(@id, '*') or contains(@id, '^') or contains(@id, '#') or contains(@id, '@') or contains(@id, '''') or contains(@id, ',') or contains(@id, '/') or contains(@id, '\') or contains(@id, ':') or contains(@id, ';') or contains(@id, '&amp;')" role="error">
                Do not add any of the following special characters as part of the topic ID attribute: !?@$%^&amp;*.,:;'"&gt;&lt;/#\=
            </sch:report>
        </sch:rule>
    </sch:pattern>
    
    <!-- Add section title ph as section ID 
    <sch:pattern>
        <sch:rule context="*[contains(@class, ' topic/section ')]">
            <sch:report test="not(@id) and descendant::*[contains(@class, ' topic/ph ')]" role="warning" sqf:fix="addSectionID">
                This section needs an ID. Make sure you add a section title first.
            </sch:report>
            <sqf:fix id="addSectionID">
                <sqf:description>
                    <sqf:title>Click here to add the section title as an ID.</sqf:title>
                </sqf:description>
                <sqf:add target="id" node-type="attribute" select="substring-after(child::title/ph/@conkeyref, 'ProductNames/')"/>
            </sqf:fix>
        </sch:rule>
    </sch:pattern>-->
    
    <!-- Add section title as section ID DIP-401 -->
    <!-- Prompt for section ID when @conref present DIP-461 -->
    <!-- Prompt for example tag ID DIP-474 -->
    <!-- Fixed bug that caused section tag ID rules to be inherited by children DIP-475 -->
    <sch:pattern>
        <sch:rule context="*[contains(@class, 'concept/conbody')]/*[contains(@class, ' topic/section ') or contains(@class, ' topic/example ')]">
           <sch:report test="not(@id) and (*[contains(@class, ' topic/title ')] or @conref)" sqf:fix="addSectionID" role="warning">
                This section or example tag needs an ID.
            </sch:report>
            <sqf:fix id="addSectionID">
                <sqf:description>
                    <sqf:title>Click here to add an ID.</sqf:title>
                </sqf:description>
                <sqf:user-entry name="sectionID">
                    <sqf:description>
                        <sqf:title>Enter an ID based on the section/title title separated by dashes.</sqf:title>
                    </sqf:description>
                </sqf:user-entry>
                <sqf:add target="id" node-type="attribute" select="$sectionID"/>
            </sqf:fix>
        </sch:rule>
        
        <sch:rule context="*[contains(@class, 'reference/refbody')]/*[contains(@class, ' topic/section ') or contains(@class, ' topic/example ')]">
            <sch:report test="not(@id) and (*[contains(@class, ' topic/title ')] or @conref)" sqf:fix="addSectionID2" role="warning">
                This section or example tag needs an ID.
            </sch:report>
            <sqf:fix id="addSectionID2">
                <sqf:description>
                    <sqf:title>Click here to add an ID.</sqf:title>
                </sqf:description>
                <sqf:user-entry name="sectionID2">
                    <sqf:description>
                        <sqf:title>Enter an ID based on the section/example title separated by dashes.</sqf:title>
                    </sqf:description>
                </sqf:user-entry>
                <sqf:add target="id" node-type="attribute" select="$sectionID2"/>
            </sqf:fix>
        </sch:rule>
        
        <sch:rule context="*[contains(@class, 'task/taskbody')]/*[contains(@class, ' topic/example ')]">
            <sch:report test="not(@id) and  (*[contains(@class, ' topic/title ')] or @conref)" sqf:fix="addxampID" role="warning">
                This example tag needs an ID.
            </sch:report>
            <sqf:fix id="addxampID">
                <sqf:description>
                    <sqf:title>Click here to add an ID.</sqf:title>
                </sqf:description>
                <sqf:user-entry name="xampID">
                    <sqf:description>
                        <sqf:title>Enter an ID based on the example title separated by dashes.</sqf:title>
                    </sqf:description>
                </sqf:user-entry>
                <sqf:add target="id" node-type="attribute" select="$xampID"/>
            </sqf:fix>
        </sch:rule>
    </sch:pattern>
    
    <!-- Check for missing alt tag -->
    <sch:pattern>
        <sch:rule context="*[contains(@class, ' topic/image ')]">
            <sch:report test="not(descendant::*[contains(@class, ' topic/alt ')])" role="warning">
                This image tag needs an alt tag child added. Make sure you remove any alt attribute in the image tag also.
            </sch:report>
        </sch:rule>
    </sch:pattern>
    
</sch:schema>