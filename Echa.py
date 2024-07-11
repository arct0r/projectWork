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
col1,col2 = st.columns([6,4])
with col1:
    st.title('👩🏻‍🔬 Substance Surfer')
with col2:
    source = st.radio(
            "",
            options=[":rainbow[ECHA]",":violet[**PubChem**]", ":blue[CIR]"],
            captions = ["LD50", "NOAEL", "Misto"], horizontal=True, index=0)
    
############################################

if source == ':rainbow[ECHA]':
    echastuff = pd.read_excel('echastuff.xlsx')
    echa_substance_select = st.selectbox(label = "Inserisci il nome della sostanza che vuoi cercare:", options=echastuff['Substance'], index=None)
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
                with col2:
                    'Quack'
                    #st.page_link(label=':violet[**Acute Toxicity**, scheda completa sul sito ECHA]', page=st.session_state['AcuteToxicity'])
                if st.session_state['AcuteToxicity']!=None:
                    acute_toxicity_to_pandas()
                summary_content = rq.get(final_url).text
                echa_pandas(summary_content)

if source == ":blue[CIR]":
    st.switch_page('pages\CIR.py')
        
if source == ":violet[**PubChem**]":
    st.switch_page('pages\PubChem.py')