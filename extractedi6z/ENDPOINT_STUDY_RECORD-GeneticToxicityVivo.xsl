<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:i6="http://iuclid6.echa.europa.eu/namespaces/platform-fields/v1" xmlns:i6c="http://iuclid6.echa.europa.eu/namespaces/platform-container/v1" xmlns:xt="http://iuclid6.echa.europa.eu/namespaces/ENDPOINT_STUDY_RECORD-GeneticToxicityVivo/7.0" version="1.0">
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
            <td>Genetic toxicity in vivo</td>
            <td>
                <hr/>
            </td>
        </tr>
        <xsl:apply-templates select="./@*"/>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="//xt:RobustStudy | //xt:UsedForClassification | //xt:UsedForMSDS | //xt:KeyResult">
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
    <xsl:template match="//xt:RelatedInformation | //xt:TestMaterialInformation">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'RelatedInformation'">Related information</xsl:when>
                    <xsl:when test="name(.) = 'TestMaterialInformation'">Test material information</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:value-of select=". "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:DoseConc">
        <tr>
            <td class="label">Dose / conc.</td>
            <td class="value">
                <xsl:value-of select="./value "/>
                <xsl:choose>
                    <xsl:when test="./unitCode = '2087'"> mg/kg bw/day (nominal)</xsl:when>
                    <xsl:when test="./unitCode = '2086'"> mg/kg bw/day (actual dose received)</xsl:when>
                    <xsl:when test="./unitCode = '2085'"> mg/kg bw/day</xsl:when>
                    <xsl:when test="./unitCode = '2090'"> mg/kg diet</xsl:when>
                    <xsl:when test="./unitCode = '2102'"> mg/L drinking water</xsl:when>
                    <xsl:when test="./unitCode = '2082'"> mg/kg bw (total dose)</xsl:when>
                    <xsl:when test="./unitCode = '2099'"> mg/L air</xsl:when>
                    <xsl:when test="./unitCode = '2101'"> mg/L air (nominal)</xsl:when>
                    <xsl:when test="./unitCode = '2100'"> mg/L air (analytical)</xsl:when>
                    <xsl:when test="./unitCode = '2104'"> mg/m³ air</xsl:when>
                    <xsl:when test="./unitCode = '2106'"> mg/m³ air (nominal)</xsl:when>
                    <xsl:when test="./unitCode = '2105'"> mg/m³ air (analytical)</xsl:when>
                    <xsl:when test="./unitCode = '2283'"> ppm</xsl:when>
                    <xsl:when test="./unitCode = '2285'"> ppm (nominal)</xsl:when>
                    <xsl:when test="./unitCode = '2284'"> ppm (analytical)</xsl:when>
                    <xsl:when test="./unitCode = '1342'"> other:</xsl:when>
                    <xsl:when test="./unitCode = '116647'"> CFU/kg bw/day (actual dose received)</xsl:when>
                    <xsl:when test="./unitCode = '116646'"> CFU/kg bw/day (nominal)</xsl:when>
                    <xsl:when test="./unitCode = '116664'"> CFU/kg bw/day</xsl:when>
                    <xsl:when test="./unitCode = '116574'"> CFU/kg diet</xsl:when>
                    <xsl:when test="./unitCode = '116648'"> CFU/L drinking water</xsl:when>
                    <xsl:when test="./unitCode = '116649'"> CFU/kg bw (total dose)</xsl:when>
                    <xsl:when test="./unitCode = '116619'"> CFU/L air</xsl:when>
                    <xsl:when test="./unitCode = '116607'"> CFU/m³ air</xsl:when>
                    <xsl:when test="./unitCode = '116656'"> IU/kg bw/day (actual dose received)</xsl:when>
                    <xsl:when test="./unitCode = '116655'"> IU/kg bw/day (nominal)</xsl:when>
                    <xsl:when test="./unitCode = '129818'"> IU//kg bw/day</xsl:when>
                    <xsl:when test="./unitCode = '116587'"> IU/kg diet</xsl:when>
                    <xsl:when test="./unitCode = '116657'"> IU/L drinking water</xsl:when>
                    <xsl:when test="./unitCode = '116658'"> IU/kg bw (total dose)</xsl:when>
                    <xsl:when test="./unitCode = '116625'"> IU/L air</xsl:when>
                    <xsl:when test="./unitCode = '116613'"> IU/m³ air</xsl:when>
                    <xsl:when test="./unitCode = '116643'"> OB/kg bw/day (actual dose received)</xsl:when>
                    <xsl:when test="./unitCode = '116642'"> OB/kg bw/day (nominal)</xsl:when>
                    <xsl:when test="./unitCode = '116662'"> OB/kg bw/day</xsl:when>
                    <xsl:when test="./unitCode = '116567'"> OB/kg diet</xsl:when>
                    <xsl:when test="./unitCode = '116644'"> OB/L drinking water</xsl:when>
                    <xsl:when test="./unitCode = '116645'"> OB/kg bw (total dose)</xsl:when>
                    <xsl:when test="./unitCode = '116622'"> OB/L air</xsl:when>
                    <xsl:when test="./unitCode = '116610'"> OB/m³ air</xsl:when>
                    <xsl:when test="./unitCode = '129819'"> spores/kg bw/day (actual dose received)</xsl:when>
                    <xsl:when test="./unitCode = '116667'"> spores/kg bw/day (nominal)</xsl:when>
                    <xsl:when test="./unitCode = '116659'"> spores/kg bw/day</xsl:when>
                    <xsl:when test="./unitCode = '116580'"> spores/kg diet</xsl:when>
                    <xsl:when test="./unitCode = '129820'"> spores/L drinking water</xsl:when>
                    <xsl:when test="./unitCode = '129821'"> spores/kg bw (total dose)</xsl:when>
                    <xsl:when test="./unitCode = '129822'"> spores/L air</xsl:when>
                    <xsl:when test="./unitCode = '116616'"> spores/m³ air</xsl:when>
                </xsl:choose>
                <xsl:value-of select="./unitOther "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:DataWaivingJustification | //xt:ControlGroup">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'DataWaivingJustification'">Justification for data waiving</xsl:when>
                    <xsl:when test="name(.) = 'ControlGroup'">Control animals</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:choose>
                    <xsl:when test="./i6:value = '1342'">other:</xsl:when>
                    <xsl:when test="./i6:value = '2480'">yes</xsl:when>
                    <xsl:when test="./i6:value = '2482'">yes, concurrent no treatment</xsl:when>
                    <xsl:when test="./i6:value = '2483'">yes, concurrent vehicle</xsl:when>
                    <xsl:when test="./i6:value = '2485'">yes, plain diet</xsl:when>
                    <xsl:when test="./i6:value = '2488'">yes, sham-exposed</xsl:when>
                    <xsl:when test="./i6:value = '2484'">yes, historical</xsl:when>
                    <xsl:when test="./i6:value = '2158'">no</xsl:when>
                    <xsl:when test="./i6:value = '2207'">not specified</xsl:when>
                    <xsl:when test="./i6:value = '1173'">no data</xsl:when>
                </xsl:choose>
                <xsl:value-of select="./i6:other "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:Endpoint | //xt:StudyResultType | //xt:PurposeFlag | //xt:Reliability | //xt:RationalReliability | //xt:DataWaiving | //xt:ReasonPurpose | //xt:ReasonPurpose | //xt:DataAccess | //xt:DataProtectionClaimed | //xt:Qualifier | //xt:Guideline | //xt:Deviation | //xt:GLPComplianceStatement | //xt:Studytype | //xt:Species | //xt:Strain | //xt:Sex | //xt:RouteOfAdministration | //xt:Sex | //xt:Genotoxicity | //xt:Toxicity | //xt:VehContrValid | //xt:NegContrValid | //xt:PosContrValid | //xt:RemarksOnResults | //xt:Type">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'Toxicity'">Toxicity</xsl:when>
                    <xsl:when test="name(.) = 'Sex'">Sex</xsl:when>
                    <xsl:when test="name(.) = 'Genotoxicity'">Genotoxicity</xsl:when>
                    <xsl:when test="name(.) = 'DataWaiving'">Data waiving</xsl:when>
                    <xsl:when test="name(.) = 'PurposeFlag'">Adequacy of study</xsl:when>
                    <xsl:when test="name(.) = 'DataAccess'">Data access</xsl:when>
                    <xsl:when test="name(.) = 'Endpoint'">Endpoint</xsl:when>
                    <xsl:when test="name(.) = 'RemarksOnResults'">Remarks on result</xsl:when>
                    <xsl:when test="name(.) = 'Studytype'">Type of assay</xsl:when>
                    <xsl:when test="name(.) = 'RationalReliability'">Rationale for reliability incl. deficiencies</xsl:when>
                    <xsl:when test="name(.) = 'DataProtectionClaimed'">Data protection claimed</xsl:when>
                    <xsl:when test="name(.) = 'Qualifier'">Qualifier</xsl:when>
                    <xsl:when test="name(.) = 'VehContrValid'">Vehicle controls validity</xsl:when>
                    <xsl:when test="name(.) = 'Species'">Species</xsl:when>
                    <xsl:when test="name(.) = 'NegContrValid'">Negative controls validity</xsl:when>
                    <xsl:when test="name(.) = 'Guideline'">Guideline</xsl:when>
                    <xsl:when test="name(.) = 'RouteOfAdministration'">Route of administration</xsl:when>
                    <xsl:when test="name(.) = 'ReasonPurpose'">Reason / purpose for cross-reference</xsl:when>
                    <xsl:when test="name(.) = 'GLPComplianceStatement'">GLP compliance</xsl:when>
                    <xsl:when test="name(.) = 'Strain'">Strain</xsl:when>
                    <xsl:when test="name(.) = 'PosContrValid'">Positive controls validity</xsl:when>
                    <xsl:when test="name(.) = 'Type'">Type</xsl:when>
                    <xsl:when test="name(.) = 'Reliability'">Reliability</xsl:when>
                    <xsl:when test="name(.) = 'Deviation'">Deviations</xsl:when>
                    <xsl:when test="name(.) = 'StudyResultType'">Type of information</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:choose>
                    <xsl:when test="./i6:value = '61394'">in vivo mammalian somatic cell study: cytogenicity / bone marrow chromosome aberration</xsl:when>
                    <xsl:when test="./i6:value = '61395'">in vivo mammalian somatic cell study: cytogenicity / erythrocyte micronucleus</xsl:when>
                    <xsl:when test="./i6:value = '61396'">in vivo mammalian germ cell study: cytogenicity / chromosome aberration</xsl:when>
                    <xsl:when test="./i6:value = '61402'">in vivo mammalian cell study: DNA damage and/or repair</xsl:when>
                    <xsl:when test="./i6:value = '61891'">in vivo mammalian somatic and germ cell study: gene mutation</xsl:when>
                    <xsl:when test="./i6:value = '61403'">in vivo mammalian germ cell study: gene mutation</xsl:when>
                    <xsl:when test="./i6:value = '61912'">in vivo mammalian somatic cell study: gene mutation</xsl:when>
                    <xsl:when test="./i6:value = '61892'">in vivo insect germ cell study: gene mutation</xsl:when>
                    <xsl:when test="./i6:value = '61404'">genetic toxicity in vivo, other</xsl:when>
                    <xsl:when test="./i6:value = '61993'">genetic toxicity in vivo</xsl:when>
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
                    <xsl:when test="./i6:value = '1290'">OECD Guideline 474 (Mammalian Erythrocyte Micronucleus Test)</xsl:when>
                    <xsl:when test="./i6:value = '1291'">OECD Guideline 475 (Mammalian Bone Marrow Chromosome Aberration Test)</xsl:when>
                    <xsl:when test="./i6:value = '65625'">OECD Guideline 475 (Mammalian Bone Marrow Chromosomal Aberration Test)</xsl:when>
                    <xsl:when test="./i6:value = '1293'">OECD Guideline 477 (Genetic Toxicology: Sex-linked Recessive Lethal Test in Drosophila melanogaster)</xsl:when>
                    <xsl:when test="./i6:value = '1294'">OECD Guideline 478 (Genetic Toxicology: Rodent Dominant Lethal Test)</xsl:when>
                    <xsl:when test="./i6:value = '65626'">OECD Guideline 478 (Rodent Dominant Lethal Test)</xsl:when>
                    <xsl:when test="./i6:value = '1299'">OECD Guideline 483 (Mammalian Spermatogonial Chromosome Aberration Test)</xsl:when>
                    <xsl:when test="./i6:value = '1300'">OECD Guideline 484 (Genetic Toxicology: Mouse Spot Test)</xsl:when>
                    <xsl:when test="./i6:value = '1301'">OECD Guideline 485 (Genetic Toxicology: Mouse Heritable Translocation Assay)</xsl:when>
                    <xsl:when test="./i6:value = '1302'">OECD Guideline 486 (Unscheduled DNA Synthesis (UDS) Test with Mammalian Liver Cells in vivo)</xsl:when>
                    <xsl:when test="./i6:value = '61405'">OECD Guideline 488 (Transgenic Rodent Somatic and Germ Cell Gene Mutation Assays)</xsl:when>
                    <xsl:when test="./i6:value = '61406'">OECD Guideline 489 (In vivo Mammalian Alkaline Comet Assay)</xsl:when>
                    <xsl:when test="./i6:value = '667'">EU Method B.11 (Mutagenicity - In Vivo Mammalian Bone-Marrow Chromosome Aberration Test)</xsl:when>
                    <xsl:when test="./i6:value = '668'">EU Method B.12 (Mutagenicity - In Vivo Mammalian Erythrocyte Micronucleus Test)</xsl:when>
                    <xsl:when test="./i6:value = '676'">EU Method B.20 (Sex-linked Recessive Lethal Test in Drosophila melanogaster)</xsl:when>
                    <xsl:when test="./i6:value = '678'">EU Method B.22 (Rodent Dominant Lethal Test)</xsl:when>
                    <xsl:when test="./i6:value = '679'">EU Method B.23 (Mammalian Spermatogonial Chromosome Aberration Test)</xsl:when>
                    <xsl:when test="./i6:value = '680'">EU Method B.24 (Mouse Spot Test)</xsl:when>
                    <xsl:when test="./i6:value = '681'">EU Method B.25 (Mouse heritable translocation)</xsl:when>
                    <xsl:when test="./i6:value = '696'">EU Method B.39 (Unscheduled DNA Synthesis (UDS) Test with Mammalian Liver Cells In Vivo)</xsl:when>
                    <xsl:when test="./i6:value = '61407'">EU Method B.58 (Transgenic Rodent Somatic and Germ Cell Gene Mutation Assays)</xsl:when>
                    <xsl:when test="./i6:value = '61408'">EPA OPP 84-2</xsl:when>
                    <xsl:when test="./i6:value = '521'">EPA OPPTS 870.5195 (Mouse Biochemical Specific Locus Test)</xsl:when>
                    <xsl:when test="./i6:value = '522'">EPA OPPTS 870.5200 (Mouse Visible Specific Locus Test)</xsl:when>
                    <xsl:when test="./i6:value = '525'">EPA OPPTS 870.5275 (Sex-linked Recessive Lethal Test in Drosophila melanogaster)</xsl:when>
                    <xsl:when test="./i6:value = '528'">EPA OPPTS 870.5380 (In Vivo Mammalian Cytogenetics Tests: Spermatogonial Chromosomal Aberrations)</xsl:when>
                    <xsl:when test="./i6:value = '529'">EPA OPPTS 870.5385 (In Vivo Mammalian Cytogenetics Tests: Bone Marrow Chromosomal Analysis)</xsl:when>
                    <xsl:when test="./i6:value = '530'">EPA OPPTS 870.5395 (In Vivo Mammalian Cytogenetics Tests: Erythrocyte Micronucleus Assay)</xsl:when>
                    <xsl:when test="./i6:value = '531'">EPA OPPTS 870.5450 (Rodent Dominant Lethal Assay)</xsl:when>
                    <xsl:when test="./i6:value = '532'">EPA OPPTS 870.5460 (Rodent Heritable Translocation Assays)</xsl:when>
                    <xsl:when test="./i6:value = '537'">EPA OPPTS 870.5915 (In Vivo Sister Chromatid Exchange Assay)</xsl:when>
                    <xsl:when test="./i6:value = '616'">EPA OTS 798.5195 (Mouse Biochemical Specific Locus Test)</xsl:when>
                    <xsl:when test="./i6:value = '617'">EPA OTS 798.5200 (Mouse Visible Specific Locus Test)</xsl:when>
                    <xsl:when test="./i6:value = '620'">EPA OTS 798.5275 (Sex-linked Recessive Lethal Test in Drosophila melanogaster)</xsl:when>
                    <xsl:when test="./i6:value = '623'">EPA OTS 798.5380 (In Vivo Mammalian Cytogenetic Tests: Spermatogonial Chromosomal Aberrations)</xsl:when>
                    <xsl:when test="./i6:value = '624'">EPA OTS 798.5385 (In Vivo Mammalian Cytogenetic Tests: Bone Marrow Chromosomal Analysis)</xsl:when>
                    <xsl:when test="./i6:value = '625'">EPA OTS 798.5395 (In Vivo Mammalian Cytogenics Tests: Erythrocyte Micronucleus Assay)</xsl:when>
                    <xsl:when test="./i6:value = '626'">EPA OTS 798.5450 (Rodent Dominant Lethal Assay)</xsl:when>
                    <xsl:when test="./i6:value = '627'">EPA OTS 798.5460 (Rodent Heritable Translocation Assays)</xsl:when>
                    <xsl:when test="./i6:value = '632'">EPA OTS 798.5915 (In Vivo Sister Chromatid Exchange Assay)</xsl:when>
                    <xsl:when test="./i6:value = '61409'">JAPAN: Guidelines for Screening Mutagenicity Testing Of Chemicals</xsl:when>
                    <xsl:when test="./i6:value = '2246'">other guideline:</xsl:when>
                    <xsl:when test="./i6:value = '425'">EPA OPP 84-2</xsl:when>
                    <xsl:when test="./i6:value = '812'">JAPAN: Guidelines for Screening Mutagenicity Testing Of Chemicals</xsl:when>
                    <xsl:when test="./i6:value = '2158'">no</xsl:when>
                    <xsl:when test="./i6:value = '4179'">yes (incl. QA statement)</xsl:when>
                    <xsl:when test="./i6:value = '1796'">chromosome aberration assay</xsl:when>
                    <xsl:when test="./i6:value = '348'">Drosophila SLRL assay</xsl:when>
                    <xsl:when test="./i6:value = '1875'">endogenous gene animal assay</xsl:when>
                    <xsl:when test="./i6:value = '1966'">heritable translocation assay</xsl:when>
                    <xsl:when test="./i6:value = '2001'">inhibition of DNA-Synthesis</xsl:when>
                    <xsl:when test="./i6:value = '62477'">mammalian bone marrow chromosome aberration test</xsl:when>
                    <xsl:when test="./i6:value = '2366'">mammalian comet assay</xsl:when>
                    <xsl:when test="./i6:value = '62476'">mammalian erythrocyte micronucleus test</xsl:when>
                    <xsl:when test="./i6:value = '62474'">mammalian germ cell chromosome aberration test</xsl:when>
                    <xsl:when test="./i6:value = '2055'">mammalian germ cell cytogenetic assay</xsl:when>
                    <xsl:when test="./i6:value = '65627'">mammalian spermatogonial chromosomal aberration test</xsl:when>
                    <xsl:when test="./i6:value = '2108'">micronucleus assay</xsl:when>
                    <xsl:when test="./i6:value = '2138'">mouse spot test</xsl:when>
                    <xsl:when test="./i6:value = '1863'">rodent dominant lethal assay</xsl:when>
                    <xsl:when test="./i6:value = '2367'">sister chromatid exchange assay</xsl:when>
                    <xsl:when test="./i6:value = '2383'">somatic mutation and recombination test in Drosophila</xsl:when>
                    <xsl:when test="./i6:value = '2431'">transgenic rodent mutagenicity assay</xsl:when>
                    <xsl:when test="./i6:value = '2443'">unscheduled DNA synthesis</xsl:when>
                    <xsl:when test="./i6:value = '2444'">unspecified</xsl:when>
                    <xsl:when test="./i6:value = '2137'">mouse</xsl:when>
                    <xsl:when test="./i6:value = '349'">Drosophila melanogaster</xsl:when>
                    <xsl:when test="./i6:value = '2302'">rat</xsl:when>
                    <xsl:when test="./i6:value = '1789'">cat</xsl:when>
                    <xsl:when test="./i6:value = '1790'">cattle</xsl:when>
                    <xsl:when test="./i6:value = '1861'">dog</xsl:when>
                    <xsl:when test="./i6:value = '1942'">gerbil</xsl:when>
                    <xsl:when test="./i6:value = '1952'">guinea pig</xsl:when>
                    <xsl:when test="./i6:value = '1956'">hamster</xsl:when>
                    <xsl:when test="./i6:value = '1957'">hamster, Armenian</xsl:when>
                    <xsl:when test="./i6:value = '1958'">hamster, Chinese</xsl:when>
                    <xsl:when test="./i6:value = '1959'">hamster, Syrian</xsl:when>
                    <xsl:when test="./i6:value = '1965'">hen</xsl:when>
                    <xsl:when test="./i6:value = '2110'">miniature swine</xsl:when>
                    <xsl:when test="./i6:value = '2130'">monkey</xsl:when>
                    <xsl:when test="./i6:value = '2270'">pig</xsl:when>
                    <xsl:when test="./i6:value = '2293'">primate</xsl:when>
                    <xsl:when test="./i6:value = '2301'">rabbit</xsl:when>
                    <xsl:when test="./i6:value = '2356'">sheep</xsl:when>
                    <xsl:when test="./i6:value = '3501'">AKR</xsl:when>
                    <xsl:when test="./i6:value = '3487'">Abyssinian</xsl:when>
                    <xsl:when test="./i6:value = '3552'">Angora</xsl:when>
                    <xsl:when test="./i6:value = '3502'">B6C3F1</xsl:when>
                    <xsl:when test="./i6:value = '3503'">Balb/c</xsl:when>
                    <xsl:when test="./i6:value = '3486'">Beagle</xsl:when>
                    <xsl:when test="./i6:value = '3553'">Belgian Hare</xsl:when>
                    <xsl:when test="./i6:value = '3565'">Brown Norway</xsl:when>
                    <xsl:when test="./i6:value = '3504'">C3H</xsl:when>
                    <xsl:when test="./i6:value = '3505'">C57BL</xsl:when>
                    <xsl:when test="./i6:value = '3506'">CAF1</xsl:when>
                    <xsl:when test="./i6:value = '3507'">CB6F1</xsl:when>
                    <xsl:when test="./i6:value = '3508'">CBA</xsl:when>
                    <xsl:when test="./i6:value = '3509'">CD-1</xsl:when>
                    <xsl:when test="./i6:value = '3510'">CF-1</xsl:when>
                    <xsl:when test="./i6:value = '3554'">Californian</xsl:when>
                    <xsl:when test="./i6:value = '3555'">Chinchilla</xsl:when>
                    <xsl:when test="./i6:value = '3566'">Crj: CD(SD)</xsl:when>
                    <xsl:when test="./i6:value = '3511'">DBA</xsl:when>
                    <xsl:when test="./i6:value = '3512'">DBF1</xsl:when>
                    <xsl:when test="./i6:value = '3488'">Dunkin-Hartley</xsl:when>
                    <xsl:when test="./i6:value = '3556'">Dutch</xsl:when>
                    <xsl:when test="./i6:value = '3513'">FVB</xsl:when>
                    <xsl:when test="./i6:value = '3567'">Fischer 344</xsl:when>
                    <xsl:when test="./i6:value = '3568'">Fischer 344/DuCrj</xsl:when>
                    <xsl:when test="./i6:value = '3557'">Flemish Giant</xsl:when>
                    <xsl:when test="./i6:value = '3489'">Hartley</xsl:when>
                    <xsl:when test="./i6:value = '3558'">Himalayan</xsl:when>
                    <xsl:when test="./i6:value = '3514'">ICL-ICR</xsl:when>
                    <xsl:when test="./i6:value = '3515'">ICR</xsl:when>
                    <xsl:when test="./i6:value = '3569'">Lewis</xsl:when>
                    <xsl:when test="./i6:value = '3570'">Long-Evans</xsl:when>
                    <xsl:when test="./i6:value = '3498'">Macaca fascicularis</xsl:when>
                    <xsl:when test="./i6:value = '3499'">Marmoset</xsl:when>
                    <xsl:when test="./i6:value = '3500'">Mulatta arctoides</xsl:when>
                    <xsl:when test="./i6:value = '3516'">NMRI</xsl:when>
                    <xsl:when test="./i6:value = '3559'">New Zealand Black</xsl:when>
                    <xsl:when test="./i6:value = '3560'">New Zealand Red</xsl:when>
                    <xsl:when test="./i6:value = '3561'">New Zealand White</xsl:when>
                    <xsl:when test="./i6:value = '60957'">Nude</xsl:when>
                    <xsl:when test="./i6:value = '3517'">Nude Balb/cAnN</xsl:when>
                    <xsl:when test="./i6:value = '3518'">Nude CD-1</xsl:when>
                    <xsl:when test="./i6:value = '3571'">Osborne-Mendel</xsl:when>
                    <xsl:when test="./i6:value = '3490'">Peruvian</xsl:when>
                    <xsl:when test="./i6:value = '3491'">Pirbright-Hartley</xsl:when>
                    <xsl:when test="./i6:value = '3562'">Polish</xsl:when>
                    <xsl:when test="./i6:value = '108737'">Rainbow trout</xsl:when>
                    <xsl:when test="./i6:value = '3520'">SIV 50</xsl:when>
                    <xsl:when test="./i6:value = '3521'">SKH/HR1</xsl:when>
                    <xsl:when test="./i6:value = '3563'">San Juan</xsl:when>
                    <xsl:when test="./i6:value = '3519'">Sencar</xsl:when>
                    <xsl:when test="./i6:value = '3572'">Sherman</xsl:when>
                    <xsl:when test="./i6:value = '3492'">Shorthair</xsl:when>
                    <xsl:when test="./i6:value = '3573'">Sprague-Dawley</xsl:when>
                    <xsl:when test="./i6:value = '3522'">Strain A</xsl:when>
                    <xsl:when test="./i6:value = '3523'">Swiss</xsl:when>
                    <xsl:when test="./i6:value = '3524'">Swiss Webster</xsl:when>
                    <xsl:when test="./i6:value = '9007'">Tif:MAGf</xsl:when>
                    <xsl:when test="./i6:value = '3564'">Vienna White</xsl:when>
                    <xsl:when test="./i6:value = '3574'">Wistar</xsl:when>
                    <xsl:when test="./i6:value = '3575'">Wistar Kyoto (WKY)</xsl:when>
                    <xsl:when test="./i6:value = '3576'">Zucker</xsl:when>
                    <xsl:when test="./i6:value = '1904'">female</xsl:when>
                    <xsl:when test="./i6:value = '2051'">male</xsl:when>
                    <xsl:when test="./i6:value = '2052'">male/female</xsl:when>
                    <xsl:when test="./i6:value = '2231'">oral: gavage</xsl:when>
                    <xsl:when test="./i6:value = '2228'">oral: capsule</xsl:when>
                    <xsl:when test="./i6:value = '2230'">oral: feed</xsl:when>
                    <xsl:when test="./i6:value = '2229'">oral: drinking water</xsl:when>
                    <xsl:when test="./i6:value = '2234'">oral: unspecified</xsl:when>
                    <xsl:when test="./i6:value = '1992'">inhalation: aerosol</xsl:when>
                    <xsl:when test="./i6:value = '1993'">inhalation: dust</xsl:when>
                    <xsl:when test="./i6:value = '1994'">inhalation: gas</xsl:when>
                    <xsl:when test="./i6:value = '9155'">inhalation: mist</xsl:when>
                    <xsl:when test="./i6:value = '1995'">inhalation: vapour</xsl:when>
                    <xsl:when test="./i6:value = '61204'">inhalation: mixture of gas, vapour and aerosol</xsl:when>
                    <xsl:when test="./i6:value = '61205'">inhalation: mixture of vapour and aerosol / mist</xsl:when>
                    <xsl:when test="./i6:value = '61206'">inhalation: mixture of gas and vapour</xsl:when>
                    <xsl:when test="./i6:value = '1991'">inhalation</xsl:when>
                    <xsl:when test="./i6:value = '1842'">dermal</xsl:when>
                    <xsl:when test="./i6:value = '1983'">implantation</xsl:when>
                    <xsl:when test="./i6:value = '1990'">infusion</xsl:when>
                    <xsl:when test="./i6:value = '2010'">intramuscular</xsl:when>
                    <xsl:when test="./i6:value = '2011'">intraperitoneal</xsl:when>
                    <xsl:when test="./i6:value = '2012'">intratracheal</xsl:when>
                    <xsl:when test="./i6:value = '2013'">intravenous</xsl:when>
                    <xsl:when test="./i6:value = '2400'">subcutaneous</xsl:when>
                    <xsl:when test="./i6:value = '2276'">positive</xsl:when>
                    <xsl:when test="./i6:value = '1720'">ambiguous</xsl:when>
                    <xsl:when test="./i6:value = '2148'">negative</xsl:when>
                    <xsl:when test="./i6:value = '2196'">not determined</xsl:when>
                    <xsl:when test="./i6:value = '2170'">no effects</xsl:when>
                    <xsl:when test="./i6:value = '2197'">not examined</xsl:when>
                    <xsl:when test="./i6:value = '64853'">valid</xsl:when>
                    <xsl:when test="./i6:value = '64854'">not valid</xsl:when>
                    <xsl:when test="./i6:value = '60206'">not determinable</xsl:when>
                    <xsl:when test="./i6:value = '60207'">not determinable because of methodological limitations</xsl:when>
                    <xsl:when test="./i6:value = '60208'">not measured/tested</xsl:when>
                    <xsl:when test="./i6:value = '130898'">full study report</xsl:when>
                </xsl:choose>
                <xsl:value-of select="./i6:other "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:AttachedJustification | //xt:CrossReference | //xt:Guideline | //xt:DosesConcentrations | //xt:TestRs | //xt:AttachedBackgroundMaterial">
        <tr class="headerBlock">
            <td>
                <xsl:choose>
                    <xsl:when test="name(.) = 'DosesConcentrations'">Doses / concentrations</xsl:when>
                    <xsl:when test="name(.) = 'CrossReference'">Cross-reference</xsl:when>
                    <xsl:when test="name(.) = 'Guideline'">Test guideline</xsl:when>
                    <xsl:when test="name(.) = 'AttachedJustification'">Attached justification</xsl:when>
                    <xsl:when test="name(.) = 'AttachedBackgroundMaterial'">Attachments</xsl:when>
                    <xsl:when test="name(.) = 'TestRs'">Test results</xsl:when>
                </xsl:choose>
            </td>
            <td>
                <hr/>
            </td>
        </tr>
        <xsl:apply-templates select="./@*"/>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="//xt:AdministrativeData | //xt:DataSource | //xt:MaterialsAndMethods | //xt:TestMaterials | //xt:TestAnimals | //xt:AdministrationExposure | //xt:Examinations | //xt:AnyOtherInformationOnMaterialsAndMethodsInclTables | //xt:ResultsAndDiscussion | //xt:AnyOtherInformationOnResultsInclTables | //xt:OverallRemarksAttachments | //xt:ApplicantSummaryAndConclusion">
        <tr class="headerBlock">
            <td>
                <xsl:choose>
                    <xsl:when test="name(.) = 'OverallRemarksAttachments'">Overall remarks, attachments</xsl:when>
                    <xsl:when test="name(.) = 'AdministrativeData'">Administrative data</xsl:when>
                    <xsl:when test="name(.) = 'ApplicantSummaryAndConclusion'">Applicant's summary and conclusion</xsl:when>
                    <xsl:when test="name(.) = 'TestMaterials'">Test material</xsl:when>
                    <xsl:when test="name(.) = 'TestAnimals'">Test animals</xsl:when>
                    <xsl:when test="name(.) = 'AdministrationExposure'">Administration / exposure</xsl:when>
                    <xsl:when test="name(.) = 'AnyOtherInformationOnResultsInclTables'">Any other information on results incl. tables</xsl:when>
                    <xsl:when test="name(.) = 'MaterialsAndMethods'">Materials and methods</xsl:when>
                    <xsl:when test="name(.) = 'Examinations'">Examinations</xsl:when>
                    <xsl:when test="name(.) = 'DataSource'">Data source</xsl:when>
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
    <xsl:template match="//xt:NoOfAnimalsPerSexPerDose">
        <tr>
            <td class="label">No. of animals per sex per dose</td>
            <td class="value">
                <xsl:value-of select=". "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:StudyPeriod | //xt:JustificationForTypeOfInformation | //xt:Remarks | //xt:VersionRemarks | //xt:MethodNoGuideline | //xt:SpecificDetailsOnTestMaterialUsedForTheStudy | //xt:SpecificDetailsOnTestMaterialUsedForTheStudyConfidential | //xt:DetailsOnSpeciesStrainSelection | //xt:OrganismDetails | //xt:Vehicle | //xt:DetailsOnExposure | //xt:DurationOfTreatmentExposure | //xt:FrequencyOfTreatment | //xt:PostExposurePeriod | //xt:Remarks | //xt:PositiveControls | //xt:TissuesAndCellTypesExamined | //xt:DetailsOfTissueAndSlidePreparation | //xt:EvaluationCriteria | //xt:Statistics | //xt:OtherInformation | //xt:ResultsDetails | //xt:OtherInformation | //xt:RemarksOnResults | //xt:Remarks | //xt:Conclusions | //xt:ExecutiveSummary">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'PositiveControls'">Positive control(s)</xsl:when>
                    <xsl:when test="name(.) = 'DetailsOnSpeciesStrainSelection'">Details on species / strain selection</xsl:when>
                    <xsl:when test="name(.) = 'OrganismDetails'">Details on test animals or test system and environmental conditions</xsl:when>
                    <xsl:when test="name(.) = 'DetailsOnExposure'">Details on exposure</xsl:when>
                    <xsl:when test="name(.) = 'VersionRemarks'">Version / remarks</xsl:when>
                    <xsl:when test="name(.) = 'PostExposurePeriod'">Post exposure period</xsl:when>
                    <xsl:when test="name(.) = 'Conclusions'">Conclusions</xsl:when>
                    <xsl:when test="name(.) = 'StudyPeriod'">Study period</xsl:when>
                    <xsl:when test="name(.) = 'ResultsDetails'">Additional information on results</xsl:when>
                    <xsl:when test="name(.) = 'OtherInformation'"/>
                    <xsl:when test="name(.) = 'EvaluationCriteria'">Evaluation criteria</xsl:when>
                    <xsl:when test="name(.) = 'Statistics'">Statistics</xsl:when>
                    <xsl:when test="name(.) = 'MethodNoGuideline'">Principles of method if other than guideline</xsl:when>
                    <xsl:when test="name(.) = 'Vehicle'">Vehicle</xsl:when>
                    <xsl:when test="name(.) = 'FrequencyOfTreatment'">Frequency of treatment</xsl:when>
                    <xsl:when test="name(.) = 'TissuesAndCellTypesExamined'">Tissues and cell types examined</xsl:when>
                    <xsl:when test="name(.) = 'DurationOfTreatmentExposure'">Duration of treatment / exposure</xsl:when>
                    <xsl:when test="name(.) = 'Remarks'">Remarks</xsl:when>
                    <xsl:when test="name(.) = 'RemarksOnResults'">Overall remarks</xsl:when>
                    <xsl:when test="name(.) = 'ExecutiveSummary'">Executive summary</xsl:when>
                    <xsl:when test="name(.) = 'JustificationForTypeOfInformation'">Justification for type of information</xsl:when>
                    <xsl:when test="name(.) = 'SpecificDetailsOnTestMaterialUsedForTheStudy'">Specific details on test material used for the study</xsl:when>
                    <xsl:when test="name(.) = 'DetailsOfTissueAndSlidePreparation'">Details of tissue and slide preparation</xsl:when>
                    <xsl:when test="name(.) = 'SpecificDetailsOnTestMaterialUsedForTheStudyConfidential'">Specific details on test material used for the study (confidential)</xsl:when>
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
