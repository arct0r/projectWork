import streamlit as st
from bs4 import BeautifulSoup
import pandas as pd
import re

# Il problema dei riassunti tossicologici (e di questo progetto in generale) è che risulta inutile estrarre numeri a caso riguardanti il NOAEL
# senza avere tutto il contesto intorno. 
# Per questo motivo sto riscrivendo il codice: per ottenere il contesto dei valori.

# Ogni sezione contiene molteplici sottozioni ed ogni sottosezione contiene molteplici sotto-sottosezioni.
# Questo è il tree:

# 'Workers - Hazard via inhalation route' 
#  - 'Systemic effects'
#       -   'Long term exposure',
#       -   'DNEL related information', 
#       -   'Explanation for hazard conclusion',
#       -   'Acute/short term exposure' 
#  - 'Local Effects'
#       -   'Long term exposure',
#       -   'DNEL related information', 
#       -   'Explanation for hazard conclusion',
#       -   'Acute/short term exposure' 

# Questo per ogni sezione nella main sections. Quite the challenge. 

main_sections = [
    'Workers - Hazard via inhalation route',
    'Workers - Hazard via dermal route',
    'General Population - Hazard via inhalation route',
    'General Population - Hazard via dermal route',
    'General Population - Hazard via oral route',
]

subsection = [
    'Systemic effects',
    'Local Effects',
]

sub_subsection_names = {
    'Long term exposure':'das-block LongTermStudy',
    'DNEL related information' : 'das-block DNMELInfoWithRTR', 
    'Acute/short term exposure': 'das-block AcuteShortTermExposureStudy'                
}

main_sections_dict = {}
sections_and_subsections = {}

# Le classi sul sito echa hanno id di questo tipo: 'das-block GeneralPopulationHazardViaDermalRoute'. Quindi trasformo la mia summ per renderla come gli id.
id_sections = ['das-block '+section.replace(' ', '').replace('-', '') for section in main_sections]
id_sections

with open("testpagesummary3.html") as summary:
    summary = summary.read()
    soup = BeautifulSoup(summary)
    soup.prettify()
    article = soup.find(class_="das-document ENDPOINT_SUMMARY DataTox")

with st.expander('Article'):
    article
    
i = 0
for id in id_sections:
    main_sections_dict[main_sections[i]] = article.find(class_=re.compile(id, re.I))
    i+=1

with st.expander('Sections'):
    main_sections_dict
# Ora ho le sezioni con il loro ID.
# Ora devo dividere le sezioni nelle loro sottosezioni. Local e Systemic effects.

tree = {}

with st.expander('Local and Systemic effects'):
    for section in main_sections_dict:
        tree[section] = {'Systemic Effects':None}
        tree[section] = {'Local Effects':None}
        # Creo il tree

        systemic_effects = main_sections_dict[section].find(class_='das-block SystemicEffects')
        local_effects = main_sections_dict[section].find(class_='das-block LocalEffects')
        # Trovo gli effetti sistemici e locali per ogni sezione

        tree[section]['Systemic Effects'] = systemic_effects
        tree[section]['Local Effects'] = local_effects
        # Carico le sottosezioni nelle sezioni
    tree

tree_full = {}
# è ora che le cose si fanno complicate a causa delle sotto sottosezioni per ogni sezione.

sub_sub_sections = tree['Workers - Hazard via inhalation route']['Local Effects'].find_all('section')
sub_sub_sections_title = [sub_sub_section.find('h3').text.strip() for sub_sub_section in sub_sub_sections]
#sub_sub_sections
#[kid for kid in tree['Workers - Hazard via inhalation route']['Local Effects'].children]


'-------------------------------------------------------------------------------------------------------------------------------------'
'-------------------------------------------------------------------------------------------------------------------------------------'
'-------------------------------------------------------------------------------------------------------------------------------------'

test = tree['General Population - Hazard via oral route']['Systemic Effects']
test = test.find_all('section')
#test_test = test.find('section', )

