import streamlit as st
from bs4 import BeautifulSoup
import pandas as pd
import re as standardre
import sys
import requests as rq

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

# Questo per ogni sezione nella main sections, quindi 5-6. Quite the challenge.

def highlight_noael(val):
    color = 'blue'
    weight = 'bold'
    if val in ['NOAEL', 'DNEL (Derived No Effect Level)']:
        return f'color: {color}; font-weight: {weight}'
    return ''
# Questa funzione mi serve per evidenziare i valori NOAEL nelle tabelle finali.

def echa_pandas(summary_content):
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

    soup = BeautifulSoup(summary_content, 'html.parser')
    soup.prettify()
    article = soup.find(class_="das-document ENDPOINT_SUMMARY DataTox")

    i = 0
    for id in id_sections:
        main_sections_dict[main_sections[i]] = article.find(class_=standardre.compile(id, standardre.I))
        i+=1

    tree = {}

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

    tree_full = {}
    # è ora che le cose si fanno complicate a causa delle sotto sottosezioni per ogni sezione.

    sub_sub_sections = tree['Workers - Hazard via inhalation route']['Local Effects'].find_all('section')
    sub_sub_sections_title = [sub_sub_section.find('h3').text.strip() for sub_sub_section in sub_sub_sections]


    test = tree['General Population - Hazard via oral route']['Systemic Effects']
    test = test.find_all('section')

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

    # Ora ogni sotto sotto sezione deve essere formattata a sua volta.

    def divs_to_df (effects, divtitle, inner_divs, subsection):
    # Questa è la parte in cui la complessità diventa tale che smetto di capirci qualcosa e vado ad istinto
    # Essenzialmente ho una sfilza di divs rotti e mal formattati da trasformare in dataframes di panda. 

        right_values = ['5','4','3','2', '1', '[Not publishable]', 'No remaining uncertainties.', '[Empty]', 'Default value for workers according to ECHA REACH Guidance.','The available studies are pre/GLP and non-guideline studies.']

        inner_divs = [value.text.lstrip().rstrip() for value in inner_divs if value.text.lstrip().rstrip() != '']
        values_corrected = []
        skip = None
        # Ora per ogni sezione ho tutta una serie di divs. Li devo processare e pulirli perchè hanno diverse zozzerie all'interno.
        for div in inner_divs:
                if skip == True:
                    skip = False
                    continue

                if ('\n' or '\t') in div:
                    div = div.replace('\n', '     ')
                    div = div.replace('\t', '     ')
                    div = div.replace('other:', '     ')
                    # Cambio \n e \t con spazi vuoti
                if '  ' in div:
                    inner_divs = div.split('     ')
                    try:
                        if inner_divs[0] != '' and inner_divs[-1] != '' and  inner_divs[-2] != '':
                        # sta condizione serve quando ho situazioni di questo tipo:
                        #inner_div: ['Value', '', '', '', '', '', '2.4', ' mg/kg bw/day']
                            if inner_divs[0] != inner_divs[-2] and inner_divs[0] not in right_values:
                                values_corrected.append(inner_divs[0].rstrip().lstrip())
                                values_corrected.append(inner_divs[-2].lstrip() + inner_divs[-1].rstrip())
                                #f":green[Appended left: **{inner_divs[0].rstrip().lstrip()}** | right: **{inner_divs[-2].lstrip() + inner_divs[-1].rstrip()}**]"
                                skip = True
                                # Questo flag serve a far skippare il prossimo div. Non comprenderò questo codice tra qualche minuto 
                        else:
                            if inner_divs[0] != inner_divs[-2] and inner_divs[0] not in right_values:
                                values_corrected.append(inner_divs[0].rstrip().lstrip())
                                values_corrected.append(inner_divs[-1].rstrip().lstrip())
                    # Se sono presenti molti spazi vuoti vuol dire che sto avendo a che fare con un div che in realtà ha due divs. Quindi faccio due append separati.
                    except:
                        print('Out of range while correcting values')
                else:
                    values_corrected.append(div)

        # Ora che ho tutti i valori in values_corrected creo un dataframe di pandas 
        df_base = pd.DataFrame({'Description':[], 'Value':[]})
        for i in range(0, len(values_corrected), 2):
            try:
                if values_corrected[i] not in right_values and values_corrected[i]!=values_corrected[i+1]:
                    df_base = df_base._append({'Description':values_corrected[i],'Value':values_corrected[i+1]}, ignore_index=True)
            except:
                print('Out of range while making dataframes')
        df_base = df_base.drop_duplicates()   
        df_base = df_base[~df_base['Description'].isin(right_values)]
        df_base = df_base[~df_base['Value'].isin(['[Empty]', '[Not publishable]', 'Justification', 'AF for dose response relationship', 'AF for intraspecies differences', 'AF for other interspecies differences', 'AF for interspecies differences (allometric scaling)', 'AF for differences in duration of exposure'])]
        df_base = df_base.loc[df_base["Value"] != 'no hazard identified']
        df_base = df_base.loc[df_base["Value"] != 'low hazard (no threshold derived)']
        df_base = df_base.loc[df_base["Value"] != 'hazard unknown but no further hazard information necessary as no exposure expected']
        df_base['Description'] = df_base['Description'].replace('Value', '➔')
        df_base = df_base.applymap(lambda x: x.replace('Â', '') if isinstance(x, str) else x)
        # Rimuovo tante eccezioni. Le trovo man mano che testo.

        if not df_base.empty:
            st.write(f"{effects}: {divtitle}")
            try:
                df_base = df_base.reset_index()
                noael_index = df_base[df_base['Value'] == 'NOAEL'].index[0]
                truncated_df = df_base[:noael_index+2]
                del truncated_df['index']
                styled_df = truncated_df.style.map(highlight_noael)
                st.dataframe(styled_df, use_container_width=True, hide_index=True)
                # Con questo try/catch sto rimuovendo le righe dopo la prima occorrenza del valore NOAEL e sto colorando i valori NOAEL.
                # Essenzialmente tolgo la roba inutile.
            except Exception as e:
                print(f"Error occurred: {str(e)}")
                del df_base['index']
                styled_df = df_base.style.map(highlight_noael)
                st.dataframe(styled_df, use_container_width=True, hide_index=True)
            # La fine della sofferenza. Printo il titolo del dataframe e il dataframe solo se non sono vuoti.
            
        else:
            return False
        
        

    for subsection in tree_full:
            # Workers x2, Hazard x3
            if subsection in st.session_state['sections']:
                with st.expander(subsection, expanded=True):
                    systemic = tree_full[subsection]['Systemic Effects']
                    local = tree_full[subsection]['Local Effects']

                    effects = ':orange[**Systemic Effects**]'
                    for sub_sub in systemic:
                        title = sub_sub.find('h3').text
                        inner_divs = sub_sub.find_all('div')
                        divs_to_df(effects, title, inner_divs, subsection)

                    effects = ':green[**Local Effects**]'
                    for sub_sub in local:
                        title = sub_sub.find('h3').text
                        inner_divs = sub_sub.find_all('div')
                        divs_to_df(effects, title, inner_divs, subsection)


def acute_toxicity_to_pandas():
    # Questo metodo serve solo a processare le pagine di 'Acute Toxicity', se sono presenti.
    if 'Acute Toxicity' in st.session_state['sections']:
        with st.expander('Acute toxicity', expanded=True):
            acute_tox_link = st.session_state['AcuteToxicity']
            page = rq.get(acute_tox_link)
            soup = BeautifulSoup(page.text, 'html.parser')
            soup.prettify()
            
            body = soup.find(class_ = 'das-document ENDPOINT_SUMMARY AcuteToxicity')
            key_information = body.find('section', class_='das-block KeyInformation')
            try:
                key_info = key_information.find('div', class_='das-field_value das-field_value_html')
            except:
                print('Cant find divs for Acute Toxicity Summaries')
                return False
            if key_info.find_all('p'):
                st.write(':red[**Summary:**] ')
                for info in key_info.find_all('p'):
                    st.write(info.text)
            else:
                st.write(':red[**Summary:**] ')
                for info in key_info.text.split('.'):
                    st.write(info)
