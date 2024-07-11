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
            captions = ["LD50", "NOAEL", "Misto"], horizontal=True, index=2)
############################################

if source == ':rainbow[ECHA]':
    st.switch_page('Echa.py')



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
        st.data_editor(table)
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
        csv
        #genai.configure(api_key = "AIzaSyDBaM35Zp4FUO0ZDe01OsBpqsTUColrYyw")
        #model = genai.GenerativeModel(model_name="gemini-1.5-flash")
        # domanda = st.text_area(label='Type your input here')
        #qq = 'Leggi questo testo e trova i valori di NOAEL e di LD50s presenti, poi creami una tabella coi valori trovati\n'
        #git_link = 'https://github.com/arct0r/projectWork/raw/main/Prova.txt'
        #file = rq.get(git_link)
        #confirm = st.button(label='Ask gemini')
        #if confirm:
        #    response = model.generate_content(f"{qq} : \n {file.text}")
        #    response.text
        

if source == ":violet[**PubChem**]":
    st.switch_page('pages\PubChem.py')
