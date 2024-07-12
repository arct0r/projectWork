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
from pubtest import pubchem_stuff

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

st.session_state['sections'] = ['Workers - Hazard via inhalation route',
        'Workers - Hazard via dermal route',
        'General Population - Hazard via inhalation route',
        'General Population - Hazard via dermal route',
        'General Population - Hazard via oral route',
        'Acute Toxicity'
    ]
if source == ':rainbow[ECHA]':
    echastuff = pd.read_excel('echastuff.xlsx')
    col7,col8 = st.columns([9,1])
    with col7:
        echa_substance_select = st.selectbox(label = "Inserisci il nome della sostanza che vuoi cercare:", options=echastuff['Substance'], index=None)
    with col8:
        st.markdown("<div style='width: 1px; height: 29px'></div>", unsafe_allow_html=True)
        with st.popover('⚙️'):
            'Mostra le seguenti sezioni'
            acute_toxicity_toggle = st.checkbox(label='Acute Toxicity',value=True)
            workers_dermal = st.checkbox(label='Workers - Hazard via dermal route',value=True)
            workers_inhalation = st.checkbox(label='Workers - Hazard via inhalation route',value=True)
            population_inhalation = st.checkbox(label='General Population - Hazard via inhalation route',value=True)
            population_dermal = st.checkbox(label='General Population - Hazard via dermal route',value=True)
            population_oral = st.checkbox(label='General Population - Hazard via oral route',value=True)
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

    if not echa_substance_select:
        echastuff
    # Se schiaccio una sostanza echa dal multiselect
    if echa_substance_select:
            st.session_state['AcuteToxicity'] = None
            substance = echa_substance_select
            final_url = search_dossier(substance)
            if final_url:
                col1,col2 = st.columns(2)
                with col1:
                    st.page_link(label=':blue[**Riassunto tossicologico** completo sul sito ECHA]', page=final_url)
            if st.session_state['AcuteToxicity']!=None:
                #with col2:
                    #st.page_link(label=':violet[**Acute Toxicity**, scheda completa sul sito ECHA]', page=st.session_state['AcuteToxicity'])
                acute_toxicity_to_pandas()
                summary_content = rq.get(final_url).text
                echa_pandas(summary_content)

if source == ":blue[CIR]":
    st.switch_page('pages/CIR.py')
        
if source == ":violet[**PubChem**]":
    st.switch_page('PubChem.py')