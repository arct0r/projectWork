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
            captions = ["LD50", "NOAEL", "Misto"], horizontal=True, index=2)
with col3:
    st.markdown("<div style='width: 1px; height: 29px'></div>", unsafe_allow_html=True)
    with st.popover('ℹ️'):
          ''':violet[**PubChem**] estra instantaneamente i valori LD50. 🚀'''
          ''':rainbow[**ECHA**] estrae velocemente dai dossier tossicologici sul sito Echa. Sia NOAEL sia LD50. 😎'''
          ''':blue[CIR] è lento. Estrae dai pdf e fa interpretare all'***Intelligenza Artificiale*** 😲'''

############################################

if source == ':rainbow[ECHA]':
    st.switch_page('pages/Echa.py')



if source == ":blue[CIR]":
    with open("cir-reports.csv") as tab:
        csv = pd.read_csv(tab, names=['Ingredienti', 'INCI Nome', 'Link'])

    csv = csv[2:]
    csv = csv.drop_duplicates(subset=['Link'])
    ##

    substance = st.selectbox(label = "Inserisci il nome della sostanza che vuoi cercare:", options=csv['Ingredienti'], index=None)
    #st.write("Attempting to search: ", substance)
    if substance:
        result = csv.loc[csv['Ingredienti'] == substance]
        link = result.iloc[0]['Link']  
        table = getDF(link)
        st.page_link(page=table['Links'].iloc[0], label=':blue[**Link del dossier completo**]')
        all_links = table['Links'].to_list()
        dossier_text = ''
        for i in range(len(all_links)):
            dossier_text = get_pdf_content(all_links[i])
            if dossier_text:
                break
        genai.configure(api_key = "AIzaSyDBaM35Zp4FUO0ZDe01OsBpqsTUColrYyw")
        model = genai.GenerativeModel(model_name="gemini-1.5-flash")
        qq = f'Leggi questo testo e trova i valori di NOAEL e di LD50 presenti SOLO E SOLTANTO per la sostanza {substance}, poi creami una tabella coi valori trovati. Se non esiste il valore per la sostanza, restituisci "VALORI NON TROVATI"\n'
        #confirm = st.button(label='Ask gemini')
        prompt = f"{qq} : \n {dossier_text}"
        #if confirm: 
        response = model.generate_content(prompt)
        response.text    
    else:
        st.data_editor(csv[['Ingredienti', 'Link']], use_container_width=True,     column_config={
        "Link": st.column_config.LinkColumn("Link dei dossiers 🌐"),
    },)
        

if source == ":violet[**PubChem**]":
    st.switch_page('PubChem.py')
