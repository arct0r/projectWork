import streamlit as st
import requests
from bs4 import BeautifulSoup
import re
import streamlit.components.v1 as components
import urllib.parse
import lxml
import pandas as pd

with open("testpagesummary2.html") as summary:
    summary = summary.read()
    soup = BeautifulSoup(summary)
    soup.prettify()
    sections = soup.find_all('section')

    section_names = {section.find('h3').text.lstrip().rstrip() : section for section in sections if 'Additional information' not in section.find('h3').text.lstrip().rstrip()}
    'section_names'
    with st.expander('Sections'):
        section_names
    st.divider()

    for key, value in section_names.items():
        # Key: nome della sezione. Value: contenuto della sezione.
        inner_divs = value.find_all('div')
        # Trovo i divs all'interno dei divs.
        inner_divs = [value.text.lstrip().rstrip() for value in inner_divs if value.text.lstrip().rstrip() != '']
        # Cerco di rimuovere gli spazi vuoti. Non è abbastanza.
        if key =='Workers - Hazard via dermal route':
            with st.expander(f'**{key}** : Values Pre Serious processing'):
                inner_divs
        values_corrected = []
        flag_for_next = None
        # Ora per ogni sezione ho tutta una serie di divs. Li devo processare e pulirli perchè hanno diverse zozzerie all'interno.
        for div in inner_divs:
            if flag_for_next == True:
                flag_for_next = False
                f":orange[inner_divs: {inner_divs}]"

            if ('mg/' or '/kg' or 'bw/' or '/day') in inner_divs:
                # Questa condizione mi serve a fare in modo che l'algoritmo non mi splitti il value con le unità di misura in righe diverse
                f'debugging:'
                st.code(f'''inner_div: {inner_divs}
                            inner_div[0]: {inner_divs[0]}
                            inner_div[-1]: {inner_divs[-1]}
                            key: {key}
                            current value: {div}''')
            if ('\n' or '\t') in div:
                div = div.replace('\n', '     ')
                div = div.replace('\t', '     ')
                # Cambio \n e \t con spazi vuoti
            if '  ' in div:
                inner_divs = div.split('     ')
                if inner_divs[0] != '' and inner_divs[-1] != '' and  inner_divs[-2] != '':
                # sta condizione serve quando ho situazioni di questo tipo:
                 #inner_div: ['Value', '', '', '', '', '', '2.4', ' mg/kg bw/day']
                    f'Debugging. inner_divs[0] = {inner_divs[0]}, inner_divs[-2] = {inner_divs[-2]}, inner_divs[-1] = {inner_divs[-1]}'
                    print(inner_divs[0], " | ",  inner_divs[-2])
                    if inner_divs[0] != inner_divs[-2]:
                        values_corrected.append(inner_divs[0].rstrip().lstrip())
                        values_corrected.append(inner_divs[-2].lstrip() + inner_divs[-1].rstrip())
                        f":green[Appended left: **{inner_divs[0].rstrip().lstrip()}** | right: **{inner_divs[-2].lstrip() + inner_divs[-1].rstrip()}**]"
                    else:
                        f":red[------------- That's a trap! I'm not appending '{inner_divs[0]} and '{inner_divs[-2]} and '{inner_divs[-1]}']"
                        f":red[inner_divs: {inner_divs}]"
                        flag_for_next = True

                    
                    # Devo appendere sia '2.4' che ' mg/kg bw/day'
                else:
                    if inner_divs[0] != inner_divs[-2]:
                        values_corrected.append(inner_divs[0].rstrip().lstrip())
                        values_corrected.append(inner_divs[-1].rstrip().lstrip())
                # Se sono presenti molti spazi vuoti vuol dire che sto avendo a che fare con un div che in realtà ha due divs. Quindi faccio due append separati.
            else:
                values_corrected.append(div)

        # Occhio a questo 
        section_names[key] = values_corrected

    'section_names post correction'
    section_names
    # Questo codice è indescrivibile persino per me
        
    #[len(section) for section in section_names.values()]

    sections_ordered = {}
    for section in section_names:
        sections_ordered[section] = []
        for i in range (0, len(section_names[section]), 2):
            sections_ordered[section].append([section_names[section][i], section_names[section][i+1]])
    'Sections Ordered'
    sections_ordered

    df_base = pd.DataFrame({'Description':[], 'Value':[]})
    #df_base = df_base._append({'Description':0,'Value':1},  ignore_index=True)
    #df_base
    pandas_dfs = {}
    for section in sections_ordered:
        pandas_dfs[section] = df_base
        for row in sections_ordered[section]:
            pandas_dfs[section] = pandas_dfs[section]._append({'Description':row[0],'Value':row[1]}, ignore_index=True)

    for name in pandas_dfs:
        name
        pandas_dfs[name]

            



    #divs = section_names[0]['Administrative data'].find_all("div")
    #divs 