for section in main_sections:
    tree_full[section] = {'Systemic Effects':None}
    tree_full[section] = {'Local Effects':None}
    
    local_effects = tree[section]['Local Effects']
    systemic_effects = tree[section]['Systemic Effects']
    try:
        local_effects_sections = local_effects.find_all('section')

        systemic_effects_sections = systemic_effects.find_all('section')
    except:
        'NoneType'
    tree_full[section]['Local Effects'] = local_effects_sections
    tree_full[section]['Systemic Effects'] = systemic_effects_sections




with st.expander('Tree Full'):
    tree_full

# Ora ogni sotto sotto sezione deve essere formattata a sua volta.

def divs_to_df (divtitle, inner_divs, subsection):
# Questa è la parte in cui la complessità diventa tale che smetto di capirci qualcosa e vado ad istinto
    inner_divs = [value.text.lstrip().rstrip() for value in inner_divs if value.text.lstrip().rstrip() != '']
    values_corrected = []
    skip = None
    # Ora per ogni sezione ho tutta una serie di divs. Li devo processare e pulirli perchè hanno diverse zozzerie all'interno.
    for div in inner_divs:
            if skip == True:
                skip = False
                continue
            #if ('mg/' or '/kg' or 'bw/' or '/day') in inner_divs:
                # Questa condizione mi serve a fare in modo che l'algoritmo non mi splitti il value con le unità di misura in righe diverse
                #f'debugging:'
                #st.code(f'''inner_div: {inner_divs}
                #            inner_div[0]: {inner_divs[0]}
                #            inner_div[-1]: {inner_divs[-1]}
                #            key: {key}
                #            current value: {div}''')
            if ('\n' or '\t') in div:
                div = div.replace('\n', '     ')
                div = div.replace('\t', '     ')
                # Cambio \n e \t con spazi vuoti
            if '  ' in div:
                inner_divs = div.split('     ')
                if inner_divs[0] != '' and inner_divs[-1] != '' and  inner_divs[-2] != '':
                # sta condizione serve quando ho situazioni di questo tipo:
                 #inner_div: ['Value', '', '', '', '', '', '2.4', ' mg/kg bw/day']
                    #f'Debugging. inner_divs[0] = {inner_divs[0]}, inner_divs[-2] = {inner_divs[-2]}, inner_divs[-1] = {inner_divs[-1]}'
                    print("Found similiar 0 and -2:" ,inner_divs[0], " | ",  inner_divs[-2] , " | ", inner_divs[-1])
                    if inner_divs[0] != inner_divs[-2]:
                        values_corrected.append(inner_divs[0].rstrip().lstrip())
                        values_corrected.append(inner_divs[-2].lstrip() + inner_divs[-1].rstrip())
                        #f":green[Appended left: **{inner_divs[0].rstrip().lstrip()}** | right: **{inner_divs[-2].lstrip() + inner_divs[-1].rstrip()}**]"
                        skip = True
                        # Questo flag serve a far skippare il prossimo div. Non comprenderò questo codice tra qualche minuto
                    #else:
                        #print('Trap!')
                        #f":red[------------- That's a trap! I'm not appending '{inner_divs[0]} and '{inner_divs[-2]} and '{inner_divs[-1]}']"
                        #f":red[inner_divs: {inner_divs}]"   
                else:
                    if inner_divs[0] != inner_divs[-2]:
                        values_corrected.append(inner_divs[0].rstrip().lstrip())
                        values_corrected.append(inner_divs[-1].rstrip().lstrip())
                # Se sono presenti molti spazi vuoti vuol dire che sto avendo a che fare con un div che in realtà ha due divs. Quindi faccio due append separati.
            else:
                values_corrected.append(div)
    divtitle
    values_corrected

with st.expander('Final'):
    for subsection in tree_full:
        # Workers x2, Hazard x3
        st.subheader(subsection)
        '**Systemic Effects**'
        systemic = tree_full[subsection]['Systemic Effects']
        for sub_sub in systemic:
            title = sub_sub.find('h3').text
            inner_divs = sub_sub.find_all('div')
            divs_to_df(title, inner_divs, subsection)




