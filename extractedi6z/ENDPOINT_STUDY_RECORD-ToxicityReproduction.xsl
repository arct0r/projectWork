<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:i6="http://iuclid6.echa.europa.eu/namespaces/platform-fields/v1" xmlns:i6c="http://iuclid6.echa.europa.eu/namespaces/platform-container/v1" xmlns:xt="http://iuclid6.echa.europa.eu/namespaces/ENDPOINT_STUDY_RECORD-ToxicityReproduction/7.0" version="1.0">
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
            <td>Toxicity to reproduction</td>
            <td>
                <hr/>
            </td>
        </tr>
        <xsl:apply-templates select="./@*"/>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="//xt:RobustStudy | //xt:UsedForClassification | //xt:UsedForMSDS | //xt:KeyResult | //xt:KeyResult | //xt:KeyResult | //xt:KeyResult | //xt:KeyResult | //xt:KeyResult | //xt:KeyResult | //xt:KeyResult | //xt:KeyResult">
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
    <xsl:template match="//xt:GeometricStandardDeviation">
        <tr>
            <td class="label">Geometric standard deviation (GSD)</td>
            <td class="value">
                <xsl:value-of select=". "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:DoseConc | //xt:LowestEffectiveDoseConc | //xt:LowestEffectiveDoseConc | //xt:LowestEffectiveDoseConc | //xt:LowestEffectiveDoseConc | //xt:LowestEffectiveDoseConc">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'LowestEffectiveDoseConc'">Lowest effective dose / conc.</xsl:when>
                    <xsl:when test="name(.) = 'DoseConc'">Dose / conc.</xsl:when>
                </xsl:choose>
            </td>
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
    <xsl:template match="//xt:MassMedianAerodynamicDiameter | //xt:EffectLevel | //xt:EffectLevel | //xt:EffectLevel | //xt:EffectLevel">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'MassMedianAerodynamicDiameter'">Mass median aerodynamic diameter (MMAD)</xsl:when>
                    <xsl:when test="name(.) = 'EffectLevel'">Effect level</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:value-of select="./i6:lowerQualifier "/>
                <xsl:value-of select="./i6:lowerValue "/>
                <xsl:value-of select="./i6:upperQualifier "/>
                <xsl:value-of select="./i6:upperValue "/>
                <xsl:choose>
                    <xsl:when test="./i6:unitCode = '58237'"> nm</xsl:when>
                    <xsl:when test="./i6:unitCode = '2503'"> µm</xsl:when>
                    <xsl:when test="./i6:unitCode = '2120'"> mm</xsl:when>
                    <xsl:when test="./i6:unitCode = '1342'"> other:</xsl:when>
                    <xsl:when test="./i6:unitCode = '2087'"> mg/kg bw/day (nominal)</xsl:when>
                    <xsl:when test="./i6:unitCode = '2086'"> mg/kg bw/day (actual dose received)</xsl:when>
                    <xsl:when test="./i6:unitCode = '2085'"> mg/kg bw/day</xsl:when>
                    <xsl:when test="./i6:unitCode = '2090'"> mg/kg diet</xsl:when>
                    <xsl:when test="./i6:unitCode = '2102'"> mg/L drinking water</xsl:when>
                    <xsl:when test="./i6:unitCode = '2082'"> mg/kg bw (total dose)</xsl:when>
                    <xsl:when test="./i6:unitCode = '2099'"> mg/L air</xsl:when>
                    <xsl:when test="./i6:unitCode = '2101'"> mg/L air (nominal)</xsl:when>
                    <xsl:when test="./i6:unitCode = '2100'"> mg/L air (analytical)</xsl:when>
                    <xsl:when test="./i6:unitCode = '2104'"> mg/m³ air</xsl:when>
                    <xsl:when test="./i6:unitCode = '2106'"> mg/m³ air (nominal)</xsl:when>
                    <xsl:when test="./i6:unitCode = '2105'"> mg/m³ air (analytical)</xsl:when>
                    <xsl:when test="./i6:unitCode = '2283'"> ppm</xsl:when>
                    <xsl:when test="./i6:unitCode = '2285'"> ppm (nominal)</xsl:when>
                    <xsl:when test="./i6:unitCode = '2284'"> ppm (analytical)</xsl:when>
                    <xsl:when test="./i6:unitCode = '116647'"> CFU/kg bw/day (actual dose received)</xsl:when>
                    <xsl:when test="./i6:unitCode = '116646'"> CFU/kg bw/day (nominal)</xsl:when>
                    <xsl:when test="./i6:unitCode = '116664'"> CFU/kg bw/day</xsl:when>
                    <xsl:when test="./i6:unitCode = '116574'"> CFU/kg diet</xsl:when>
                    <xsl:when test="./i6:unitCode = '116648'"> CFU/L drinking water</xsl:when>
                    <xsl:when test="./i6:unitCode = '116649'"> CFU/kg bw (total dose)</xsl:when>
                    <xsl:when test="./i6:unitCode = '116619'"> CFU/L air</xsl:when>
                    <xsl:when test="./i6:unitCode = '116607'"> CFU/m³ air</xsl:when>
                    <xsl:when test="./i6:unitCode = '116656'"> IU/kg bw/day (actual dose received)</xsl:when>
                    <xsl:when test="./i6:unitCode = '116655'"> IU/kg bw/day (nominal)</xsl:when>
                    <xsl:when test="./i6:unitCode = '129818'"> IU//kg bw/day</xsl:when>
                    <xsl:when test="./i6:unitCode = '116587'"> IU/kg diet</xsl:when>
                    <xsl:when test="./i6:unitCode = '116657'"> IU/L drinking water</xsl:when>
                    <xsl:when test="./i6:unitCode = '116658'"> IU/kg bw (total dose)</xsl:when>
                    <xsl:when test="./i6:unitCode = '116625'"> IU/L air</xsl:when>
                    <xsl:when test="./i6:unitCode = '116613'"> IU/m³ air</xsl:when>
                    <xsl:when test="./i6:unitCode = '116643'"> OB/kg bw/day (actual dose received)</xsl:when>
                    <xsl:when test="./i6:unitCode = '116642'"> OB/kg bw/day (nominal)</xsl:when>
                    <xsl:when test="./i6:unitCode = '116662'"> OB/kg bw/day</xsl:when>
                    <xsl:when test="./i6:unitCode = '116567'"> OB/kg diet</xsl:when>
                    <xsl:when test="./i6:unitCode = '116644'"> OB/L drinking water</xsl:when>
                    <xsl:when test="./i6:unitCode = '116645'"> OB/kg bw (total dose)</xsl:when>
                    <xsl:when test="./i6:unitCode = '116622'"> OB/L air</xsl:when>
                    <xsl:when test="./i6:unitCode = '116610'"> OB/m³ air</xsl:when>
                    <xsl:when test="./i6:unitCode = '129819'"> spores/kg bw/day (actual dose received)</xsl:when>
                    <xsl:when test="./i6:unitCode = '116667'"> spores/kg bw/day (nominal)</xsl:when>
                    <xsl:when test="./i6:unitCode = '116659'"> spores/kg bw/day</xsl:when>
                    <xsl:when test="./i6:unitCode = '116580'"> spores/kg diet</xsl:when>
                    <xsl:when test="./i6:unitCode = '129820'"> spores/L drinking water</xsl:when>
                    <xsl:when test="./i6:unitCode = '129821'"> spores/kg bw (total dose)</xsl:when>
                    <xsl:when test="./i6:unitCode = '129822'"> spores/L air</xsl:when>
                    <xsl:when test="./i6:unitCode = '116616'"> spores/m³ air</xsl:when>
                </xsl:choose>
                <xsl:value-of select="./i6:unitOther "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:DataWaivingJustification | //xt:ControlAnimals | //xt:Basis | //xt:Organ | //xt:Basis | //xt:Organ | //xt:Basis | //xt:Organ | //xt:Basis | //xt:Organ">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'Basis'">Basis for effect level</xsl:when>
                    <xsl:when test="name(.) = 'DataWaivingJustification'">Justification for data waiving</xsl:when>
                    <xsl:when test="name(.) = 'ControlAnimals'">Control animals</xsl:when>
                    <xsl:when test="name(.) = 'Organ'">Organ</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:choose>
                    <xsl:when test="./i6:value = '61414'">a screening study for reproductive/developmental toxicity does not need to be conducted because there is evidence from available information on structurally related substances, from (Q)SAR estimates or from in vitro methods that the substance may be a developmental toxicant</xsl:when>
                    <xsl:when test="./i6:value = '61307'">the study does not need to be conducted because an extended one-generation reproductive toxicity study is available</xsl:when>
                    <xsl:when test="./i6:value = '61308'">the study does not need to be conducted because a two- (or multi-) generation reproductive toxicity study is available</xsl:when>
                    <xsl:when test="./i6:value = '61309'">the study does not need to be conducted because a pre-natal developmental toxicity study is available</xsl:when>
                    <xsl:when test="./i6:value = '61310'">the study does not need to be conducted because the substance is known to be a genotoxic carcinogen and appropriate risk management measures are implemented</xsl:when>
                    <xsl:when test="./i6:value = '61311'">the study does not need to be conducted because the substance is known to be a germ cell mutagen and appropriate risk management measures are implemented</xsl:when>
                    <xsl:when test="./i6:value = '61312'">the study does not need to be conducted because relevant human exposure can be excluded as demonstrated in the relevant exposure assessment</xsl:when>
                    <xsl:when test="./i6:value = '61415'">the study does not need to be conducted because (i) the substance is of low toxicological activity (no evidence of toxicity seen in any of the tests available), (ii) it can be proven from toxicokinetic data that no systemic absorption occurs via relevant routes of exposure (e.g. plasma/blood concentrations below detection limit using a sensitive method and absence of the substance and of metabolites of the substance in urine, bile or exhaled air) and (iii) there is no or no significant human exposure</xsl:when>
                    <xsl:when test="./i6:value = '61416'">no further testing on fertility is necessary because the substance is known to have an adverse effect on fertility, meeting the criteria for classification as toxic for reproduction category 1A or 1B: May damage fertility (H360F), and the available data are adequate to support a robust risk assessment and classification and labelling</xsl:when>
                    <xsl:when test="./i6:value = '62412'">the extended one-generation reproductive toxicity study does not need to be conducted because there are no results from available repeated dose toxicity studies that indicate adverse effects on reproductive organs or tissues, or reveal other concerns in relation with reproductive toxicity</xsl:when>
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
                    <xsl:when test="./i6:value = '61318'">clinical signs</xsl:when>
                    <xsl:when test="./i6:value = '61323'">mortality</xsl:when>
                    <xsl:when test="./i6:value = '61656'">dermal irritation</xsl:when>
                    <xsl:when test="./i6:value = '61324'">body weight and weight gain</xsl:when>
                    <xsl:when test="./i6:value = '61325'">food consumption and compound intake</xsl:when>
                    <xsl:when test="./i6:value = '61326'">food efficiency</xsl:when>
                    <xsl:when test="./i6:value = '61327'">water consumption and compound intake</xsl:when>
                    <xsl:when test="./i6:value = '61328'">ophthalmological examination</xsl:when>
                    <xsl:when test="./i6:value = '61329'">haematology</xsl:when>
                    <xsl:when test="./i6:value = '61330'">clinical biochemistry</xsl:when>
                    <xsl:when test="./i6:value = '61331'">urinalysis</xsl:when>
                    <xsl:when test="./i6:value = '61332'">organ weights and organ / body weight ratios</xsl:when>
                    <xsl:when test="./i6:value = '61333'">gross pathology</xsl:when>
                    <xsl:when test="./i6:value = '61334'">neuropathology</xsl:when>
                    <xsl:when test="./i6:value = '61335'">histopathology: non-neoplastic</xsl:when>
                    <xsl:when test="./i6:value = '61336'">histopathology: neoplastic</xsl:when>
                    <xsl:when test="./i6:value = '61337'">reproductive function (oestrous cycle)</xsl:when>
                    <xsl:when test="./i6:value = '61338'">reproductive function (sperm measures)</xsl:when>
                    <xsl:when test="./i6:value = '61339'">reproductive performance</xsl:when>
                    <xsl:when test="./i6:value = '61078'">abdominal cavity</xsl:when>
                    <xsl:when test="./i6:value = '61132'">adrenal glands</xsl:when>
                    <xsl:when test="./i6:value = '61142'">alveolar duct</xsl:when>
                    <xsl:when test="./i6:value = '61143'">alveoli</xsl:when>
                    <xsl:when test="./i6:value = '61154'">ampulla</xsl:when>
                    <xsl:when test="./i6:value = '61101'">aorta</xsl:when>
                    <xsl:when test="./i6:value = '61083'">appendix</xsl:when>
                    <xsl:when test="./i6:value = '61104'">artery</xsl:when>
                    <xsl:when test="./i6:value = '61095'">bile duct</xsl:when>
                    <xsl:when test="./i6:value = '61099'">bladder</xsl:when>
                    <xsl:when test="./i6:value = '61111'">blood</xsl:when>
                    <xsl:when test="./i6:value = '61103'">blood vessel</xsl:when>
                    <xsl:when test="./i6:value = '61120'">bone</xsl:when>
                    <xsl:when test="./i6:value = '61107'">bone marrow</xsl:when>
                    <xsl:when test="./i6:value = '61124'">brain</xsl:when>
                    <xsl:when test="./i6:value = '61144'">bronchi</xsl:when>
                    <xsl:when test="./i6:value = '61145'">bronchioles</xsl:when>
                    <xsl:when test="./i6:value = '61158'">bulbourethral gland</xsl:when>
                    <xsl:when test="./i6:value = '61164'">caput</xsl:when>
                    <xsl:when test="./i6:value = '61106'">carotid artery</xsl:when>
                    <xsl:when test="./i6:value = '61121'">cartilage</xsl:when>
                    <xsl:when test="./i6:value = '61163'">cauda epididymis</xsl:when>
                    <xsl:when test="./i6:value = '61171'">cervix</xsl:when>
                    <xsl:when test="./i6:value = '61180'">choroid</xsl:when>
                    <xsl:when test="./i6:value = '61179'">ciliary body</xsl:when>
                    <xsl:when test="./i6:value = '61174'">clitoral gland</xsl:when>
                    <xsl:when test="./i6:value = '61153'">coagulating gland</xsl:when>
                    <xsl:when test="./i6:value = '61186'">cochlea</xsl:when>
                    <xsl:when test="./i6:value = '61090'">colon</xsl:when>
                    <xsl:when test="./i6:value = '61176'">cornea</xsl:when>
                    <xsl:when test="./i6:value = '61165'">corpus</xsl:when>
                    <xsl:when test="./i6:value = '61160'">corpus penis</xsl:when>
                    <xsl:when test="./i6:value = '64817'">Cowper’s glands</xsl:when>
                    <xsl:when test="./i6:value = '61141'">diaphragm</xsl:when>
                    <xsl:when test="./i6:value = '61156'">dorsolateral prostate gland</xsl:when>
                    <xsl:when test="./i6:value = '61087'">duodenum</xsl:when>
                    <xsl:when test="./i6:value = '61112'">erythrocyte development</xsl:when>
                    <xsl:when test="./i6:value = '61173'">fallopian tubes</xsl:when>
                    <xsl:when test="./i6:value = '61127'">forebrain</xsl:when>
                    <xsl:when test="./i6:value = '61094'">gall bladder</xsl:when>
                    <xsl:when test="./i6:value = '108697'">gametes</xsl:when>
                    <xsl:when test="./i6:value = '61151'">germ cells</xsl:when>
                    <xsl:when test="./i6:value = '61161'">glans penis</xsl:when>
                    <xsl:when test="./i6:value = '61166'">gonad</xsl:when>
                    <xsl:when test="./i6:value = '61074'">hard palate</xsl:when>
                    <xsl:when test="./i6:value = '61100'">heart</xsl:when>
                    <xsl:when test="./i6:value = '61125'">hindbrain</xsl:when>
                    <xsl:when test="./i6:value = '61088'">ileum</xsl:when>
                    <xsl:when test="./i6:value = '61085'">intestine</xsl:when>
                    <xsl:when test="./i6:value = '61178'">iris</xsl:when>
                    <xsl:when test="./i6:value = '61135'">islet of Langerhans</xsl:when>
                    <xsl:when test="./i6:value = '61089'">jejunum</xsl:when>
                    <xsl:when test="./i6:value = '61096'">kidney</xsl:when>
                    <xsl:when test="./i6:value = '61184'">lacrimal gland</xsl:when>
                    <xsl:when test="./i6:value = '61136'">larynx</xsl:when>
                    <xsl:when test="./i6:value = '61181'">lens</xsl:when>
                    <xsl:when test="./i6:value = '61113'">leucocyte development</xsl:when>
                    <xsl:when test="./i6:value = '64816'">Levatorani plus bulbocavernous muscle complex</xsl:when>
                    <xsl:when test="./i6:value = '61149'">Leydig cells</xsl:when>
                    <xsl:when test="./i6:value = '61093'">liver</xsl:when>
                    <xsl:when test="./i6:value = '61139'">lungs</xsl:when>
                    <xsl:when test="./i6:value = '61116'">lymph node</xsl:when>
                    <xsl:when test="./i6:value = '61110'">lymphoreticular tissue</xsl:when>
                    <xsl:when test="./i6:value = '61175'">mammary gland</xsl:when>
                    <xsl:when test="./i6:value = '61086'">mesenteric lymph node</xsl:when>
                    <xsl:when test="./i6:value = '61126'">midbrain</xsl:when>
                    <xsl:when test="./i6:value = '61117'">mucosa-associated lymphoid tissue</xsl:when>
                    <xsl:when test="./i6:value = '61119'">myofibres</xsl:when>
                    <xsl:when test="./i6:value = '61123'">myofilaments</xsl:when>
                    <xsl:when test="./i6:value = '61137'">nasal cavity</xsl:when>
                    <xsl:when test="./i6:value = '61129'">neurons</xsl:when>
                    <xsl:when test="./i6:value = '61188'">non-sensory epithelia</xsl:when>
                    <xsl:when test="./i6:value = '61080'">oesophagus</xsl:when>
                    <xsl:when test="./i6:value = '61071'">oral cavity</xsl:when>
                    <xsl:when test="./i6:value = '61167'">ovary</xsl:when>
                    <xsl:when test="./i6:value = '61168'">oviduct</xsl:when>
                    <xsl:when test="./i6:value = '61092'">pancreas</xsl:when>
                    <xsl:when test="./i6:value = '61134'">parathyroid gland</xsl:when>
                    <xsl:when test="./i6:value = '61075'">parotid gland</xsl:when>
                    <xsl:when test="./i6:value = '61157'">penile urethra</xsl:when>
                    <xsl:when test="./i6:value = '61084'">peritoneum</xsl:when>
                    <xsl:when test="./i6:value = '61081'">pharynx</xsl:when>
                    <xsl:when test="./i6:value = '61131'">pineal gland</xsl:when>
                    <xsl:when test="./i6:value = '61130'">pituitary gland</xsl:when>
                    <xsl:when test="./i6:value = '61170'">placenta</xsl:when>
                    <xsl:when test="./i6:value = '61114'">platelet formation</xsl:when>
                    <xsl:when test="./i6:value = '61146'">pleura</xsl:when>
                    <xsl:when test="./i6:value = '61162'">preputial gland</xsl:when>
                    <xsl:when test="./i6:value = '61091'">rectum</xsl:when>
                    <xsl:when test="./i6:value = '61183'">retina</xsl:when>
                    <xsl:when test="./i6:value = '61079'">salivary glands</xsl:when>
                    <xsl:when test="./i6:value = '61177'">sclera</xsl:when>
                    <xsl:when test="./i6:value = '61152'">seminal vesicle</xsl:when>
                    <xsl:when test="./i6:value = '61148'">seminiferous tubules</xsl:when>
                    <xsl:when test="./i6:value = '61150'">Sertoli cells</xsl:when>
                    <xsl:when test="./i6:value = '2369'">skin</xsl:when>
                    <xsl:when test="./i6:value = '61118'">skin associated lymphoid tissue</xsl:when>
                    <xsl:when test="./i6:value = '61128'">spinal cord</xsl:when>
                    <xsl:when test="./i6:value = '61109'">spleen</xsl:when>
                    <xsl:when test="./i6:value = '61108'">sternum</xsl:when>
                    <xsl:when test="./i6:value = '61082'">stomach</xsl:when>
                    <xsl:when test="./i6:value = '61076'">sublingual gland</xsl:when>
                    <xsl:when test="./i6:value = '61077'">submandibular gland</xsl:when>
                    <xsl:when test="./i6:value = '61122'">tendon</xsl:when>
                    <xsl:when test="./i6:value = '61147'">testes</xsl:when>
                    <xsl:when test="./i6:value = '61140'">thoracic cavity</xsl:when>
                    <xsl:when test="./i6:value = '61115'">thymus</xsl:when>
                    <xsl:when test="./i6:value = '61133'">thyroid gland</xsl:when>
                    <xsl:when test="./i6:value = '61072'">tongue</xsl:when>
                    <xsl:when test="./i6:value = '61073'">tooth</xsl:when>
                    <xsl:when test="./i6:value = '61138'">trachea</xsl:when>
                    <xsl:when test="./i6:value = '61097'">ureter</xsl:when>
                    <xsl:when test="./i6:value = '61098'">urethra</xsl:when>
                    <xsl:when test="./i6:value = '61169'">uterus</xsl:when>
                    <xsl:when test="./i6:value = '61172'">vagina</xsl:when>
                    <xsl:when test="./i6:value = '61159'">vas deferens</xsl:when>
                    <xsl:when test="./i6:value = '61102'">vascular system</xsl:when>
                    <xsl:when test="./i6:value = '61105'">vein</xsl:when>
                    <xsl:when test="./i6:value = '61155'">ventral prostate gland</xsl:when>
                    <xsl:when test="./i6:value = '61185'">vestibular system</xsl:when>
                    <xsl:when test="./i6:value = '61182'">vitreous humour</xsl:when>
                    <xsl:when test="./i6:value = '61187'">zymbal gland</xsl:when>
                    <xsl:when test="./i6:value = '61345'">viability</xsl:when>
                    <xsl:when test="./i6:value = '61346'">sexual maturation</xsl:when>
                    <xsl:when test="./i6:value = '61011'">clinical signs</xsl:when>
                    <xsl:when test="./i6:value = '2135'">mortality</xsl:when>
                    <xsl:when test="./i6:value = '61658'">dermal irritation</xsl:when>
                    <xsl:when test="./i6:value = '61012'">body weight and weight gain</xsl:when>
                    <xsl:when test="./i6:value = '61013'">food consumption and compound intake</xsl:when>
                    <xsl:when test="./i6:value = '61014'">food efficiency</xsl:when>
                    <xsl:when test="./i6:value = '61015'">water consumption and compound intake</xsl:when>
                    <xsl:when test="./i6:value = '61016'">ophthalmological examination</xsl:when>
                    <xsl:when test="./i6:value = '61017'">haematology</xsl:when>
                    <xsl:when test="./i6:value = '61018'">clinical biochemistry</xsl:when>
                    <xsl:when test="./i6:value = '61019'">urinalysis</xsl:when>
                    <xsl:when test="./i6:value = '61022'">organ weights and organ / body weight ratios</xsl:when>
                    <xsl:when test="./i6:value = '61023'">gross pathology</xsl:when>
                    <xsl:when test="./i6:value = '61024'">neuropathology</xsl:when>
                    <xsl:when test="./i6:value = '61025'">histopathology: non-neoplastic</xsl:when>
                    <xsl:when test="./i6:value = '61026'">histopathology: neoplastic</xsl:when>
                    <xsl:when test="./i6:value = '61347'">developmental neurotoxicity</xsl:when>
                    <xsl:when test="./i6:value = '61348'">developmental immunotoxicity</xsl:when>
                </xsl:choose>
                <xsl:value-of select="./i6:other "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:Endpoint | //xt:StudyResultType | //xt:PurposeFlag | //xt:Reliability | //xt:RationalReliability | //xt:DataWaiving | //xt:ReasonPurpose | //xt:ReasonPurpose | //xt:DataAccess | //xt:DataProtectionClaimed | //xt:Qualifier | //xt:Guideline | //xt:Deviation | //xt:GLPComplianceStatement | //xt:LimitTest | //xt:Species | //xt:Strain | //xt:Sex | //xt:RouteOfAdministration | //xt:TypeOfInhalationExposureIfApplicable | //xt:Vehicle | //xt:AnalyticalVerificationOfDosesOrConcentrations | //xt:ObservClinSigns | //xt:ObservDermalIrritationIfDermalStudy | //xt:ObservMortality | //xt:ObservBodyweight | //xt:ObservFoodConsum | //xt:ObservFoodEfficiency | //xt:ObservWaterConsum | //xt:ObservOphthalm | //xt:ObservHaematol | //xt:ObservClinChem | //xt:EndocrineFindings | //xt:ObservUrin | //xt:ObservNeurobehaviour | //xt:ImmunologicalFindings | //xt:ObservOrganWeights | //xt:ObservGrpathol | //xt:ObservNeuropathol | //xt:ObservHistopathol | //xt:ObservHistopatholNeoplastic | //xt:OtherEffects | //xt:ObservEstrousParent | //xt:ObservSpermParent | //xt:ObservReproPerformParent | //xt:Endpoint | //xt:BasedOn | //xt:Sex | //xt:RemarksOnResults | //xt:CriticalEffectsObserved | //xt:System | //xt:TreatmentRelated | //xt:DoseResponseRelationship | //xt:RelevantForHumans | //xt:ObservClinSigns | //xt:ObservDermalIrritationIfDermalStudy | //xt:ObservMortality | //xt:ObservBodyweight | //xt:ObservFoodConsum | //xt:ObservFoodEfficiency | //xt:ObservWaterConsum | //xt:ObservOphthalm | //xt:ObservHaematol | //xt:ObservClinChem | //xt:EndocrineFindings | //xt:ObservUrin | //xt:ObservNeurobehaviour | //xt:ImmunologicalFindings | //xt:ObservOrganWeights | //xt:ObservGrpathol | //xt:ObservNeuropathol | //xt:ObservHistopathol | //xt:ObservHistopatholNeoplastic | //xt:OtherEffects | //xt:ReproductiveFunctionEstrousCycle | //xt:ReproductiveFunctionSpermMeasures | //xt:ReproductivePerformance | //xt:Endpoint | //xt:BasedOn | //xt:Sex | //xt:RemarksOnResults | //xt:CriticalEffectsObserved | //xt:System | //xt:TreatmentRelated | //xt:DoseResponseRelationship | //xt:RelevantForHumans | //xt:ObservClinOffspring | //xt:DermalIrritationOffspringIfDermalStudy | //xt:ObservViabilityOffspring | //xt:ObservBodyweightOffspring | //xt:ObservFoodConsumOffspring | //xt:ObservFoodEfficiencyOffspring | //xt:ObservWaterConsumOffspring | //xt:ObservOphthalmOffspring | //xt:ObservHaematolOffspring | //xt:ObservClinChemOffspring | //xt:ObservUrinOffspring | //xt:ObservMaturationOffspring | //xt:AnogenitalDistance | //xt:NippleRetentionInMalePups | //xt:ObservOrganWeightsOffspring | //xt:ObservGrpatholOffspring | //xt:ObservHistopatholOffspring | //xt:OtherEffectsOffspring | //xt:BehaviourFunctionalFindings | //xt:DevelopmentalImmunotoxicity | //xt:Endpoint | //xt:Generation | //xt:BasedOn | //xt:Sex | //xt:RemarksOnResults | //xt:CriticalEffectsObserved | //xt:System | //xt:TreatmentRelated | //xt:DoseResponseRelationship | //xt:RelevantForHumans | //xt:ObservClinOffspring | //xt:DermalIrritationOffspringIfDermalStudy | //xt:ObservViabilityOffspring | //xt:ObservBodyweightOffspring | //xt:ObservFoodConsumOffspring | //xt:ObservFoodEfficiencyOffspring | //xt:ObservWaterConsumOffspring | //xt:ObservOphthalmOffspring | //xt:ObservHaematolOffspring | //xt:ObservClinChemOffspring | //xt:ObservUrinOffspring | //xt:ObservMaturationOffspring | //xt:AnogenitalDistance | //xt:NippleRetentionInMalePups | //xt:ObservOrganWeightsOffspring | //xt:ObservGrpatholOffspring | //xt:ObservHistopatholOffspring | //xt:OtherEffectsOffspring | //xt:BehaviourFunctionalFindings | //xt:DevelopmentalImmunotoxicity | //xt:Endpoint | //xt:Generation | //xt:BasedOn | //xt:Sex | //xt:RemarksOnResults | //xt:CriticalEffectsObserved | //xt:System | //xt:TreatmentRelated | //xt:DoseResponseRelationship | //xt:RelevantForHumans | //xt:ReproductiveEffectsObserved | //xt:TreatmentRelated | //xt:RelationToOtherToxicEffects | //xt:DoseResponseRelationship | //xt:RelevantForHumans | //xt:Type">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'ObservHistopathol'">Histopathological findings: non-neoplastic</xsl:when>
                    <xsl:when test="name(.) = 'OtherEffects'">Other effects</xsl:when>
                    <xsl:when test="name(.) = 'TreatmentRelated'">Treatment related</xsl:when>
                    <xsl:when test="name(.) = 'ObservOphthalmOffspring'">Ophthalmological findings</xsl:when>
                    <xsl:when test="name(.) = 'ObservOrganWeightsOffspring'">Organ weight findings including organ / body weight ratios</xsl:when>
                    <xsl:when test="name(.) = 'ObservBodyweight'">Body weight and weight changes</xsl:when>
                    <xsl:when test="name(.) = 'ObservUrinOffspring'">Urinalysis findings</xsl:when>
                    <xsl:when test="name(.) = 'DataAccess'">Data access</xsl:when>
                    <xsl:when test="name(.) = 'Vehicle'">Vehicle</xsl:when>
                    <xsl:when test="name(.) = 'ObservClinSigns'">Clinical signs</xsl:when>
                    <xsl:when test="name(.) = 'ObservGrpathol'">Gross pathological findings</xsl:when>
                    <xsl:when test="name(.) = 'DermalIrritationOffspringIfDermalStudy'">Dermal irritation (if dermal study)</xsl:when>
                    <xsl:when test="name(.) = 'ObservOrganWeights'">Organ weight findings including organ / body weight ratios</xsl:when>
                    <xsl:when test="name(.) = 'Endpoint'">Dose descriptor</xsl:when>
                    <xsl:when test="name(.) = 'RemarksOnResults'">Remarks on result</xsl:when>
                    <xsl:when test="name(.) = 'ObservNeurobehaviour'">Behaviour (functional findings)</xsl:when>
                    <xsl:when test="name(.) = 'ObservSpermParent'">Reproductive function: sperm measures</xsl:when>
                    <xsl:when test="name(.) = 'RationalReliability'">Rationale for reliability incl. deficiencies</xsl:when>
                    <xsl:when test="name(.) = 'CriticalEffectsObserved'">Critical effects observed</xsl:when>
                    <xsl:when test="name(.) = 'Qualifier'">Qualifier</xsl:when>
                    <xsl:when test="name(.) = 'Species'">Species</xsl:when>
                    <xsl:when test="name(.) = 'ObservEstrousParent'">Reproductive function: oestrous cycle</xsl:when>
                    <xsl:when test="name(.) = 'ObservFoodConsum'">Food consumption and compound intake (if feeding study)</xsl:when>
                    <xsl:when test="name(.) = 'ReproductiveEffectsObserved'">Reproductive effects observed</xsl:when>
                    <xsl:when test="name(.) = 'ObservHaematol'">Haematological findings</xsl:when>
                    <xsl:when test="name(.) = 'ObservUrin'">Urinalysis findings</xsl:when>
                    <xsl:when test="name(.) = 'ObservClinChemOffspring'">Clinical biochemistry findings</xsl:when>
                    <xsl:when test="name(.) = 'LimitTest'">Limit test</xsl:when>
                    <xsl:when test="name(.) = 'TypeOfInhalationExposureIfApplicable'">Type of inhalation exposure (if applicable)</xsl:when>
                    <xsl:when test="name(.) = 'ObservWaterConsum'">Water consumption and compound intake (if drinking water study)</xsl:when>
                    <xsl:when test="name(.) = 'ObservBodyweightOffspring'">Body weight and weight changes</xsl:when>
                    <xsl:when test="name(.) = 'OtherEffectsOffspring'">Other effects</xsl:when>
                    <xsl:when test="name(.) = 'ObservFoodEfficiencyOffspring'">Food efficiency</xsl:when>
                    <xsl:when test="name(.) = 'ReasonPurpose'">Reason / purpose for cross-reference</xsl:when>
                    <xsl:when test="name(.) = 'GLPComplianceStatement'">GLP compliance</xsl:when>
                    <xsl:when test="name(.) = 'Strain'">Strain</xsl:when>
                    <xsl:when test="name(.) = 'ObservClinChem'">Clinical biochemistry findings</xsl:when>
                    <xsl:when test="name(.) = 'ImmunologicalFindings'">Immunological findings</xsl:when>
                    <xsl:when test="name(.) = 'Generation'">Generation</xsl:when>
                    <xsl:when test="name(.) = 'ObservOphthalm'">Ophthalmological findings</xsl:when>
                    <xsl:when test="name(.) = 'ObservHaematolOffspring'">Haematological findings</xsl:when>
                    <xsl:when test="name(.) = 'BasedOn'">Based on</xsl:when>
                    <xsl:when test="name(.) = 'Deviation'">Deviations</xsl:when>
                    <xsl:when test="name(.) = 'NippleRetentionInMalePups'">Nipple retention in male pups</xsl:when>
                    <xsl:when test="name(.) = 'StudyResultType'">Type of information</xsl:when>
                    <xsl:when test="name(.) = 'DoseResponseRelationship'">Dose response relationship</xsl:when>
                    <xsl:when test="name(.) = 'ObservReproPerformParent'">Reproductive performance</xsl:when>
                    <xsl:when test="name(.) = 'BehaviourFunctionalFindings'">Behaviour (functional findings)</xsl:when>
                    <xsl:when test="name(.) = 'ObservDermalIrritationIfDermalStudy'">Dermal irritation (if dermal study)</xsl:when>
                    <xsl:when test="name(.) = 'EndocrineFindings'">Endocrine findings</xsl:when>
                    <xsl:when test="name(.) = 'Sex'">Sex</xsl:when>
                    <xsl:when test="name(.) = 'ObservFoodConsumOffspring'">Food consumption and compound intake (if feeding study)</xsl:when>
                    <xsl:when test="name(.) = 'DataWaiving'">Data waiving</xsl:when>
                    <xsl:when test="name(.) = 'ObservMortality'">Mortality</xsl:when>
                    <xsl:when test="name(.) = 'PurposeFlag'">Adequacy of study</xsl:when>
                    <xsl:when test="name(.) = 'System'">System</xsl:when>
                    <xsl:when test="name(.) = 'ReproductiveFunctionSpermMeasures'">Reproductive function: sperm measures</xsl:when>
                    <xsl:when test="name(.) = 'ObservNeuropathol'">Neuropathological findings</xsl:when>
                    <xsl:when test="name(.) = 'ReproductiveFunctionEstrousCycle'">Reproductive function: oestrous cycle</xsl:when>
                    <xsl:when test="name(.) = 'DevelopmentalImmunotoxicity'">Developmental immunotoxicity</xsl:when>
                    <xsl:when test="name(.) = 'ObservHistopatholNeoplastic'">Histopathological findings: neoplastic</xsl:when>
                    <xsl:when test="name(.) = 'DataProtectionClaimed'">Data protection claimed</xsl:when>
                    <xsl:when test="name(.) = 'AnalyticalVerificationOfDosesOrConcentrations'">Analytical verification of doses or concentrations</xsl:when>
                    <xsl:when test="name(.) = 'ObservViabilityOffspring'">Mortality / viability</xsl:when>
                    <xsl:when test="name(.) = 'AnogenitalDistance'">Anogenital distance (AGD)</xsl:when>
                    <xsl:when test="name(.) = 'ReproductivePerformance'">Reproductive performance</xsl:when>
                    <xsl:when test="name(.) = 'ObservGrpatholOffspring'">Gross pathological findings</xsl:when>
                    <xsl:when test="name(.) = 'Guideline'">Guideline</xsl:when>
                    <xsl:when test="name(.) = 'RouteOfAdministration'">Route of administration</xsl:when>
                    <xsl:when test="name(.) = 'ObservWaterConsumOffspring'">Water consumption and compound intake (if drinking water study)</xsl:when>
                    <xsl:when test="name(.) = 'ObservFoodEfficiency'">Food efficiency</xsl:when>
                    <xsl:when test="name(.) = 'ObservMaturationOffspring'">Sexual maturation</xsl:when>
                    <xsl:when test="name(.) = 'RelationToOtherToxicEffects'">Relation to other toxic effects</xsl:when>
                    <xsl:when test="name(.) = 'Type'">Type</xsl:when>
                    <xsl:when test="name(.) = 'RelevantForHumans'">Relevant for humans</xsl:when>
                    <xsl:when test="name(.) = 'ObservClinOffspring'">Clinical signs</xsl:when>
                    <xsl:when test="name(.) = 'ObservHistopatholOffspring'">Histopathological findings</xsl:when>
                    <xsl:when test="name(.) = 'Reliability'">Reliability</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:choose>
                    <xsl:when test="./i6:value = '61291'">screening for reproductive / developmental toxicity</xsl:when>
                    <xsl:when test="./i6:value = '61292'">extended one-generation reproductive toxicity - basic test design (Cohorts 1A, and 1B without extension)</xsl:when>
                    <xsl:when test="./i6:value = '61293'">extended one-generation reproductive toxicity - with developmental neurotoxicity (Cohorts 1A, 1B without extension, 2A and 2B)</xsl:when>
                    <xsl:when test="./i6:value = '61294'">extended one-generation reproductive toxicity - with developmental immunotoxicity (Cohorts 1A, 1B without extension, and 3)</xsl:when>
                    <xsl:when test="./i6:value = '61295'">extended one-generation reproductive toxicity - with both developmental neuro- and immunotoxicity (Cohorts 1A, 1B without extension, 2A, 2B, and 3)</xsl:when>
                    <xsl:when test="./i6:value = '61296'">extended one-generation reproductive toxicity - with F2 generation (Cohorts 1A, and 1B with extension)</xsl:when>
                    <xsl:when test="./i6:value = '61297'">extended one-generation reproductive toxicity - with F2 generation and developmental neurotoxicity (Cohorts 1A, 1B with extension, 2A and 2B)</xsl:when>
                    <xsl:when test="./i6:value = '61298'">extended one-generation reproductive toxicity – with F2 generation and developmental immunotoxicity (Cohorts 1A, 1B with extension, and 3)</xsl:when>
                    <xsl:when test="./i6:value = '61299'">extended one-generation reproductive toxicity – with F2 generation and both developmental neuro- and immunotoxicity (Cohorts 1A, 1B with extension, 2A, 2B, and 3)</xsl:when>
                    <xsl:when test="./i6:value = '61300'">one-generation reproductive toxicity</xsl:when>
                    <xsl:when test="./i6:value = '61301'">two-generation reproductive toxicity</xsl:when>
                    <xsl:when test="./i6:value = '61302'">three-generation reproductive toxicity</xsl:when>
                    <xsl:when test="./i6:value = '61303'">multi-generation reproductive toxicity</xsl:when>
                    <xsl:when test="./i6:value = '61304'">fertility, other</xsl:when>
                    <xsl:when test="./i6:value = '61348'">developmental immunotoxicity</xsl:when>
                    <xsl:when test="./i6:value = '61347'">developmental neurotoxicity</xsl:when>
                    <xsl:when test="./i6:value = '61305'">reproductive toxicity, other</xsl:when>
                    <xsl:when test="./i6:value = '61969'">toxicity to reproduction</xsl:when>
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
                    <xsl:when test="./i6:value = '421'">EPA OPP 83-4 (Reproduction and Fertility Effects)</xsl:when>
                    <xsl:when test="./i6:value = '423'">EPA OPP 83-6 (Developmental Neurotoxicity Study)</xsl:when>
                    <xsl:when test="./i6:value = '512'">EPA OPPTS 870.3500 (Preliminary Developmental Toxicity Screen)</xsl:when>
                    <xsl:when test="./i6:value = '515'">EPA OPPTS 870.3800 (Reproduction and Fertility Effects)</xsl:when>
                    <xsl:when test="./i6:value = '540'">EPA OPPTS 870.6300 (Developmental Neurotoxicity Study)</xsl:when>
                    <xsl:when test="./i6:value = '107872'">EPA OPPTS 885.3650 (Microbial Pesticide, Reproductive/Fertility Effects)</xsl:when>
                    <xsl:when test="./i6:value = '552'">EPA OTS 795.2500 (Developmental Neurotoxicity Screen)</xsl:when>
                    <xsl:when test="./i6:value = '609'">EPA OTS 798.4420 (Preliminary Developmental Toxicity Screen)</xsl:when>
                    <xsl:when test="./i6:value = '612'">EPA OTS 798.4700 (Reproduction and Fertility Effects)</xsl:when>
                    <xsl:when test="./i6:value = '691'">EU Method B.34 (One-Generation Reproduction Toxicity Test)</xsl:when>
                    <xsl:when test="./i6:value = '692'">EU Method B.35 (Two-Generation Reproduction Toxicity Test)</xsl:when>
                    <xsl:when test="./i6:value = '61431'">EU Method B.53 (Developmental Neurotoxicity Study)</xsl:when>
                    <xsl:when test="./i6:value = '61315'">EU Method B.56 (Extended One-Generation Reproductive Toxicity Study)</xsl:when>
                    <xsl:when test="./i6:value = '1310'">OECD Combined Repeated Dose and Reproductive / Developmental Toxicity Screening Test (Precursor Protocol of GL 422)</xsl:when>
                    <xsl:when test="./i6:value = '1263'">OECD Guideline 415 [One-Generation Reproduction Toxicity Study (before 9 October 2017)]</xsl:when>
                    <xsl:when test="./i6:value = '1264'">OECD Guideline 416 (Two-Generation Reproduction Toxicity Study)</xsl:when>
                    <xsl:when test="./i6:value = '1269'">OECD Guideline 421 (Reproduction / Developmental Toxicity Screening Test)</xsl:when>
                    <xsl:when test="./i6:value = '1270'">OECD Guideline 422 (Combined Repeated Dose Toxicity Study with the Reproduction / Developmental Toxicity Screening Test)</xsl:when>
                    <xsl:when test="./i6:value = '1274'">OECD Guideline 426 (Developmental Neurotoxicity Study)</xsl:when>
                    <xsl:when test="./i6:value = '61313'">OECD Guideline 443 (Extended One-Generation Reproductive Toxicity Study)</xsl:when>
                    <xsl:when test="./i6:value = '1312'">OECD Preliminary Reproduction Toxicity Screening Test (Precursor Protocol of GL 421)</xsl:when>
                    <xsl:when test="./i6:value = '2246'">other guideline:</xsl:when>
                    <xsl:when test="./i6:value = '2158'">no</xsl:when>
                    <xsl:when test="./i6:value = '4179'">yes (incl. QA statement)</xsl:when>
                    <xsl:when test="./i6:value = '2302'">rat</xsl:when>
                    <xsl:when test="./i6:value = '2301'">rabbit</xsl:when>
                    <xsl:when test="./i6:value = '1952'">guinea pig</xsl:when>
                    <xsl:when test="./i6:value = '2137'">mouse</xsl:when>
                    <xsl:when test="./i6:value = '1956'">hamster</xsl:when>
                    <xsl:when test="./i6:value = '1957'">hamster, Armenian</xsl:when>
                    <xsl:when test="./i6:value = '1958'">hamster, Chinese</xsl:when>
                    <xsl:when test="./i6:value = '1959'">hamster, Syrian</xsl:when>
                    <xsl:when test="./i6:value = '2270'">pig</xsl:when>
                    <xsl:when test="./i6:value = '2130'">monkey</xsl:when>
                    <xsl:when test="./i6:value = '3487'">Abyssinian</xsl:when>
                    <xsl:when test="./i6:value = '3501'">AKR</xsl:when>
                    <xsl:when test="./i6:value = '3552'">Angora</xsl:when>
                    <xsl:when test="./i6:value = '3503'">Balb/c</xsl:when>
                    <xsl:when test="./i6:value = '3553'">Belgian Hare</xsl:when>
                    <xsl:when test="./i6:value = '3565'">Brown Norway</xsl:when>
                    <xsl:when test="./i6:value = '3502'">B6C3F1</xsl:when>
                    <xsl:when test="./i6:value = '3506'">CAF1</xsl:when>
                    <xsl:when test="./i6:value = '3554'">Californian</xsl:when>
                    <xsl:when test="./i6:value = '3508'">CBA</xsl:when>
                    <xsl:when test="./i6:value = '3507'">CB6F1</xsl:when>
                    <xsl:when test="./i6:value = '3509'">CD-1</xsl:when>
                    <xsl:when test="./i6:value = '3510'">CF-1</xsl:when>
                    <xsl:when test="./i6:value = '3555'">Chinchilla</xsl:when>
                    <xsl:when test="./i6:value = '3566'">Crj: CD(SD)</xsl:when>
                    <xsl:when test="./i6:value = '3504'">C3H</xsl:when>
                    <xsl:when test="./i6:value = '3505'">C57BL</xsl:when>
                    <xsl:when test="./i6:value = '3511'">DBA</xsl:when>
                    <xsl:when test="./i6:value = '3512'">DBF1</xsl:when>
                    <xsl:when test="./i6:value = '3488'">Dunkin-Hartley</xsl:when>
                    <xsl:when test="./i6:value = '3556'">Dutch</xsl:when>
                    <xsl:when test="./i6:value = '3567'">Fischer 344</xsl:when>
                    <xsl:when test="./i6:value = '3568'">Fischer 344/DuCrj</xsl:when>
                    <xsl:when test="./i6:value = '3557'">Flemish Giant</xsl:when>
                    <xsl:when test="./i6:value = '3513'">FVB</xsl:when>
                    <xsl:when test="./i6:value = '3489'">Hartley</xsl:when>
                    <xsl:when test="./i6:value = '3558'">Himalayan</xsl:when>
                    <xsl:when test="./i6:value = '3514'">ICL-ICR</xsl:when>
                    <xsl:when test="./i6:value = '3515'">ICR</xsl:when>
                    <xsl:when test="./i6:value = '3569'">Lewis</xsl:when>
                    <xsl:when test="./i6:value = '3570'">Long-Evans</xsl:when>
                    <xsl:when test="./i6:value = '3498'">Macaca fascicularis</xsl:when>
                    <xsl:when test="./i6:value = '3499'">Marmoset</xsl:when>
                    <xsl:when test="./i6:value = '3500'">Mulatta arctoides</xsl:when>
                    <xsl:when test="./i6:value = '3559'">New Zealand Black</xsl:when>
                    <xsl:when test="./i6:value = '3560'">New Zealand Red</xsl:when>
                    <xsl:when test="./i6:value = '3561'">New Zealand White</xsl:when>
                    <xsl:when test="./i6:value = '3516'">NMRI</xsl:when>
                    <xsl:when test="./i6:value = '3517'">Nude Balb/cAnN</xsl:when>
                    <xsl:when test="./i6:value = '3518'">Nude CD-1</xsl:when>
                    <xsl:when test="./i6:value = '3571'">Osborne-Mendel</xsl:when>
                    <xsl:when test="./i6:value = '3490'">Peruvian</xsl:when>
                    <xsl:when test="./i6:value = '3491'">Pirbright-Hartley</xsl:when>
                    <xsl:when test="./i6:value = '3562'">Polish</xsl:when>
                    <xsl:when test="./i6:value = '3563'">San Juan</xsl:when>
                    <xsl:when test="./i6:value = '3519'">Sencar</xsl:when>
                    <xsl:when test="./i6:value = '3572'">Sherman</xsl:when>
                    <xsl:when test="./i6:value = '3492'">Shorthair</xsl:when>
                    <xsl:when test="./i6:value = '3520'">SIV 50</xsl:when>
                    <xsl:when test="./i6:value = '3521'">SKH/HR1</xsl:when>
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
                    <xsl:when test="./i6:value = '2191'">nose only</xsl:when>
                    <xsl:when test="./i6:value = '1961'">head only</xsl:when>
                    <xsl:when test="./i6:value = '65624'">snout only</xsl:when>
                    <xsl:when test="./i6:value = '2192'">nose/head only</xsl:when>
                    <xsl:when test="./i6:value = '2470'">whole body</xsl:when>
                    <xsl:when test="./i6:value = '2437'">unchanged (no vehicle)</xsl:when>
                    <xsl:when test="./i6:value = '1682'">acetone</xsl:when>
                    <xsl:when test="./i6:value = '1712'">air</xsl:when>
                    <xsl:when test="./i6:value = '1735'">arachis oil</xsl:when>
                    <xsl:when test="./i6:value = '1760'">beeswax</xsl:when>
                    <xsl:when test="./i6:value = '1782'">carbowaxe</xsl:when>
                    <xsl:when test="./i6:value = '1788'">castor oil</xsl:when>
                    <xsl:when test="./i6:value = '1792'">cetosteryl alcohol</xsl:when>
                    <xsl:when test="./i6:value = '1793'">cetyl alcohol</xsl:when>
                    <xsl:when test="./i6:value = '8130'">clean air</xsl:when>
                    <xsl:when test="./i6:value = '194'">CMC (carboxymethyl cellulose)</xsl:when>
                    <xsl:when test="./i6:value = '1804'">coconut oil</xsl:when>
                    <xsl:when test="./i6:value = '1817'">corn oil</xsl:when>
                    <xsl:when test="./i6:value = '1821'">cotton seed oil</xsl:when>
                    <xsl:when test="./i6:value = '316'">DMSO</xsl:when>
                    <xsl:when test="./i6:value = '1887'">ethanol</xsl:when>
                    <xsl:when test="./i6:value = '1944'">glycerol ester</xsl:when>
                    <xsl:when test="./i6:value = '1945'">glycolester</xsl:when>
                    <xsl:when test="./i6:value = '1980'">hydrogenated vegetable oil</xsl:when>
                    <xsl:when test="./i6:value = '2036'">lecithin</xsl:when>
                    <xsl:when test="./i6:value = '2049'">macrogel ester</xsl:when>
                    <xsl:when test="./i6:value = '2050'">maize oil</xsl:when>
                    <xsl:when test="./i6:value = '2221'">olive oil</xsl:when>
                    <xsl:when test="./i6:value = '8131'">oxygen</xsl:when>
                    <xsl:when test="./i6:value = '2253'">paraffin oil</xsl:when>
                    <xsl:when test="./i6:value = '2259'">peanut oil</xsl:when>
                    <xsl:when test="./i6:value = '2261'">petrolatum</xsl:when>
                    <xsl:when test="./i6:value = '2267'">physiological saline</xsl:when>
                    <xsl:when test="./i6:value = '2274'">poloxamer</xsl:when>
                    <xsl:when test="./i6:value = '2275'">polyethylene glycol</xsl:when>
                    <xsl:when test="./i6:value = '2296'">propylene glycol</xsl:when>
                    <xsl:when test="./i6:value = '2360'">silicone oil</xsl:when>
                    <xsl:when test="./i6:value = '2384'">sorbitan derivative</xsl:when>
                    <xsl:when test="./i6:value = '2385'">soya oil</xsl:when>
                    <xsl:when test="./i6:value = '2417'">theobroma oil</xsl:when>
                    <xsl:when test="./i6:value = '2447'">vegetable oil</xsl:when>
                    <xsl:when test="./i6:value = '1659'">water</xsl:when>
                    <xsl:when test="./i6:value = '61007'">effects observed, treatment-related</xsl:when>
                    <xsl:when test="./i6:value = '61008'">effects observed, non-treatment-related</xsl:when>
                    <xsl:when test="./i6:value = '61009'">no effects observed</xsl:when>
                    <xsl:when test="./i6:value = '2197'">not examined</xsl:when>
                    <xsl:when test="./i6:value = '2170'">no effects</xsl:when>
                    <xsl:when test="./i6:value = '61417'">mortality observed, treatment-related</xsl:when>
                    <xsl:when test="./i6:value = '61418'">mortality observed, non-treatment-related</xsl:when>
                    <xsl:when test="./i6:value = '61419'">no mortality observed</xsl:when>
                    <xsl:when test="./i6:value = '4147'">NOAEC</xsl:when>
                    <xsl:when test="./i6:value = '1109'">NOAEL</xsl:when>
                    <xsl:when test="./i6:value = '1129'">NOEC</xsl:when>
                    <xsl:when test="./i6:value = '1130'">NOEL</xsl:when>
                    <xsl:when test="./i6:value = '4148'">LOAEC</xsl:when>
                    <xsl:when test="./i6:value = '937'">LOAEL</xsl:when>
                    <xsl:when test="./i6:value = '957'">LOEC</xsl:when>
                    <xsl:when test="./i6:value = '958'">LOEL</xsl:when>
                    <xsl:when test="./i6:value = '5673'">BMD05</xsl:when>
                    <xsl:when test="./i6:value = '5672'">BMDL05</xsl:when>
                    <xsl:when test="./i6:value = '5674'">BMDL10</xsl:when>
                    <xsl:when test="./i6:value = '126'">BMD:</xsl:when>
                    <xsl:when test="./i6:value = '5760'">BMC05</xsl:when>
                    <xsl:when test="./i6:value = '5759'">BMCL05</xsl:when>
                    <xsl:when test="./i6:value = '5761'">BMCL10</xsl:when>
                    <xsl:when test="./i6:value = '122'">BMC:</xsl:when>
                    <xsl:when test="./i6:value = '345'">dose level:</xsl:when>
                    <xsl:when test="./i6:value = '271'">conc. level:</xsl:when>
                    <xsl:when test="./i6:value = '4146'">no NOAEC identified</xsl:when>
                    <xsl:when test="./i6:value = '4103'">no NOAEL identified</xsl:when>
                    <xsl:when test="./i6:value = '1758'">test mat.</xsl:when>
                    <xsl:when test="./i6:value = '60281'">test mat. (total fraction)</xsl:when>
                    <xsl:when test="./i6:value = '60282'">test mat. (dissolved fraction)</xsl:when>
                    <xsl:when test="./i6:value = '1754'">act. ingr.</xsl:when>
                    <xsl:when test="./i6:value = '60283'">act. ingr. (total fraction)</xsl:when>
                    <xsl:when test="./i6:value = '60284'">act. ingr. (dissolved fraction)</xsl:when>
                    <xsl:when test="./i6:value = '1756'">element</xsl:when>
                    <xsl:when test="./i6:value = '60285'">element (total fraction)</xsl:when>
                    <xsl:when test="./i6:value = '60286'">element (dissolved fraction)</xsl:when>
                    <xsl:when test="./i6:value = '1755'">dissolved</xsl:when>
                    <xsl:when test="./i6:value = '1757'">labile/free</xsl:when>
                    <xsl:when test="./i6:value = '61027'">not determinable due to absence of adverse toxic effects</xsl:when>
                    <xsl:when test="./i6:value = '61028'">not determinable due to adverse toxic effects at highest dose / concentration tested</xsl:when>
                    <xsl:when test="./i6:value = '60206'">not determinable</xsl:when>
                    <xsl:when test="./i6:value = '60207'">not determinable because of methodological limitations</xsl:when>
                    <xsl:when test="./i6:value = '60208'">not measured/tested</xsl:when>
                    <xsl:when test="./i6:value = '61041'">autonomic nervous system</xsl:when>
                    <xsl:when test="./i6:value = '61033'">cardiovascular</xsl:when>
                    <xsl:when test="./i6:value = '61038'">central nervous system</xsl:when>
                    <xsl:when test="./i6:value = '61048'">ear</xsl:when>
                    <xsl:when test="./i6:value = '61042'">endocrine system</xsl:when>
                    <xsl:when test="./i6:value = '61047'">eye</xsl:when>
                    <xsl:when test="./i6:value = '61046'">female reproductive system</xsl:when>
                    <xsl:when test="./i6:value = '61030'">gastrointestinal tract</xsl:when>
                    <xsl:when test="./i6:value = '61034'">haematopoietic</xsl:when>
                    <xsl:when test="./i6:value = '61031'">hepatobiliary</xsl:when>
                    <xsl:when test="./i6:value = '61035'">immune system</xsl:when>
                    <xsl:when test="./i6:value = '61029'">integumentary</xsl:when>
                    <xsl:when test="./i6:value = '61045'">male reproductive system</xsl:when>
                    <xsl:when test="./i6:value = '61036'">musculoskeletal system</xsl:when>
                    <xsl:when test="./i6:value = '61037'">nervous system</xsl:when>
                    <xsl:when test="./i6:value = '61039'">peripheral nervous system</xsl:when>
                    <xsl:when test="./i6:value = '61044'">respiratory system: lower respiratory tract</xsl:when>
                    <xsl:when test="./i6:value = '61043'">respiratory system: upper respiratory tract</xsl:when>
                    <xsl:when test="./i6:value = '61040'">somatic nervous system</xsl:when>
                    <xsl:when test="./i6:value = '61032'">urinary</xsl:when>
                    <xsl:when test="./i6:value = '107860'">presumably yes</xsl:when>
                    <xsl:when test="./i6:value = '4128'">F1</xsl:when>
                    <xsl:when test="./i6:value = '4129'">F1a</xsl:when>
                    <xsl:when test="./i6:value = '4130'">F1b</xsl:when>
                    <xsl:when test="./i6:value = '61360'">F1 (cohort 1A)</xsl:when>
                    <xsl:when test="./i6:value = '61361'">F1 (cohort 1B)</xsl:when>
                    <xsl:when test="./i6:value = '61362'">F1 (cohort 2A)</xsl:when>
                    <xsl:when test="./i6:value = '61363'">F1 (cohort 2B)</xsl:when>
                    <xsl:when test="./i6:value = '61364'">F1 (cohort 3)</xsl:when>
                    <xsl:when test="./i6:value = '4131'">F2</xsl:when>
                    <xsl:when test="./i6:value = '4132'">F2a</xsl:when>
                    <xsl:when test="./i6:value = '4133'">F2b</xsl:when>
                    <xsl:when test="./i6:value = '61420'">F2 (cohort 1B)</xsl:when>
                    <xsl:when test="./i6:value = '61357'">reproductive effects in the absence of other toxic effects</xsl:when>
                    <xsl:when test="./i6:value = '61358'">reproductive effects as a secondary non-specific consequence of other toxic effects</xsl:when>
                    <xsl:when test="./i6:value = '61359'">reproductive effects occurring together with other toxic effects, but not as a secondary non-specific consequence of other toxic effects</xsl:when>
                    <xsl:when test="./i6:value = '130898'">full study report</xsl:when>
                </xsl:choose>
                <xsl:value-of select="./i6:other "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:AttachedJustification | //xt:CrossReference | //xt:Guideline | //xt:DosesConcentrations | //xt:Efflevel | //xt:TargetSystemOrganToxicity | //xt:Efflevel | //xt:TargetSystemOrganToxicity | //xt:Efflevel | //xt:TargetSystemOrganToxicity | //xt:Efflevel | //xt:TargetSystemOrganToxicity | //xt:ReproductiveToxicity | //xt:AttachedBackgroundMaterial">
        <tr class="headerBlock">
            <td>
                <xsl:choose>
                    <xsl:when test="name(.) = 'Efflevel'"/>
                    <xsl:when test="name(.) = 'DosesConcentrations'">Doses / concentrations</xsl:when>
                    <xsl:when test="name(.) = 'CrossReference'">Cross-reference</xsl:when>
                    <xsl:when test="name(.) = 'Guideline'">Test guideline</xsl:when>
                    <xsl:when test="name(.) = 'AttachedJustification'">Attached justification</xsl:when>
                    <xsl:when test="name(.) = 'AttachedBackgroundMaterial'">Attachments</xsl:when>
                    <xsl:when test="name(.) = 'TargetSystemOrganToxicity'"/>
                    <xsl:when test="name(.) = 'ReproductiveToxicity'"/>
                </xsl:choose>
            </td>
            <td>
                <hr/>
            </td>
        </tr>
        <xsl:apply-templates select="./@*"/>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="//xt:AdministrativeData | //xt:DataSource | //xt:MaterialsAndMethods | //xt:TestMaterials | //xt:TestAnimals | //xt:AdministrationExposure | //xt:Examinations | //xt:AnyOtherInformationOnMaterialsAndMethodsInclTables | //xt:ResultsAndDiscussion | //xt:ResultsOfExaminationsParentalGeneration | //xt:GeneralToxicityP0 | //xt:ReproductiveFunctionPerformanceP0 | //xt:DetailsOnResultsP0 | //xt:EffectLevelsP0 | //xt:TargetSystemOrganToxicityP0 | //xt:ResultsP1SecondParentalGeneration | //xt:GeneralToxicityP1 | //xt:ReproductiveFunctionPerformanceP1 | //xt:DetailsOnResultsP1 | //xt:EffectLevelsP1 | //xt:TargetSystemOrganToxicityP1 | //xt:ResultsOfExaminationsOffspring | //xt:GeneralToxicityF1 | //xt:DevelopmentalNeurotoxicityF1 | //xt:DevelopmentalImmunotoxicityF1 | //xt:DetailsOnResultsF1 | //xt:EffectLevelsF1 | //xt:TargetSystemOrganToxicityF1 | //xt:ResultsF2Generation | //xt:GeneralToxicityF2 | //xt:DevelopmentalNeurotoxicityOfF1Generation | //xt:DevelopmentalImmunotoxicityOfF1Generation | //xt:DetailsOnResultsF2 | //xt:EffectLevelsF2 | //xt:TargetSystemOrganToxicityF2 | //xt:ReproductiveToxicity | //xt:AnyOtherInformationOnResultsInclTables | //xt:OverallRemarksAttachments | //xt:ApplicantSummaryAndConclusion">
        <tr class="headerBlock">
            <td>
                <xsl:choose>
                    <xsl:when test="name(.) = 'DevelopmentalNeurotoxicityF1'">Developmental neurotoxicity (F1)</xsl:when>
                    <xsl:when test="name(.) = 'DevelopmentalImmunotoxicityF1'">Developmental immunotoxicity (F1)</xsl:when>
                    <xsl:when test="name(.) = 'OverallRemarksAttachments'">Overall remarks, attachments</xsl:when>
                    <xsl:when test="name(.) = 'AdministrativeData'">Administrative data</xsl:when>
                    <xsl:when test="name(.) = 'TargetSystemOrganToxicityP1'">Target system / organ toxicity (P1)</xsl:when>
                    <xsl:when test="name(.) = 'TargetSystemOrganToxicityP0'">Target system / organ toxicity (P0)</xsl:when>
                    <xsl:when test="name(.) = 'TestAnimals'">Test animals</xsl:when>
                    <xsl:when test="name(.) = 'ResultsOfExaminationsParentalGeneration'">Results: P0 (first parental generation)</xsl:when>
                    <xsl:when test="name(.) = 'AnyOtherInformationOnResultsInclTables'">Any other information on results incl. tables</xsl:when>
                    <xsl:when test="name(.) = 'DevelopmentalImmunotoxicityOfF1Generation'">Developmental immunotoxicity (F2)</xsl:when>
                    <xsl:when test="name(.) = 'ReproductiveToxicity'">Overall reproductive toxicity</xsl:when>
                    <xsl:when test="name(.) = 'EffectLevelsP0'">Effect levels (P0)</xsl:when>
                    <xsl:when test="name(.) = 'EffectLevelsP1'">Effect levels (P1)</xsl:when>
                    <xsl:when test="name(.) = 'ApplicantSummaryAndConclusion'">Applicant's summary and conclusion</xsl:when>
                    <xsl:when test="name(.) = 'EffectLevelsF2'">Effect levels (F2)</xsl:when>
                    <xsl:when test="name(.) = 'DetailsOnResultsP0'">Details on results (P0)</xsl:when>
                    <xsl:when test="name(.) = 'TargetSystemOrganToxicityF2'">Target system / organ toxicity (F2)</xsl:when>
                    <xsl:when test="name(.) = 'DetailsOnResultsP1'">Details on results (P1)</xsl:when>
                    <xsl:when test="name(.) = 'GeneralToxicityP0'">General toxicity (P0)</xsl:when>
                    <xsl:when test="name(.) = 'TargetSystemOrganToxicityF1'">Target system / organ toxicity (F1)</xsl:when>
                    <xsl:when test="name(.) = 'AnyOtherInformationOnMaterialsAndMethodsInclTables'">Any other information on materials and methods incl. tables</xsl:when>
                    <xsl:when test="name(.) = 'ResultsAndDiscussion'">Results and discussion</xsl:when>
                    <xsl:when test="name(.) = 'EffectLevelsF1'">Effect levels (F1)</xsl:when>
                    <xsl:when test="name(.) = 'GeneralToxicityP1'">General toxicity (P1)</xsl:when>
                    <xsl:when test="name(.) = 'GeneralToxicityF2'">General toxicity (F2)</xsl:when>
                    <xsl:when test="name(.) = 'GeneralToxicityF1'">General toxicity (F1)</xsl:when>
                    <xsl:when test="name(.) = 'AdministrationExposure'">Administration / exposure</xsl:when>
                    <xsl:when test="name(.) = 'DetailsOnResultsF1'">Details on results (F1)</xsl:when>
                    <xsl:when test="name(.) = 'Examinations'">Examinations</xsl:when>
                    <xsl:when test="name(.) = 'DetailsOnResultsF2'">Details on results (F2)</xsl:when>
                    <xsl:when test="name(.) = 'DataSource'">Data source</xsl:when>
                    <xsl:when test="name(.) = 'ReproductiveFunctionPerformanceP1'">Reproductive function / performance (P1)</xsl:when>
                    <xsl:when test="name(.) = 'ReproductiveFunctionPerformanceP0'">Reproductive function / performance (P0)</xsl:when>
                    <xsl:when test="name(.) = 'ResultsF2Generation'">Results: F2 generation</xsl:when>
                    <xsl:when test="name(.) = 'ResultsP1SecondParentalGeneration'">Results: P1  (second parental generation)</xsl:when>
                    <xsl:when test="name(.) = 'TestMaterials'">Test material</xsl:when>
                    <xsl:when test="name(.) = 'ResultsOfExaminationsOffspring'">Results: F1 generation</xsl:when>
                    <xsl:when test="name(.) = 'MaterialsAndMethods'">Materials and methods</xsl:when>
                    <xsl:when test="name(.) = 'DevelopmentalNeurotoxicityOfF1Generation'">Developmental neurotoxicity (F2)</xsl:when>
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
    <xsl:template match="//xt:StudyPeriod | //xt:JustificationForTypeOfInformation | //xt:Remarks | //xt:VersionRemarks | //xt:MethodNoGuideline | //xt:JustificationForStudyDesign | //xt:SpecificDetailsOnTestMaterialUsedForTheStudy | //xt:SpecificDetailsOnTestMaterialUsedForTheStudyConfidential | //xt:DetailsOnSpeciesStrainSelection | //xt:OrganismDetails | //xt:RemarksOnMMAD | //xt:DetailsOnExposure | //xt:DetailsOnMatingProcedure | //xt:DetailsOnAnalyticalVerificationOfDosesOrConcentrations | //xt:DurationOfTreatmentExposure | //xt:FrequencyOfTreatment | //xt:DetailsOnStudySchedule | //xt:Remarks | //xt:DetailsOnStudyDesign | //xt:PositiveControl | //xt:ParentalAnimalsObservationsAndExaminations | //xt:EstrousCyclicityParentalAnimals | //xt:SpermParametersParentalAnimals | //xt:LitterObservations | //xt:PostmortemExaminationsParentalAnimals | //xt:PostmortemExaminationsOffspring | //xt:Statistics | //xt:ReproductiveIndices | //xt:OffspringViabilityIndices | //xt:OtherInformation | //xt:DescriptionIncidenceAndSeverityObservClinSigns | //xt:DescriptionIncidenceAndSeverityObservDermalIrritationIfDermalStudy | //xt:DescriptionIncidenceMortality | //xt:DescriptionIncidenceAndSeverityObservBodyweight | //xt:DescriptionIncidenceAndSeverityObservFoodConsum | //xt:DescriptionIncidenceAndSeverityObservFoodEfficiency | //xt:DescriptionIncidenceAndSeverityObservWaterConsum | //xt:DescriptionIncidenceAndSeverityObservOphthalm | //xt:DescriptionIncidenceAndSeverityObservHaematol | //xt:DescriptionIncidenceAndSeverityObservClinChem | //xt:DescriptionIncidenceAndSeverityEndocrine | //xt:DescriptionIncidenceAndSeverityObservUrin | //xt:DescriptionIncidenceAndSeverityObservNeurobehaviour | //xt:DescriptionIncidenceAndSeverityImmunologicalFindings | //xt:DescriptionIncidenceAndSeverityObservOrganWeights | //xt:DescriptionIncidenceAndSeverityObservGrpathol | //xt:DescriptionIncidenceAndSeverityObservNeuropathol | //xt:DescriptionIncidenceAndSeverityObservHistopathol | //xt:DescriptionIncidenceAndSeverityObservHistopatholNeoplastic | //xt:DescriptionIncidenceAndSeverityOtherEffects | //xt:DescriptionIncidenceAndSeverityObservEstrousParent | //xt:DescriptionIncidenceAndSeverityObservSpermParent | //xt:DescriptionIncidenceAndSeverityObservReproPerformParent | //xt:DetailsOnResults | //xt:DescriptionIncidenceAndSeverityObservClinSigns | //xt:DescriptionIncidenceAndSeverityObservDermalIrritationIfDermalStudy | //xt:DescriptionIncidenceMortality | //xt:DescriptionIncidenceAndSeverityObservBodyweight | //xt:DescriptionIncidenceAndSeverityObservFoodConsum | //xt:DescriptionIncidenceAndSeverityObservFoodEfficiency | //xt:DescriptionIncidenceAndSeverityObservWaterConsum | //xt:DescriptionIncidenceAndSeverityObservOphthalm | //xt:DescriptionIncidenceAndSeverityObservHaematol | //xt:DescriptionIncidenceAndSeverityObservClinChem | //xt:DescriptionIncidenceAndSeverityEndocrine | //xt:DescriptionIncidenceAndSeverityObservUrin | //xt:DescriptionIncidenceAndSeverityObservNeurobehaviour | //xt:DescriptionIncidenceAndSeverityImmunologicalFindings | //xt:DescriptionIncidenceAndSeverityObservOrganWeights | //xt:DescriptionIncidenceAndSeverityObservGrpathol | //xt:DescriptionIncidenceAndSeverityObservNeuropathol | //xt:DescriptionIncidenceAndSeverityObservHistopathol | //xt:DescriptionIncidenceAndSeverityObservHistopatholNeoplastic | //xt:DescriptionIncidenceAndSeverityOtherEffects | //xt:DetailsOnResults | //xt:DescriptionIncidenceAndSeverityReproductiveFunctionEstrousCycle | //xt:DescriptionIncidenceAndSeverityReproductiveFunctionSpermMeasures | //xt:DescriptionIncidenceAndSeverityReproductivePerformance | //xt:DetailsOnResults | //xt:DescriptionIncidenceAndSeverityObservClinOffspring | //xt:DescriptionIncidenceAndSeverityDermalIrritationOffspringIfDermalStudy | //xt:DescriptionIncidenceAndSeverityObservViabilityOffspring | //xt:DescriptionIncidenceAndSeverityObservBodyweightOffspring | //xt:DescriptionIncidenceAndSeverityObservFoodConsumOffspring | //xt:DescriptionIncidenceAndSeverityObservFoodEfficiencyOffspring | //xt:DescriptionIncidenceAndSeverityObservWaterConsumOffspring | //xt:DescriptionIncidenceAndSeverityObservOphthalmOffspring | //xt:DescriptionIncidenceAndSeverityObservHaematolOffspring | //xt:DescriptionIncidenceAndSeverityObservClinChemOffspring | //xt:DescriptionIncidenceAndSeverityObservUrinOffspring | //xt:DescriptionIncidenceAndSeverityObservMaturationOffspring | //xt:DescriptionIncidenceAndSeverityAnogenitalDistance | //xt:DescriptionIncidenceAndSeverityNippleRetentionInMalePups | //xt:DescriptionIncidenceAndSeverityObservOrganWeightsOffspring | //xt:DescriptionIncidenceAndSeverityObservGrpatholOffspring | //xt:DescriptionIncidenceAndSeverityObservHistopatholOffspring | //xt:DescriptionIncidenceAndSeverityOtherEffectsOffspring | //xt:DescriptionIncidenceAndSeverityBehaviourFunctionalFindings | //xt:DescriptionIncidenceAndSeverityDevelopmentalImmunotoxicity | //xt:DetailsOnResults | //xt:DescriptionIncidenceAndSeverityObservClinOffspring | //xt:DescriptionIncidenceAndSeverityDermalIrritationOffspringIfDermalStudy | //xt:DescriptionIncidenceAndSeverityObservViabilityOffspring | //xt:DescriptionIncidenceAndSeverityObservBodyweightOffspring | //xt:DescriptionIncidenceAndSeverityObservFoodConsumOffspring | //xt:DescriptionIncidenceAndSeverityObservFoodEfficiencyOffspring | //xt:DescriptionIncidenceAndSeverityObservWaterConsumOffspring | //xt:DescriptionIncidenceAndSeverityObservOphthalmOffspring | //xt:DescriptionIncidenceAndSeverityObservHaematolOffspring | //xt:DescriptionIncidenceAndSeverityObservClinChemOffspring | //xt:DescriptionIncidenceAndSeverityObservUrinOffspring | //xt:DescriptionIncidenceAndSeverityObservMaturationOffspring | //xt:DescriptionIncidenceAndSeverityAnogenitalDistance | //xt:DescriptionIncidenceAndSeverityNippleRetentionInMalePups | //xt:DescriptionIncidenceAndSeverityObservOrganWeightsOffspring | //xt:DescriptionIncidenceAndSeverityObservGrpatholOffspring | //xt:DescriptionIncidenceAndSeverityObservHistopatholOffspring | //xt:DescriptionIncidenceAndSeverityOtherEffectsOffspring | //xt:DescriptionIncidenceAndSeverityBehaviourFunctionalFindings | //xt:DescriptionIncidenceAndSeverityDevelopmentalImmunotoxicity | //xt:DetailsOnResults | //xt:OtherInformation | //xt:RemarksOnResults | //xt:Remarks | //xt:Conclusions | //xt:ExecutiveSummary">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityObservSpermParent'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'PositiveControl'">Positive control</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityObservFoodConsumOffspring'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityObservOrganWeightsOffspring'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'JustificationForStudyDesign'">Justification for study design</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityObservNeurobehaviour'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityImmunologicalFindings'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'LitterObservations'">Litter observations</xsl:when>
                    <xsl:when test="name(.) = 'StudyPeriod'">Study period</xsl:when>
                    <xsl:when test="name(.) = 'OtherInformation'"/>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityObservClinSigns'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityNippleRetentionInMalePups'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'RemarksOnMMAD'">Remarks on MMAD</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityObservDermalIrritationIfDermalStudy'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'PostmortemExaminationsParentalAnimals'">Postmortem examinations (parental animals)</xsl:when>
                    <xsl:when test="name(.) = 'Remarks'">Remarks</xsl:when>
                    <xsl:when test="name(.) = 'RemarksOnResults'">Overall remarks</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityObservHistopathol'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'ExecutiveSummary'">Executive summary</xsl:when>
                    <xsl:when test="name(.) = 'ReproductiveIndices'">Reproductive indices</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityObservOphthalm'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityOtherEffectsOffspring'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'SpermParametersParentalAnimals'">Sperm parameters (parental animals)</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityObservViabilityOffspring'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityObservNeuropathol'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityObservHaematolOffspring'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityDevelopmentalImmunotoxicity'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'OffspringViabilityIndices'">Offspring viability indices</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityObservMaturationOffspring'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityObservOphthalmOffspring'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityOtherEffects'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityObservWaterConsum'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'DurationOfTreatmentExposure'">Duration of treatment / exposure</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityObservFoodEfficiencyOffspring'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'JustificationForTypeOfInformation'">Justification for type of information</xsl:when>
                    <xsl:when test="name(.) = 'SpecificDetailsOnTestMaterialUsedForTheStudy'">Specific details on test material used for the study</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityObservHaematol'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'DetailsOnMatingProcedure'">Details on mating procedure</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityObservWaterConsumOffspring'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'DetailsOnSpeciesStrainSelection'">Details on species / strain selection</xsl:when>
                    <xsl:when test="name(.) = 'VersionRemarks'">Version / remarks</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityObservUrin'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityReproductiveFunctionEstrousCycle'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'DetailsOnStudyDesign'">Details on study design</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityObservGrpathol'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityEndocrine'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'DetailsOnStudySchedule'">Details on study schedule</xsl:when>
                    <xsl:when test="name(.) = 'ParentalAnimalsObservationsAndExaminations'">Parental animals: Observations and examinations</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityObservUrinOffspring'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'DetailsOnAnalyticalVerificationOfDosesOrConcentrations'">Details on analytical verification of doses or concentrations</xsl:when>
                    <xsl:when test="name(.) = 'FrequencyOfTreatment'">Frequency of treatment</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityObservClinOffspring'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityReproductivePerformance'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceMortality'">Description (incidence)</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityObservHistopatholNeoplastic'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityObservBodyweight'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'DetailsOnResults'"/>
                    <xsl:when test="name(.) = 'SpecificDetailsOnTestMaterialUsedForTheStudyConfidential'">Specific details on test material used for the study (confidential)</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityObservClinChem'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityObservFoodConsum'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityObservBodyweightOffspring'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityDermalIrritationOffspringIfDermalStudy'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'OrganismDetails'">Details on test animals or test system and environmental conditions</xsl:when>
                    <xsl:when test="name(.) = 'DetailsOnExposure'">Details on exposure</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityObservReproPerformParent'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityReproductiveFunctionSpermMeasures'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'EstrousCyclicityParentalAnimals'">Oestrous cyclicity (parental animals)</xsl:when>
                    <xsl:when test="name(.) = 'Conclusions'">Conclusions</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityObservFoodEfficiency'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'PostmortemExaminationsOffspring'">Postmortem examinations (offspring)</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityObservClinChemOffspring'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'Statistics'">Statistics</xsl:when>
                    <xsl:when test="name(.) = 'MethodNoGuideline'">Principles of method if other than guideline</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityObservEstrousParent'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityObservHistopatholOffspring'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityObservGrpatholOffspring'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityBehaviourFunctionalFindings'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityAnogenitalDistance'">Description (incidence and severity)</xsl:when>
                    <xsl:when test="name(.) = 'DescriptionIncidenceAndSeverityObservOrganWeights'">Description (incidence and severity)</xsl:when>
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
