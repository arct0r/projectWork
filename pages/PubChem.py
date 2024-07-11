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
col1,col2 = st.columns([5,5])
with col1:
    st.title('👩🏻‍🔬 :red[Tox]*F!nder*')
with col2:
    source = st.radio(
            "",
            options=[":rainbow[ECHA]",":violet[**PubChem**]", ":blue[CIR]"],
            captions = ["LD50", "NOAEL", "Misto"], horizontal=True, index=0)
############################################

if source == ':rainbow[ECHA]':
    st.switch_page('Echa.py')

if source == ":blue[CIR]":
    st.switch_page('pages\CIR.py')

if source == ":violet[**PubChem**]":
    value = st_keyup("Inserisci il nome o le iniziali della sostanza", key='Sostanza' )
    # Notice that value updates after every key press
    pubchem_csv = pd.read_csv('pubchem.csv')
    tall_table = st.checkbox(label='Riduci altezza tabella', key='2993')
    val = 300 if not tall_table else 100
    pubchem_subs = st.dataframe(pubchem_csv[pubchem_csv['substances'].str.contains(value, case=False, na=False)]['substances'], height=val, use_container_width=True, on_select="rerun", selection_mode="multi-row",hide_index=True, key='3030')

    df_select = pubchem_subs.selection.rows


    if df_select:
        for i in df_select[:4]:
                st.subheader(pubchem_csv['substances'].iloc[i])
                cid = pubchem_csv['cid'].iloc[i]
                acuteTox, summaryLink = pubchem_stuff(cid)
                st.page_link(label=':blue[**Link del riassunto completo**]',page=summaryLink)
                st.dataframe(acuteTox, hide_index=True)
                st.divider()
