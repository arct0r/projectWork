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
import duckdb


#### HEADER ################################
col1,col2,col3 = st.columns([5,4,1])
with col1:
    st.title('👩🏻‍🔬 :red[Tox]*F!nder*')
with col2:
    source = st.radio(
            "",
            options=[":rainbow[ECHA]",":violet[**PubChem**]", ":blue[CIR]"],
            captions = ["LD50", "NOAEL", "Misto"], horizontal=True, index=1)
with col3:
    st.markdown("<div style='width: 1px; height: 29px'></div>", unsafe_allow_html=True)
    with st.popover('ℹ️'):
          ''':violet[**PubChem**] estra instantaneamente i valori LD50. 🚀'''
          ''':rainbow[**ECHA**] estrae velocemente dai dossier tossicologici sul sito Echa. Sia NOAEL sia LD50. 😎'''
          ''':blue[CIR] è lento. Estrae dai pdf e fa interpretare all'***Intelligenza Artificiale*** 😲'''
############################################


# Mi connetto con duckdb
conn = duckdb.connect(':memory:')

# Creo una table con un select di duckdb
conn.execute("CREATE TABLE substances AS SELECT * FROM read_csv_auto('HSDB.csv')")

if source == ':rainbow[ECHA]':
    st.switch_page('pages/Echa.py')

if source == ":blue[CIR]":
    st.switch_page('pages/CIR.py')

if source == ":violet[**PubChem**]":
    value = st_keyup("Inserisci il nome o le iniziali della sostanza", key='Sostanza', placeholder='Nitroglycerin')
    # Notice that value updates after every key press
    pubchem_csv = pd.read_csv('pubchem.csv')
    
    col1, col2, col3, col4 = st.columns([3,2,3,2])
    with col1:
        HSDB = st.toggle('HSDB', value=True)
    with col3:
        tall_table = st.checkbox(label='Riduci altezza tabella', key='2993')
    with col4:
        info = st.checkbox(label='Info', value=True)
    if info:
        st.info(''':green[**HSDB**] fa ricerche su un database salvato in locale della :green[Hazardous Substances Data Bank] e :green[***risulta instantaneo.***]
                Se deselezionato le sostanze vengono ricercate sul database completo del :violet[**PubChem**]. Questo contiene piu' risultati ma risulta piu' lento.
                PubChem permette di selezionare fino a 3 sostanze contemporaneamente, HSDB fino a 10.''')





    val = 300 if not tall_table else 100
    if HSDB:
        conn.execute("CREATE TABLE local_substances AS SELECT * FROM read_csv('HSDB.csv', header=1)")

        result = conn.execute("SELECT DISTINCT Name FROM local_substances ORDER BY Name ASC").df()

        pubchem_subs = st.dataframe(result[result['Name'].str.contains(value, case=False, na=False)]['Name'], height=val, use_container_width=True, on_select="rerun", selection_mode="multi-row",hide_index=True, key='777')

        df_select = pubchem_subs.selection.rows

        if df_select:
            for i in df_select[:10]:
                    substance_name = result['Name'].iloc[i]
                    st.subheader(substance_name)
                    query = "SELECT Measure, Toxicity, Reference FROM local_substances WHERE Name = ?"
                    query_res = conn.execute(query, [substance_name]).df()
                    st.dataframe(query_res, hide_index=True)
                    

    elif not HSDB:
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
