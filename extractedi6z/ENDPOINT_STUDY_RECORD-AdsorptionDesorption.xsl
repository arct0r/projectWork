<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:i6="http://iuclid6.echa.europa.eu/namespaces/platform-fields/v1" xmlns:i6c="http://iuclid6.echa.europa.eu/namespaces/platform-container/v1" xmlns:xt="http://iuclid6.echa.europa.eu/namespaces/ENDPOINT_STUDY_RECORD-AdsorptionDesorption/7.0" version="1.0">
    <xsl:template match="/">
        <html>
            <head>
                <link href="iuclid6_style.css" rel="stylesheet" type="text/css"/>
            </head>
            <body>
                <table>
                    <tr/>
                    <xsl:apply-templates/>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="//i6c:PlatformMetadata | //i6c:Attachments | //i6c:ModificationHistory"/>
    <xsl:template match="//xt:ENDPOINT_STUDY_RECORD">
        <tr class="headerDocument">
            <td>Adsorption / desorption</td>
            <td>
                <hr/>
            </td>
        </tr>
        <xsl:apply-templates select="./@*"/>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="//xt:RobustStudy | //xt:UsedForClassification | //xt:UsedForMSDS | //xt:KeyResult | //xt:KeyResult">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'RobustStudy'">Robust study summary</xsl:when>
                    <xsl:when test="name(.) = 'UsedForMSDS'">Used for SDS</xsl:when>
                    <xsl:when test="name(.) = 'UsedForClassification'">Used for classification</xsl:when>
                    <xsl:when test="name(.) = 'KeyResult'">Key result</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:value-of select=". "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:DataProtection">
        <tr>
            <td class="label"/>
            <td class="value">
                <xsl:apply-templates/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:RelatedInformation | //xt:TestMaterialInformation | //xt:ReferenceSubstance">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'RelatedInformation'">Related information</xsl:when>
                    <xsl:when test="name(.) = 'TestMaterialInformation'">Test material information</xsl:when>
                    <xsl:when test="name(.) = 'ReferenceSubstance'">Reference substance</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:value-of select=". "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:Ph | //xt:Ph | //xt:Ph | //xt:Ph">
        <tr>
            <td class="label">pH</td>
            <td class="value">
                <xsl:value-of select=". "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:Duration | //xt:Duration | //xt:ConcOfAdsorbedTestMat | //xt:Temp | //xt:Temp | //xt:Temp | //xt:Duration | //xt:Duration">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'Temp'">Temp.</xsl:when>
                    <xsl:when test="name(.) = 'Duration'">Duration</xsl:when>
                    <xsl:when test="name(.) = 'ConcOfAdsorbedTestMat'">Conc. of adsorbed test mat.</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:value-of select="./value "/>
                <xsl:choose>
                    <xsl:when test="./unitCode = '2329'"> s</xsl:when>
                    <xsl:when test="./unitCode = '2113'"> min</xsl:when>
                    <xsl:when test="./unitCode = '1976'"> h</xsl:when>
                    <xsl:when test="./unitCode = '1839'"> d</xsl:when>
                    <xsl:when test="./unitCode = '2468'"> wk</xsl:when>
                    <xsl:when test="./unitCode = '2133'"> mo</xsl:when>
                    <xsl:when test="./unitCode = '2477'"> yr</xsl:when>
                    <xsl:when test="./unitCode = '2095'"> mg/kg soil d.w.</xsl:when>
                    <xsl:when test="./unitCode = '2092'"> mg/kg sediment d.w.</xsl:when>
                    <xsl:when test="./unitCode = '2094'"> mg/kg sludge solids</xsl:when>
                    <xsl:when test="./unitCode = '1342'"> other:</xsl:when>
                    <xsl:when test="./unitCode = '2493'"> °C</xsl:when>
                    <xsl:when test="./unitCode = '3887'"> K</xsl:when>
                    <xsl:when test="./unitCode = '3888'"> °F</xsl:when>
                </xsl:choose>
                <xsl:value-of select="./unitOther "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:Clay | //xt:Silt | //xt:Sand | //xt:OrgCarbon | //xt:Ph | //xt:CEC | //xt:BulkDensityGCm | //xt:InitialConcMeasured | //xt:Temp | //xt:Value | //xt:PercentageOfOrganicCarbon | //xt:Value | //xt:OrgCarbon | //xt:AdsorptionPercentage | //xt:DesorptionPercentage">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'CEC'">CEC</xsl:when>
                    <xsl:when test="name(.) = 'Clay'">% Clay</xsl:when>
                    <xsl:when test="name(.) = 'Sand'">% Sand</xsl:when>
                    <xsl:when test="name(.) = 'DesorptionPercentage'">% Desorption</xsl:when>
                    <xsl:when test="name(.) = 'InitialConcMeasured'">Initial conc. measured</xsl:when>
                    <xsl:when test="name(.) = 'PercentageOfOrganicCarbon'">% Org. carbon</xsl:when>
                    <xsl:when test="name(.) = 'Temp'">Temp.</xsl:when>
                    <xsl:when test="name(.) = 'BulkDensityGCm'">Bulk density (g/cm³)</xsl:when>
                    <xsl:when test="name(.) = 'OrgCarbon'">% Org. carbon</xsl:when>
                    <xsl:when test="name(.) = 'Ph'">pH</xsl:when>
                    <xsl:when test="name(.) = 'Value'">Value</xsl:when>
                    <xsl:when test="name(.) = 'Silt'">% Silt</xsl:when>
                    <xsl:when test="name(.) = 'AdsorptionPercentage'">% Adsorption</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:value-of select="./i6:lowerQualifier "/>
                <xsl:value-of select="./i6:lowerValue "/>
                <xsl:value-of select="./i6:upperQualifier "/>
                <xsl:value-of select="./i6:upperValue "/>
                <xsl:choose>
                    <xsl:when test="./i6:unitCode = '2066'"> meq/100 g soil d.w.</xsl:when>
                    <xsl:when test="./i6:unitCode = '1342'"> other:</xsl:when>
                    <xsl:when test="./i6:unitCode = '1173'"> no data</xsl:when>
                    <xsl:when test="./i6:unitCode = '2207'"> not specified</xsl:when>
                    <xsl:when test="./i6:unitCode = '2095'"> mg/kg soil d.w.</xsl:when>
                    <xsl:when test="./i6:unitCode = '2092'"> mg/kg sediment d.w.</xsl:when>
                    <xsl:when test="./i6:unitCode = '2094'"> mg/kg sludge solids</xsl:when>
                    <xsl:when test="./i6:unitCode = '2493'"> °C</xsl:when>
                    <xsl:when test="./i6:unitCode = '3887'"> K</xsl:when>
                    <xsl:when test="./i6:unitCode = '3888'"> °F</xsl:when>
                    <xsl:when test="./i6:unitCode = '1852'"> dimensionless</xsl:when>
                    <xsl:when test="./i6:unitCode = '8082'"> L/kg</xsl:when>
                    <xsl:when test="./i6:unitCode = '60841'"> m³/m³</xsl:when>
                </xsl:choose>
                <xsl:value-of select="./i6:unitOther "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:DataWaivingJustification">
        <tr>
            <td class="label">Justification for data waiving</td>
            <td class="value">
                <xsl:choose>
                    <xsl:when test="./i6:value = '60814'">the study does not need to be conducted because the substance has a low octanol water partition coefficient and the adsorption potential of this substance is related to this parameter</xsl:when>
                    <xsl:when test="./i6:value = '60815'">the study does not need to be conducted because the physicochemical properties of the substance indicate that it can be expected to have a low potential for adsorption</xsl:when>
                    <xsl:when test="./i6:value = '60816'">the study does not need to be conducted because the substance and its relevant degradation products decompose rapidly</xsl:when>
                    <xsl:when test="./i6:value = '1342'">other:</xsl:when>
                </xsl:choose>
                <xsl:value-of select="./i6:other "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:Endpoint | //xt:StudyResultType | //xt:PurposeFlag | //xt:Reliability | //xt:RationalReliability | //xt:DataWaiving | //xt:ReasonPurpose | //xt:ReasonPurpose | //xt:DataAccess | //xt:DataProtectionClaimed | //xt:Qualifier | //xt:Guideline | //xt:Deviation | //xt:GLPComplianceStatement | //xt:MethodType | //xt:Media | //xt:Radiolabelling | //xt:AnalyticalMonitoring | //xt:MatrixNo | //xt:MatrixType | //xt:SampleNo | //xt:SampleNo | //xt:SampleNo | //xt:Type | //xt:RemarksOnResults | //xt:SampleNo | //xt:PhaseSystem | //xt:Type | //xt:RemarksOnResults | //xt:SampleNo | //xt:RemarksOnResults | //xt:SampleNo | //xt:RemarksOnResults | //xt:TransformationProducts | //xt:No | //xt:Type | //xt:ValidityCriteriaFulfilled">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'AnalyticalMonitoring'">Analytical monitoring</xsl:when>
                    <xsl:when test="name(.) = 'DataWaiving'">Data waiving</xsl:when>
                    <xsl:when test="name(.) = 'PurposeFlag'">Adequacy of study</xsl:when>
                    <xsl:when test="name(.) = 'DataAccess'">Data access</xsl:when>
                    <xsl:when test="name(.) = 'PhaseSystem'">Phase system</xsl:when>
                    <xsl:when test="name(.) = 'Endpoint'">Endpoint</xsl:when>
                    <xsl:when test="name(.) = 'RemarksOnResults'">Remarks on result</xsl:when>
                    <xsl:when test="name(.) = 'RationalReliability'">Rationale for reliability incl. deficiencies</xsl:when>
                    <xsl:when test="name(.) = 'DataProtectionClaimed'">Data protection claimed</xsl:when>
                    <xsl:when test="name(.) = 'Qualifier'">Qualifier</xsl:when>
                    <xsl:when test="name(.) = 'MethodType'">Type of method</xsl:when>
                    <xsl:when test="name(.) = 'No'">No.</xsl:when>
                    <xsl:when test="name(.) = 'MatrixNo'">Matrix no.</xsl:when>
                    <xsl:when test="name(.) = 'Radiolabelling'">Radiolabelling</xsl:when>
                    <xsl:when test="name(.) = 'Media'">Media</xsl:when>
                    <xsl:when test="name(.) = 'Guideline'">Guideline</xsl:when>
                    <xsl:when test="name(.) = 'ReasonPurpose'">Reason / purpose for cross-reference</xsl:when>
                    <xsl:when test="name(.) = 'GLPComplianceStatement'">GLP compliance</xsl:when>
                    <xsl:when test="name(.) = 'SampleNo'">Sample no.</xsl:when>
                    <xsl:when test="name(.) = 'ValidityCriteriaFulfilled'">Validity criteria fulfilled</xsl:when>
                    <xsl:when test="name(.) = 'Type'">Type</xsl:when>
                    <xsl:when test="name(.) = 'TransformationProducts'">Transformation products</xsl:when>
                    <xsl:when test="name(.) = 'MatrixType'">Matrix type</xsl:when>
                    <xsl:when test="name(.) = 'Reliability'">Reliability</xsl:when>
                    <xsl:when test="name(.) = 'Deviation'">Deviations</xsl:when>
                    <xsl:when test="name(.) = 'StudyResultType'">Type of information</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:choose>
                    <xsl:when test="./i6:value = '60812'">adsorption / desorption: screening</xsl:when>
                    <xsl:when test="./i6:value = '60813'">adsorption / desorption, other</xsl:when>
                    <xsl:when test="./i6:value = '61930'">adsorption / desorption</xsl:when>
                    <xsl:when test="./i6:value = '1895'">experimental study</xsl:when>
                    <xsl:when test="./i6:value = '1896'">experimental study planned</xsl:when>
                    <xsl:when test="./i6:value = '60002'">experimental study planned (based on read-across)</xsl:when>
                    <xsl:when test="./i6:value = '14'">(Q)SAR</xsl:when>
                    <xsl:when test="./i6:value = '1885'">calculation (if not (Q)SAR)</xsl:when>
                    <xsl:when test="./i6:value = '2303'">read-across based on grouping of substances (category approach)</xsl:when>
                    <xsl:when test="./i6:value = '62036'">migrated information: read-across based on grouping of substances (category approach)</xsl:when>
                    <xsl:when test="./i6:value = '2304'">read-across from supporting substance (structural analogue or surrogate)</xsl:when>
                    <xsl:when test="./i6:value = '107831'">mixture rules calculation</xsl:when>
                    <xsl:when test="./i6:value = '107832'">read-across from similar mixture/product</xsl:when>
                    <xsl:when test="./i6:value = '62035'">migrated information: read-across from supporting substance (structural analogue or surrogate)</xsl:when>
                    <xsl:when test="./i6:value = '2207'">not specified</xsl:when>
                    <xsl:when test="./i6:value = '1342'">other:</xsl:when>
                    <xsl:when test="./i6:value = '1173'">no data</xsl:when>
                    <xsl:when test="./i6:value = '921'">key study</xsl:when>
                    <xsl:when test="./i6:value = '1590'">supporting study</xsl:when>
                    <xsl:when test="./i6:value = '1661'">weight of evidence</xsl:when>
                    <xsl:when test="./i6:value = '8108'">disregarded due to major methodological deficiencies</xsl:when>
                    <xsl:when test="./i6:value = '60020'">other information</xsl:when>
                    <xsl:when test="./i6:value = '16'">1 (reliable without restriction)</xsl:when>
                    <xsl:when test="./i6:value = '18'">2 (reliable with restrictions)</xsl:when>
                    <xsl:when test="./i6:value = '22'">3 (not reliable)</xsl:when>
                    <xsl:when test="./i6:value = '24'">4 (not assignable)</xsl:when>
                    <xsl:when test="./i6:value = '60170'">guideline study</xsl:when>
                    <xsl:when test="./i6:value = '60171'">comparable to guideline study</xsl:when>
                    <xsl:when test="./i6:value = '60172'">test procedure in accordance with national standard methods</xsl:when>
                    <xsl:when test="./i6:value = '60173'">test procedure in accordance with generally accepted scientific standards and described in sufficient detail</xsl:when>
                    <xsl:when test="./i6:value = '60174'">guideline study without detailed documentation</xsl:when>
                    <xsl:when test="./i6:value = '60175'">guideline study with acceptable restrictions</xsl:when>
                    <xsl:when test="./i6:value = '60176'">comparable to guideline study with acceptable restrictions</xsl:when>
                    <xsl:when test="./i6:value = '60177'">test procedure in accordance with national standard methods with acceptable restrictions</xsl:when>
                    <xsl:when test="./i6:value = '60178'">study well documented, meets generally accepted scientific principles, acceptable for assessment</xsl:when>
                    <xsl:when test="./i6:value = '60179'">accepted calculation method</xsl:when>
                    <xsl:when test="./i6:value = '60180'">data from handbook or collection of data</xsl:when>
                    <xsl:when test="./i6:value = '60181'">significant methodological deficiencies</xsl:when>
                    <xsl:when test="./i6:value = '60182'">unsuitable test system</xsl:when>
                    <xsl:when test="./i6:value = '60183'">abstract</xsl:when>
                    <xsl:when test="./i6:value = '60184'">secondary literature</xsl:when>
                    <xsl:when test="./i6:value = '60185'">documentation insufficient for assessment</xsl:when>
                    <xsl:when test="./i6:value = '60186'">results derived from a valid (Q)SAR model and falling into its applicability domain, with adequate and reliable documentation / justification</xsl:when>
                    <xsl:when test="./i6:value = '60187'">results derived from a valid (Q)SAR model and falling into its applicability domain, with limited documentation / justification</xsl:when>
                    <xsl:when test="./i6:value = '60188'">results derived from a valid (Q)SAR model, but  not (completely) falling into its applicability domain, with adequate and reliable documentation / justification</xsl:when>
                    <xsl:when test="./i6:value = '60189'">results derived from a (Q)SAR model, with limited documentation / justification, but validity of model and reliability of prediction considered adequate based on a generally acknowledged source</xsl:when>
                    <xsl:when test="./i6:value = '60190'">results derived from a valid (Q)SAR model, but not (completely) falling into its applicability domain, and documentation / justification is limited</xsl:when>
                    <xsl:when test="./i6:value = '60191'">results derived from a (Q)SAR model, with limited documentation / justification</xsl:when>
                    <xsl:when test="./i6:value = '1588'">study technically not feasible</xsl:when>
                    <xsl:when test="./i6:value = '1587'">study scientifically not necessary / other information available</xsl:when>
                    <xsl:when test="./i6:value = '982'">exposure considerations</xsl:when>
                    <xsl:when test="./i6:value = '60022'">study waived due to provisions of other regulation</xsl:when>
                    <xsl:when test="./i6:value = '2533'">other justification</xsl:when>
                    <xsl:when test="./i6:value = '60006'">data waiving: supporting information</xsl:when>
                    <xsl:when test="./i6:value = '60007'">exposure-related information</xsl:when>
                    <xsl:when test="./i6:value = '60008'">read-across: supporting information</xsl:when>
                    <xsl:when test="./i6:value = '60009'">(Q)SAR model reporting (QMRF)</xsl:when>
                    <xsl:when test="./i6:value = '60010'">(Q)SAR prediction reporting (QPRF)</xsl:when>
                    <xsl:when test="./i6:value = '60011'">(Q)SAR model and prediction reporting (QMRF/QPRF)</xsl:when>
                    <xsl:when test="./i6:value = '60012'">(Q)SAR: supporting information</xsl:when>
                    <xsl:when test="./i6:value = '60013'">justification, other:</xsl:when>
                    <xsl:when test="./i6:value = '60014'">assessment report</xsl:when>
                    <xsl:when test="./i6:value = '60015'">read-across source</xsl:when>
                    <xsl:when test="./i6:value = '60016'">reference to other assay used for intermediate effect derivation</xsl:when>
                    <xsl:when test="./i6:value = '60017'">reference to same study</xsl:when>
                    <xsl:when test="./i6:value = '60018'">reference to other study</xsl:when>
                    <xsl:when test="./i6:value = '1838'">data submitter is data owner</xsl:when>
                    <xsl:when test="./i6:value = '1837'">data submitter has Letter of Access</xsl:when>
                    <xsl:when test="./i6:value = '1835'">data no longer protected</xsl:when>
                    <xsl:when test="./i6:value = '1836'">data published</xsl:when>
                    <xsl:when test="./i6:value = '60023'">data submitter has permission to refer</xsl:when>
                    <xsl:when test="./i6:value = '2193'">not applicable</xsl:when>
                    <xsl:when test="./i6:value = '2480'">yes</xsl:when>
                    <xsl:when test="./i6:value = '4161'">yes, but willing to share</xsl:when>
                    <xsl:when test="./i6:value = '4162'">yes, but not willing to share</xsl:when>
                    <xsl:when test="./i6:value = '1680'">according to guideline</xsl:when>
                    <xsl:when test="./i6:value = '1880'">equivalent or similar to guideline</xsl:when>
                    <xsl:when test="./i6:value = '2172'">no guideline followed</xsl:when>
                    <xsl:when test="./i6:value = '2171'">no guideline available</xsl:when>
                    <xsl:when test="./i6:value = '2175'">no guideline required</xsl:when>
                    <xsl:when test="./i6:value = '1188'">OECD Guideline 106 (Adsorption - Desorption Using a Batch Equilibrium Method)</xsl:when>
                    <xsl:when test="./i6:value = '1198'">OECD Guideline 121 (Estimation of the Adsorption Coefficient (Koc) on Soil and on Sewage Sludge using High Performance Liquid Chromatography (HPLC))</xsl:when>
                    <xsl:when test="./i6:value = '715'">EU Method C.18 (Adsorption / Desorption Using a Batch Equilibrium Method)</xsl:when>
                    <xsl:when test="./i6:value = '4068'">EU Method C.19 (Estimation of the Adsorption Coefficient (KOC) on Soil and Sewage Sludge Using High Performance Liquid Chromatography (HPLC))</xsl:when>
                    <xsl:when test="./i6:value = '436'">EPA OPPTS 835.1110 (Activated Sludge Sorption Isotherm)</xsl:when>
                    <xsl:when test="./i6:value = '438'">EPA OPPTS 835.1220 (Sediment and Soil Adsorption / Desorption Isotherm)</xsl:when>
                    <xsl:when test="./i6:value = '559'">EPA OTS 796.2750 (Sediment and Soil Adsorption Isotherm)</xsl:when>
                    <xsl:when test="./i6:value = '2246'">other guideline:</xsl:when>
                    <xsl:when test="./i6:value = '2158'">no</xsl:when>
                    <xsl:when test="./i6:value = '4179'">yes (incl. QA statement)</xsl:when>
                    <xsl:when test="./i6:value = '1759'">batch equilibrium method</xsl:when>
                    <xsl:when test="./i6:value = '817'">HPLC estimation method</xsl:when>
                    <xsl:when test="./i6:value = '2375'">soil</xsl:when>
                    <xsl:when test="./i6:value = '1543'">sediment</xsl:when>
                    <xsl:when test="./i6:value = '2342'">sewage sludge</xsl:when>
                    <xsl:when test="./i6:value = '2380'">soil/sewage sludge</xsl:when>
                    <xsl:when test="./i6:value = '60817'">suspended matter</xsl:when>
                    <xsl:when test="./i6:value = '2203'">not required</xsl:when>
                    <xsl:when test="./i6:value = '2'">#1</xsl:when>
                    <xsl:when test="./i6:value = '4'">#2</xsl:when>
                    <xsl:when test="./i6:value = '5'">#3</xsl:when>
                    <xsl:when test="./i6:value = '6'">#4</xsl:when>
                    <xsl:when test="./i6:value = '7'">#5</xsl:when>
                    <xsl:when test="./i6:value = '8'">#6</xsl:when>
                    <xsl:when test="./i6:value = '9'">#7</xsl:when>
                    <xsl:when test="./i6:value = '10'">#8</xsl:when>
                    <xsl:when test="./i6:value = '11'">#9</xsl:when>
                    <xsl:when test="./i6:value = '3'">#10</xsl:when>
                    <xsl:when test="./i6:value = '4070'">#11</xsl:when>
                    <xsl:when test="./i6:value = '4071'">#12</xsl:when>
                    <xsl:when test="./i6:value = '4072'">#13</xsl:when>
                    <xsl:when test="./i6:value = '4073'">#14</xsl:when>
                    <xsl:when test="./i6:value = '4074'">#15</xsl:when>
                    <xsl:when test="./i6:value = '4075'">#16</xsl:when>
                    <xsl:when test="./i6:value = '4076'">#17</xsl:when>
                    <xsl:when test="./i6:value = '4077'">#18</xsl:when>
                    <xsl:when test="./i6:value = '4078'">#19</xsl:when>
                    <xsl:when test="./i6:value = '4079'">#20</xsl:when>
                    <xsl:when test="./i6:value = '62'">Alfisol</xsl:when>
                    <xsl:when test="./i6:value = '88'">Andisol</xsl:when>
                    <xsl:when test="./i6:value = '102'">Aridsol</xsl:when>
                    <xsl:when test="./i6:value = '164'">Brunisol</xsl:when>
                    <xsl:when test="./i6:value = '239'">Chernozem</xsl:when>
                    <xsl:when test="./i6:value = '257'">clay</xsl:when>
                    <xsl:when test="./i6:value = '258'">clay loam</xsl:when>
                    <xsl:when test="./i6:value = '288'">Cryosol</xsl:when>
                    <xsl:when test="./i6:value = '748'">Entisol</xsl:when>
                    <xsl:when test="./i6:value = '808'">Gleysol</xsl:when>
                    <xsl:when test="./i6:value = '840'">Histosol</xsl:when>
                    <xsl:when test="./i6:value = '902'">Inceptisol</xsl:when>
                    <xsl:when test="./i6:value = '1026'">loam</xsl:when>
                    <xsl:when test="./i6:value = '1027'">loamy sand</xsl:when>
                    <xsl:when test="./i6:value = '1040'">Luvisol</xsl:when>
                    <xsl:when test="./i6:value = '1081'">Mollisol</xsl:when>
                    <xsl:when test="./i6:value = '4203'">Organic</xsl:when>
                    <xsl:when test="./i6:value = '1343'">Oxisol</xsl:when>
                    <xsl:when test="./i6:value = '1387'">Podzol</xsl:when>
                    <xsl:when test="./i6:value = '1483'">Regosol</xsl:when>
                    <xsl:when test="./i6:value = '1522'">sand</xsl:when>
                    <xsl:when test="./i6:value = '1523'">sandy clay loam</xsl:when>
                    <xsl:when test="./i6:value = '1524'">sandy loam</xsl:when>
                    <xsl:when test="./i6:value = '1525'">sandy clay</xsl:when>
                    <xsl:when test="./i6:value = '1549'">Silt</xsl:when>
                    <xsl:when test="./i6:value = '1550'">silt loam</xsl:when>
                    <xsl:when test="./i6:value = '1551'">silty clay</xsl:when>
                    <xsl:when test="./i6:value = '1552'">silty clay loam</xsl:when>
                    <xsl:when test="./i6:value = '1564'">Solonetzic</xsl:when>
                    <xsl:when test="./i6:value = '1575'">Spodsol</xsl:when>
                    <xsl:when test="./i6:value = '1650'">Ultisol</xsl:when>
                    <xsl:when test="./i6:value = '1655'">Vertisol</xsl:when>
                    <xsl:when test="./i6:value = '8203'">Koc</xsl:when>
                    <xsl:when test="./i6:value = '8204'">log Koc</xsl:when>
                    <xsl:when test="./i6:value = '8205'">Kd</xsl:when>
                    <xsl:when test="./i6:value = '60828'">log Kd</xsl:when>
                    <xsl:when test="./i6:value = '60206'">not determinable</xsl:when>
                    <xsl:when test="./i6:value = '60207'">not determinable because of methodological limitations</xsl:when>
                    <xsl:when test="./i6:value = '60208'">not measured/tested</xsl:when>
                    <xsl:when test="./i6:value = '60829'">solids-water in soil</xsl:when>
                    <xsl:when test="./i6:value = '60830'">solids-water in sediment</xsl:when>
                    <xsl:when test="./i6:value = '60831'">solids-water in suspended matter</xsl:when>
                    <xsl:when test="./i6:value = '60832'">solids-water in raw sewage sludge</xsl:when>
                    <xsl:when test="./i6:value = '60833'">solids-water in settled sewage sludge</xsl:when>
                    <xsl:when test="./i6:value = '60834'">solids-water in activated sewage sludge</xsl:when>
                    <xsl:when test="./i6:value = '60835'">solids-water in effluent sewage sludge</xsl:when>
                    <xsl:when test="./i6:value = '60836'">soil-water</xsl:when>
                    <xsl:when test="./i6:value = '60837'">suspended matter-water</xsl:when>
                    <xsl:when test="./i6:value = '60838'">sediment-water</xsl:when>
                    <xsl:when test="./i6:value = '60839'">Kp</xsl:when>
                    <xsl:when test="./i6:value = '60840'">log Kp</xsl:when>
                    <xsl:when test="./i6:value = '2201'">not measured</xsl:when>
                    <xsl:when test="./i6:value = '130898'">full study report</xsl:when>
                </xsl:choose>
                <xsl:value-of select="./i6:other "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:AttachedJustification | //xt:CrossReference | //xt:Guideline | //xt:MatrixProperties | //xt:DurationOfAdsorptionEquilibration | //xt:DurationOfDesorptionEquilibration | //xt:AdsorptionCoefficient | //xt:AdsorptionOther | //xt:MassBalanceAtEndOfAdsorptionPhase | //xt:MassBalanceAtEndOfDesorptionPhase | //xt:IdentityTransformation | //xt:AttachedBackgroundMaterial">
        <tr class="headerBlock">
            <td>
                <xsl:choose>
                    <xsl:when test="name(.) = 'MassBalanceAtEndOfDesorptionPhase'">Mass balance (%) at end of desorption phase</xsl:when>
                    <xsl:when test="name(.) = 'AdsorptionOther'">Partition coefficients</xsl:when>
                    <xsl:when test="name(.) = 'MassBalanceAtEndOfAdsorptionPhase'">Mass balance (%) at end of adsorption phase</xsl:when>
                    <xsl:when test="name(.) = 'IdentityTransformation'">Identity of transformation products</xsl:when>
                    <xsl:when test="name(.) = 'CrossReference'">Cross-reference</xsl:when>
                    <xsl:when test="name(.) = 'Guideline'">Test guideline</xsl:when>
                    <xsl:when test="name(.) = 'AdsorptionCoefficient'">Adsorption coefficient</xsl:when>
                    <xsl:when test="name(.) = 'AttachedJustification'">Attached justification</xsl:when>
                    <xsl:when test="name(.) = 'DurationOfAdsorptionEquilibration'">Duration of adsorption equilibration</xsl:when>
                    <xsl:when test="name(.) = 'DurationOfDesorptionEquilibration'">Duration of desorption equilibration</xsl:when>
                    <xsl:when test="name(.) = 'AttachedBackgroundMaterial'">Attachments</xsl:when>
                    <xsl:when test="name(.) = 'MatrixProperties'">Matrix properties</xsl:when>
                </xsl:choose>
            </td>
            <td>
                <hr/>
            </td>
        </tr>
        <xsl:apply-templates select="./@*"/>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="//xt:AdministrativeData | //xt:DataSource | //xt:MaterialsAndMethods | //xt:TestMaterials | //xt:StudyDesign | //xt:HPLCMethod | //xt:BatchEquilibriumOrOtherMethod | //xt:AnyOtherInformationOnMaterialsAndMethodsInclTables | //xt:ResultsAndDiscussion | //xt:ResultsHplcMethod | //xt:ResultsBatchEquilibriumOrOtherMethod | //xt:AnyOtherInformationOnResultsInclTables | //xt:OverallRemarksAttachments | //xt:ApplicantSummaryAndConclusion">
        <tr class="headerBlock">
            <td>
                <xsl:choose>
                    <xsl:when test="name(.) = 'OverallRemarksAttachments'">Overall remarks, attachments</xsl:when>
                    <xsl:when test="name(.) = 'AdministrativeData'">Administrative data</xsl:when>
                    <xsl:when test="name(.) = 'ResultsHplcMethod'">Results: HPLC method</xsl:when>
                    <xsl:when test="name(.) = 'AnyOtherInformationOnResultsInclTables'">Any other information on results incl. tables</xsl:when>
                    <xsl:when test="name(.) = 'StudyDesign'">Study design</xsl:when>
                    <xsl:when test="name(.) = 'ResultsBatchEquilibriumOrOtherMethod'">Results: Batch equilibrium or other method</xsl:when>
                    <xsl:when test="name(.) = 'DataSource'">Data source</xsl:when>
                    <xsl:when test="name(.) = 'HPLCMethod'">HPLC method</xsl:when>
                    <xsl:when test="name(.) = 'ApplicantSummaryAndConclusion'">Applicant's summary and conclusion</xsl:when>
                    <xsl:when test="name(.) = 'TestMaterials'">Test material</xsl:when>
                    <xsl:when test="name(.) = 'MaterialsAndMethods'">Materials and methods</xsl:when>
                    <xsl:when test="name(.) = 'BatchEquilibriumOrOtherMethod'">Batch equilibrium or other method</xsl:when>
                    <xsl:when test="name(.) = 'AnyOtherInformationOnMaterialsAndMethodsInclTables'">Any other information on materials and methods incl. tables</xsl:when>
                    <xsl:when test="name(.) = 'ResultsAndDiscussion'">Results and discussion</xsl:when>
                </xsl:choose>
            </td>
            <td>
                <hr/>
            </td>
        </tr>
        <xsl:apply-templates select="./@*"/>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="//xt:StudyPeriod | //xt:JustificationForTypeOfInformation | //xt:Remarks | //xt:VersionRemarks | //xt:MethodNoGuideline | //xt:SpecificDetailsOnTestMaterialUsedForTheStudy | //xt:SpecificDetailsOnTestMaterialUsedForTheStudyConfidential | //xt:TestTemperature | //xt:DetailsOnStudyDesignHplcMethod | //xt:DetailsOnSampling | //xt:DetailsOnAnalyticalMethods | //xt:DetailsOnMatrix | //xt:DetailsOnTestConditions | //xt:Remarks | //xt:Remarks | //xt:ComputationalMethods | //xt:OtherInformation | //xt:Matrix | //xt:Matrix | //xt:DetailsOnResultsHplcMethod | //xt:AdsorptionAndDesorptionConstants | //xt:RecoveryOfTestMaterial | //xt:ConcentrationOfTestSubstanceAtEndOfAdsorptionEquilibrationPeriod | //xt:ConcentrationOfTestSubstanceAtEndOfDesorptionEquilibrationPeriod | //xt:DetailsOnResultsBatchEquilibriumMethod | //xt:Statistics | //xt:OtherInformation | //xt:RemarksOnResults | //xt:Remarks | //xt:Conclusions | //xt:ExecutiveSummary">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'VersionRemarks'">Version / remarks</xsl:when>
                    <xsl:when test="name(.) = 'ConcentrationOfTestSubstanceAtEndOfAdsorptionEquilibrationPeriod'">Concentration of test substance at end of adsorption equilibration period</xsl:when>
                    <xsl:when test="name(.) = 'StudyPeriod'">Study period</xsl:when>
                    <xsl:when test="name(.) = 'OtherInformation'"/>
                    <xsl:when test="name(.) = 'RecoveryOfTestMaterial'">Recovery of test material</xsl:when>
                    <xsl:when test="name(.) = 'DetailsOnResultsBatchEquilibriumMethod'">Details on results (Batch equilibrium method)</xsl:when>
                    <xsl:when test="name(.) = 'DetailsOnSampling'">Details on sampling</xsl:when>
                    <xsl:when test="name(.) = 'TestTemperature'">Test temperature</xsl:when>
                    <xsl:when test="name(.) = 'Matrix'">Matrix</xsl:when>
                    <xsl:when test="name(.) = 'Remarks'">Remarks</xsl:when>
                    <xsl:when test="name(.) = 'RemarksOnResults'">Overall remarks</xsl:when>
                    <xsl:when test="name(.) = 'ExecutiveSummary'">Executive summary</xsl:when>
                    <xsl:when test="name(.) = 'ComputationalMethods'">Computational methods</xsl:when>
                    <xsl:when test="name(.) = 'DetailsOnMatrix'">Details on matrix</xsl:when>
                    <xsl:when test="name(.) = 'SpecificDetailsOnTestMaterialUsedForTheStudyConfidential'">Specific details on test material used for the study (confidential)</xsl:when>
                    <xsl:when test="name(.) = 'DetailsOnAnalyticalMethods'">Details on analytical methods</xsl:when>
                    <xsl:when test="name(.) = 'DetailsOnResultsHplcMethod'">Details on results (HPLC method)</xsl:when>
                    <xsl:when test="name(.) = 'AdsorptionAndDesorptionConstants'">Adsorption and desorption constants</xsl:when>
                    <xsl:when test="name(.) = 'Conclusions'">Conclusions</xsl:when>
                    <xsl:when test="name(.) = 'ConcentrationOfTestSubstanceAtEndOfDesorptionEquilibrationPeriod'">Concentration of test substance at end of desorption equilibration period</xsl:when>
                    <xsl:when test="name(.) = 'Statistics'">Statistics</xsl:when>
                    <xsl:when test="name(.) = 'MethodNoGuideline'">Principles of method if other than guideline</xsl:when>
                    <xsl:when test="name(.) = 'DetailsOnStudyDesignHplcMethod'">Details on study design: HPLC method</xsl:when>
                    <xsl:when test="name(.) = 'JustificationForTypeOfInformation'">Justification for type of information</xsl:when>
                    <xsl:when test="name(.) = 'SpecificDetailsOnTestMaterialUsedForTheStudy'">Specific details on test material used for the study</xsl:when>
                    <xsl:when test="name(.) = 'DetailsOnTestConditions'">Details on test conditions</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:value-of select=". "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//i6:country/i6:value">
        <xsl:choose>
            <xsl:when test=". = '2683'">Afghanistan </xsl:when>
            <xsl:when test=". = '2684'">Albania </xsl:when>
            <xsl:when test=". = '2685'">Algeria </xsl:when>
            <xsl:when test=". = '2686'">American Samoa </xsl:when>
            <xsl:when test=". = '2688'">Andorra </xsl:when>
            <xsl:when test=". = '2689'">Angola </xsl:when>
            <xsl:when test=". = '2690'">Anguilla </xsl:when>
            <xsl:when test=". = '2692'">Antarctica </xsl:when>
            <xsl:when test=". = '2695'">Antigua and Barbuda </xsl:when>
            <xsl:when test=". = '2696'">Argentina </xsl:when>
            <xsl:when test=". = '2697'">Armenia </xsl:when>
            <xsl:when test=". = '2698'">Aruba </xsl:when>
            <xsl:when test=". = '107'">Australia </xsl:when>
            <xsl:when test=". = '108'">Austria </xsl:when>
            <xsl:when test=". = '2701'">Azerbaijan </xsl:when>
            <xsl:when test=". = '2702'">Bahamas (the) </xsl:when>
            <xsl:when test=". = '2703'">Bahrain </xsl:when>
            <xsl:when test=". = '2704'">Bangladesh </xsl:when>
            <xsl:when test=". = '2705'">Barbados </xsl:when>
            <xsl:when test=". = '2707'">Belarus </xsl:when>
            <xsl:when test=". = '147'">Belgium </xsl:when>
            <xsl:when test=". = '2708'">Belize </xsl:when>
            <xsl:when test=". = '2709'">Benin </xsl:when>
            <xsl:when test=". = '2710'">Bermuda </xsl:when>
            <xsl:when test=". = '2711'">Bhutan </xsl:when>
            <xsl:when test=". = '2720'">Bolivia (Plurinational State of) </xsl:when>
            <xsl:when test=". = '65600'">Bonaire, Sint Eustatius and Saba </xsl:when>
            <xsl:when test=". = '2722'">Bosnia and Herzegovina </xsl:when>
            <xsl:when test=". = '2723'">Botswana </xsl:when>
            <xsl:when test=". = '2724'">Bouvet Island </xsl:when>
            <xsl:when test=". = '2725'">Brazil </xsl:when>
            <xsl:when test=". = '2726'">British Indian Ocean Territory (the) </xsl:when>
            <xsl:when test=". = '2727'">Brunei Darussalam </xsl:when>
            <xsl:when test=". = '184'">Bulgaria </xsl:when>
            <xsl:when test=". = '2729'">Burkina Faso </xsl:when>
            <xsl:when test=". = '2730'">Burundi </xsl:when>
            <xsl:when test=". = '2736'">Cabo Verde </xsl:when>
            <xsl:when test=". = '2734'">Cambodia </xsl:when>
            <xsl:when test=". = '2735'">Cameroon </xsl:when>
            <xsl:when test=". = '206'">Canada </xsl:when>
            <xsl:when test=". = '2746'">Cayman Islands (the) </xsl:when>
            <xsl:when test=". = '2747'">Central African Republic (the) </xsl:when>
            <xsl:when test=". = '2748'">Chad </xsl:when>
            <xsl:when test=". = '2749'">Chile </xsl:when>
            <xsl:when test=". = '2750'">China </xsl:when>
            <xsl:when test=". = '2751'">Christmas Island </xsl:when>
            <xsl:when test=". = '2754'">Cocos (Keeling) Islands (the) </xsl:when>
            <xsl:when test=". = '2755'">Colombia </xsl:when>
            <xsl:when test=". = '2759'">Comoros (the) </xsl:when>
            <xsl:when test=". = '2765'">Congo (the Democratic Republic of the) </xsl:when>
            <xsl:when test=". = '2764'">Congo (the) </xsl:when>
            <xsl:when test=". = '2769'">Cook Islands (the) </xsl:when>
            <xsl:when test=". = '2771'">Costa Rica </xsl:when>
            <xsl:when test=". = '286'">Croatia </xsl:when>
            <xsl:when test=". = '2773'">Cuba </xsl:when>
            <xsl:when test=". = '65601'">Curaçao </xsl:when>
            <xsl:when test=". = '304'">Cyprus </xsl:when>
            <xsl:when test=". = '307'">Czechia </xsl:when>
            <xsl:when test=". = '2774'">Côte d'Ivoire </xsl:when>
            <xsl:when test=". = '333'">Denmark </xsl:when>
            <xsl:when test=". = '2790'">Djibouti </xsl:when>
            <xsl:when test=". = '2791'">Dominica </xsl:when>
            <xsl:when test=". = '2792'">Dominican Republic (the) </xsl:when>
            <xsl:when test=". = '2799'">Ecuador </xsl:when>
            <xsl:when test=". = '2800'">Egypt </xsl:when>
            <xsl:when test=". = '2801'">El Salvador </xsl:when>
            <xsl:when test=". = '2803'">Equatorial Guinea </xsl:when>
            <xsl:when test=". = '2804'">Eritrea </xsl:when>
            <xsl:when test=". = '754'">Estonia </xsl:when>
            <xsl:when test=". = '3358'">Eswatini </xsl:when>
            <xsl:when test=". = '2805'">Ethiopia </xsl:when>
            <xsl:when test=". = '2813'">Falkland Islands (the) [Malvinas] </xsl:when>
            <xsl:when test=". = '2815'">Faroe Islands (the) </xsl:when>
            <xsl:when test=". = '2817'">Fiji </xsl:when>
            <xsl:when test=". = '766'">Finland </xsl:when>
            <xsl:when test=". = '779'">France </xsl:when>
            <xsl:when test=". = '2825'">French Guiana </xsl:when>
            <xsl:when test=". = '2826'">French Polynesia </xsl:when>
            <xsl:when test=". = '2827'">French Southern Territories (the) </xsl:when>
            <xsl:when test=". = '2828'">Gabon </xsl:when>
            <xsl:when test=". = '2829'">Gambia (the) </xsl:when>
            <xsl:when test=". = '2834'">Georgia </xsl:when>
            <xsl:when test=". = '807'">Germany </xsl:when>
            <xsl:when test=". = '2835'">Ghana </xsl:when>
            <xsl:when test=". = '2836'">Gibraltar </xsl:when>
            <xsl:when test=". = '810'">Greece </xsl:when>
            <xsl:when test=". = '2838'">Greenland </xsl:when>
            <xsl:when test=". = '2839'">Grenada </xsl:when>
            <xsl:when test=". = '2840'">Guadeloupe </xsl:when>
            <xsl:when test=". = '2841'">Guam </xsl:when>
            <xsl:when test=". = '2842'">Guatemala </xsl:when>
            <xsl:when test=". = '7818'">Guernsey </xsl:when>
            <xsl:when test=". = '2843'">Guinea </xsl:when>
            <xsl:when test=". = '2844'">Guinea-Bissau </xsl:when>
            <xsl:when test=". = '2845'">Guyana </xsl:when>
            <xsl:when test=". = '2846'">Haiti </xsl:when>
            <xsl:when test=". = '2851'">Heard Island and McDonald Islands </xsl:when>
            <xsl:when test=". = '2854'">Holy See (the) </xsl:when>
            <xsl:when test=". = '2855'">Honduras </xsl:when>
            <xsl:when test=". = '2856'">Hong Kong </xsl:when>
            <xsl:when test=". = '845'">Hungary </xsl:when>
            <xsl:when test=". = '882'">Iceland </xsl:when>
            <xsl:when test=". = '2865'">India </xsl:when>
            <xsl:when test=". = '2866'">Indonesia </xsl:when>
            <xsl:when test=". = '2870'">Iran (Islamic Republic of) </xsl:when>
            <xsl:when test=". = '2871'">Iraq </xsl:when>
            <xsl:when test=". = '911'">Ireland </xsl:when>
            <xsl:when test=". = '7819'">Isle of Man </xsl:when>
            <xsl:when test=". = '2876'">Israel </xsl:when>
            <xsl:when test=". = '916'">Italy </xsl:when>
            <xsl:when test=". = '2877'">Jamaica </xsl:when>
            <xsl:when test=". = '918'">Japan </xsl:when>
            <xsl:when test=". = '7820'">Jersey </xsl:when>
            <xsl:when test=". = '2878'">Jordan </xsl:when>
            <xsl:when test=". = '2879'">Kazakhstan </xsl:when>
            <xsl:when test=". = '2880'">Kenya </xsl:when>
            <xsl:when test=". = '2881'">Kiribati </xsl:when>
            <xsl:when test=". = '2882'">Korea (the Democratic People's Republic of) </xsl:when>
            <xsl:when test=". = '2883'">Korea (the Republic of) </xsl:when>
            <xsl:when test=". = '2884'">Kuwait </xsl:when>
            <xsl:when test=". = '2885'">Kyrgyzstan </xsl:when>
            <xsl:when test=". = '2886'">Lao People's Democratic Republic (the) </xsl:when>
            <xsl:when test=". = '985'">Latvia </xsl:when>
            <xsl:when test=". = '2887'">Lebanon </xsl:when>
            <xsl:when test=". = '2888'">Lesotho </xsl:when>
            <xsl:when test=". = '2889'">Liberia </xsl:when>
            <xsl:when test=". = '2890'">Libya </xsl:when>
            <xsl:when test=". = '2891'">Liechtenstein </xsl:when>
            <xsl:when test=". = '1024'">Lithuania </xsl:when>
            <xsl:when test=". = '1041'">Luxembourg </xsl:when>
            <xsl:when test=". = '2896'">Macao </xsl:when>
            <xsl:when test=". = '2898'">Madagascar </xsl:when>
            <xsl:when test=". = '2899'">Malawi </xsl:when>
            <xsl:when test=". = '2900'">Malaysia </xsl:when>
            <xsl:when test=". = '2901'">Maldives </xsl:when>
            <xsl:when test=". = '2902'">Mali </xsl:when>
            <xsl:when test=". = '1048'">Malta </xsl:when>
            <xsl:when test=". = '2904'">Marshall Islands (the) </xsl:when>
            <xsl:when test=". = '2905'">Martinique </xsl:when>
            <xsl:when test=". = '2908'">Mauritania </xsl:when>
            <xsl:when test=". = '2909'">Mauritius </xsl:when>
            <xsl:when test=". = '2910'">Mayotte </xsl:when>
            <xsl:when test=". = '1067'">Mexico </xsl:when>
            <xsl:when test=". = '3877'">Micronesia (Federated States of) </xsl:when>
            <xsl:when test=". = '2919'">Moldova (the Republic of) </xsl:when>
            <xsl:when test=". = '2921'">Monaco </xsl:when>
            <xsl:when test=". = '2922'">Mongolia </xsl:when>
            <xsl:when test=". = '7821'">Montenegro </xsl:when>
            <xsl:when test=". = '2924'">Montserrat </xsl:when>
            <xsl:when test=". = '2925'">Morocco </xsl:when>
            <xsl:when test=". = '2926'">Mozambique </xsl:when>
            <xsl:when test=". = '2930'">Myanmar </xsl:when>
            <xsl:when test=". = '2932'">Namibia </xsl:when>
            <xsl:when test=". = '2933'">Nauru </xsl:when>
            <xsl:when test=". = '2934'">Nepal </xsl:when>
            <xsl:when test=". = '1158'">Netherlands (the) </xsl:when>
            <xsl:when test=". = '2935'">Netherlands Antilles </xsl:when>
            <xsl:when test=". = '2938'">New Caledonia </xsl:when>
            <xsl:when test=". = '1161'">New Zealand </xsl:when>
            <xsl:when test=". = '2939'">Nicaragua </xsl:when>
            <xsl:when test=". = '2940'">Niger (the) </xsl:when>
            <xsl:when test=". = '2941'">Nigeria </xsl:when>
            <xsl:when test=". = '2942'">Niue </xsl:when>
            <xsl:when test=". = '2945'">Norfolk Island </xsl:when>
            <xsl:when test=". = '2897'">North Macedonia </xsl:when>
            <xsl:when test=". = '2946'">Northern Mariana Islands (the) </xsl:when>
            <xsl:when test=". = '1175'">Norway </xsl:when>
            <xsl:when test=". = '2977'">Oman </xsl:when>
            <xsl:when test=". = '2984'">Pakistan </xsl:when>
            <xsl:when test=". = '2985'">Palau </xsl:when>
            <xsl:when test=". = '2986'">Palestine, State of </xsl:when>
            <xsl:when test=". = '2987'">Panama </xsl:when>
            <xsl:when test=". = '2988'">Papua New Guinea </xsl:when>
            <xsl:when test=". = '2989'">Paraguay </xsl:when>
            <xsl:when test=". = '2994'">Peru </xsl:when>
            <xsl:when test=". = '2995'">Philippines (the) </xsl:when>
            <xsl:when test=". = '3000'">Pitcairn </xsl:when>
            <xsl:when test=". = '1394'">Poland </xsl:when>
            <xsl:when test=". = '1401'">Portugal </xsl:when>
            <xsl:when test=". = '3027'">Puerto Rico </xsl:when>
            <xsl:when test=". = '3028'">Qatar </xsl:when>
            <xsl:when test=". = '1496'">Romania </xsl:when>
            <xsl:when test=". = '3175'">Russian Federation (the) </xsl:when>
            <xsl:when test=". = '3176'">Rwanda </xsl:when>
            <xsl:when test=". = '3177'">Réunion </xsl:when>
            <xsl:when test=". = '7823'">Saint Barthélemy </xsl:when>
            <xsl:when test=". = '3318'">Saint Helena, Ascension and Tristan da Cunha </xsl:when>
            <xsl:when test=". = '3319'">Saint Kitts and Nevis </xsl:when>
            <xsl:when test=". = '3320'">Saint Lucia </xsl:when>
            <xsl:when test=". = '7824'">Saint Martin (French part) </xsl:when>
            <xsl:when test=". = '3321'">Saint Pierre and Miquelon </xsl:when>
            <xsl:when test=". = '3322'">Saint Vincent and the Grenadines </xsl:when>
            <xsl:when test=". = '3323'">Samoa </xsl:when>
            <xsl:when test=". = '3324'">San Marino </xsl:when>
            <xsl:when test=". = '3325'">Sao Tome and Principe </xsl:when>
            <xsl:when test=". = '3326'">Saudi Arabia </xsl:when>
            <xsl:when test=". = '3328'">Senegal </xsl:when>
            <xsl:when test=". = '3332'">Serbia </xsl:when>
            <xsl:when test=". = '3333'">Seychelles </xsl:when>
            <xsl:when test=". = '3336'">Sierra Leone </xsl:when>
            <xsl:when test=". = '3337'">Singapore </xsl:when>
            <xsl:when test=". = '65602'">Sint Maarten (Dutch part) </xsl:when>
            <xsl:when test=". = '3339'">Slovakia </xsl:when>
            <xsl:when test=". = '1562'">Slovenia </xsl:when>
            <xsl:when test=". = '3340'">Solomon Islands </xsl:when>
            <xsl:when test=". = '3343'">Somalia </xsl:when>
            <xsl:when test=". = '3344'">South Africa </xsl:when>
            <xsl:when test=". = '3345'">South Georgia and the South Sandwich Islands </xsl:when>
            <xsl:when test=". = '65603'">South Sudan </xsl:when>
            <xsl:when test=". = '1567'">Spain </xsl:when>
            <xsl:when test=". = '3346'">Sri Lanka </xsl:when>
            <xsl:when test=". = '3352'">Sudan (the) </xsl:when>
            <xsl:when test=". = '3355'">Suriname </xsl:when>
            <xsl:when test=". = '3357'">Svalbard and Jan Mayen </xsl:when>
            <xsl:when test=". = '1591'">Sweden </xsl:when>
            <xsl:when test=". = '1595'">Switzerland </xsl:when>
            <xsl:when test=". = '3359'">Syrian Arab Republic (the) </xsl:when>
            <xsl:when test=". = '3362'">Taiwan </xsl:when>
            <xsl:when test=". = '3363'">Tajikistan </xsl:when>
            <xsl:when test=". = '3364'">Tanzania, the United Republic of </xsl:when>
            <xsl:when test=". = '3366'">Thailand </xsl:when>
            <xsl:when test=". = '3370'">Timor-Leste </xsl:when>
            <xsl:when test=". = '3371'">Togo </xsl:when>
            <xsl:when test=". = '3372'">Tokelau </xsl:when>
            <xsl:when test=". = '3373'">Tonga </xsl:when>
            <xsl:when test=". = '3393'">Trinidad and Tobago </xsl:when>
            <xsl:when test=". = '3394'">Tunisia </xsl:when>
            <xsl:when test=". = '1641'">Turkey </xsl:when>
            <xsl:when test=". = '3395'">Turkmenistan </xsl:when>
            <xsl:when test=". = '3396'">Turks and Caicos Islands (the) </xsl:when>
            <xsl:when test=". = '3397'">Tuvalu </xsl:when>
            <xsl:when test=". = '3402'">Uganda </xsl:when>
            <xsl:when test=". = '3403'">Ukraine </xsl:when>
            <xsl:when test=". = '3406'">United Arab Emirates (the) </xsl:when>
            <xsl:when test=". = '1651'">United Kingdom of Great Britain and Northern Ireland (the) </xsl:when>
            <xsl:when test=". = '63145'">United Kingdom: Northern Ireland </xsl:when>
            <xsl:when test=". = '1652'">United States (the) </xsl:when>
            <xsl:when test=". = '3407'">United States Minor Outlying Islands (the) </xsl:when>
            <xsl:when test=". = '3410'">Uruguay </xsl:when>
            <xsl:when test=". = '3412'">Uzbekistan </xsl:when>
            <xsl:when test=". = '3414'">Vanuatu </xsl:when>
            <xsl:when test=". = '3416'">Venezuela (Bolivarian Republic of) </xsl:when>
            <xsl:when test=". = '3420'">Viet Nam </xsl:when>
            <xsl:when test=". = '3421'">Virgin Islands (British) </xsl:when>
            <xsl:when test=". = '3422'">Virgin Islands (U.S.) </xsl:when>
            <xsl:when test=". = '3425'">Wallis And Futuna </xsl:when>
            <xsl:when test=". = '3428'">Western Sahara </xsl:when>
            <xsl:when test=". = '3433'">Yemen </xsl:when>
            <xsl:when test=". = '3434'">Zambia </xsl:when>
            <xsl:when test=". = '3435'">Zimbabwe </xsl:when>
            <xsl:when test=". = '3446'">Åland Islands </xsl:when>
            <xsl:when test=". = '1173'">no data </xsl:when>
            <xsl:when test=". = '2207'">not specified </xsl:when>
            <xsl:when test=". = '1342'">other: </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="//xt:DataProtection/i6:confidentiality">
        <xsl:choose>
            <xsl:when test=". = '2732'">CBI </xsl:when>
            <xsl:when test=". = '2859'">IP </xsl:when>
            <xsl:when test=". = '3441'">no PA </xsl:when>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
