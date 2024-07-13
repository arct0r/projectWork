import streamlit as st
import pandas as pd
from bs4 import BeautifulSoup as bs
import requests as rq
from scraping import getDF, get_pdf_content
import google.generativeai as genai
import time 
from echa_find import search_dossier
from echa_summary import echa_pandas, acute_toxicity_to_pandas
import re as standardre
from st_keyup import st_keyup
import duckdb

#### HEADER ################################
col1,col2,col3 = st.columns([5,4,1])
with col1:
    st.title('👩🏻‍🔬 :red[Tox]*F!nder*')
with col2:
    source = st.radio(
            "",
            options=[":rainbow[ECHA]",":violet[**PubChem**]", ":blue[CIR]"],
            captions = ["LD50", "NOAEL", "Misto"], horizontal=True, index=0)
with col3:
    st.markdown("<div style='width: 1px; height: 29px'></div>", unsafe_allow_html=True)
    with st.popover('ℹ️'):
          ''':violet[**PubChem**] estra instantaneamente i valori LD50. 🚀'''
          ''':rainbow[**ECHA**] estrae velocemente dai dossier tossicologici sul sito Echa. Sia NOAEL sia LD50. 😎'''
          ''':blue[CIR] è lento. Estrae dai pdf e fa interpretare all'***Intelligenza Artificiale*** 😲'''

############################################
conn = duckdb.connect(':memory:')

# Creo una table con un select di duckdb
conn.execute("CREATE TABLE substances_echa AS SELECT * FROM read_csv_auto('echastuff.csv')")
conn.execute("CREATE TABLE substances_echa_local AS SELECT * FROM read_csv_auto('scraped_substances.csv')")

echa_df_local = conn.execute("SELECT * FROM substances_echa_local ORDER BY 1 ASC").df()
#echa_df_local

st.session_state['sections'] = ['Workers - Hazard via inhalation route',
        'Workers - Hazard via dermal route',
        'General Population - Hazard via inhalation route',
        'General Population - Hazard via dermal route',
        'General Population - Hazard via oral route',
        'Acute Toxicity'
    ]
# Carico nella sessione di streamlit il nome delle sezioni. Mi serviranno per i toggle dopo.

if source == ':rainbow[ECHA]':
    col7,col8 = st.columns([9,1])
    with col8:
        st.markdown("<div style='width: 1px; height: 29px'></div>", unsafe_allow_html=True)
        with st.popover('⚙️'):
            'Mostra le seguenti sezioni'
            local_substances = st.checkbox(label='Sostanze salvate in locale', value=False)
            tall_bar = st.checkbox(label='Tabella sostanze', value=False)
            acute_toxicity_toggle = st.checkbox(label='Acute Toxicity',value=False)
            workers_dermal = st.checkbox(label='Workers - Hazard via dermal route',value=True)
            workers_inhalation = st.checkbox(label='Workers - Hazard via inhalation route',value=True)
            population_inhalation = st.checkbox(label='General Population - Hazard via inhalation route',value=True)
            population_dermal = st.checkbox(label='General Population - Hazard via dermal route',value=True)
            population_oral = st.checkbox(label='General Population - Hazard via oral route',value=True)
            # Tutta una serie di toggle per controllare quali sezioni risulteranno visibili da una ricerca
            if not acute_toxicity_toggle:
                st.session_state['sections'].remove('Acute Toxicity')
            if not workers_dermal:
                st.session_state['sections'].remove('Workers - Hazard via dermal route')
            if not workers_inhalation:
                st.session_state['sections'].remove('Workers - Hazard via inhalation route')
            if not population_inhalation:
                st.session_state['sections'].remove('General Population - Hazard via inhalation route')
            if not population_dermal:
                st.session_state['sections'].remove('General Population - Hazard via dermal route')
            if not population_oral:
                st.session_state['sections'].remove('General Population - Hazard via oral route')

    conn.execute("CREATE TABLE echa_substances AS SELECT * FROM read_csv_auto('echastuff.csv')")
    # Carico il dataframe con tutte le sostanze dell'ECHA attraverso DuckDB
    echa_df = conn.execute("SELECT DISTINCT column2 as Substance FROM substances_echa ORDER BY Substance ASC OFFSET 1").df()
    # Faccio un offset perchè la prima riga è inutile e problematica

    with col7:
        df_select = st.selectbox(label='Puoi selezionare la sostanza dalla barra di ricerca o dalla tabella', options=echa_df if not local_substances else echa_df_local['Scraped Substances'], placeholder='Isooctane', index=None)

    with st.expander('Tabella sostanze', expanded=True if tall_bar else False):
        st_select_df = st.dataframe(echa_df if not local_substances else echa_df_local['Scraped Substances'], hide_index=True, height=300, use_container_width=True, on_select='rerun', selection_mode='single-row')

    if df_select or st_select_df.selection.rows:
            if not local_substances:
                substance = df_select if df_select else echa_df['Substance'].iloc[st_select_df.selection.rows[0]]
            elif local_substances:
                substance = df_select if df_select else echa_df_local['Scraped Substances'].iloc[st_select_df.selection.rows[0]]
            st.session_state['AcuteToxicity'] = None
            st.subheader(substance)
            if local_substances:
                uuid = echa_df_local.loc[echa_df_local['Scraped Substances'] == substance, 'ToxSummFilename'].values[0]
                local_summary_content = open(f'echa_scraping/{uuid}.html', 'r', encoding="utf8").read()
                try:
                    echa_pandas(local_summary_content)
                except:
                    st.write('Qualcosa è andato storto con il decoding locale di questa sostanza. Prova a cercarla non da locale.')
            if not local_substances:
                final_url = search_dossier(substance)
                if final_url:
                    col1,col2 = st.columns(2)
                    with col1:
                        st.page_link(label=':blue[**Riassunto tossicologico** completo sul sito ECHA]', page=final_url)
                        #Cerco di recuperare un URL data una sostanza. Se esiste lo passo e inizializzo tutti i metodi che  mi interpretano la pagina ECHA
                else:
                    st.error('Non ho trovato alcun riassunto tossicologico.')
            if st.session_state['AcuteToxicity']!=None:
                st.page_link(label=':violet[**Acute Toxicity** completo sul sito ECHA]', page=st.session_state['AcuteToxicity'])
                acute_toxicity_to_pandas()
                if not local_substances:
                    summary_content = rq.get(final_url).text
                echa_pandas(summary_content)
                # Questo serve per la pagina con il summary dell'Acute Toxicity. Quella è un'altra storia

if source == ":blue[CIR]":
    st.switch_page('pages/CIR.py')
        
if source == ":violet[**PubChem**]":
    st.switch_page('PubChem.py')

st.image('duckdb.svg', width=80)