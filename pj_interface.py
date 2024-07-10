import streamlit as st
import pandas as pd
from bs4 import BeautifulSoup as bs
import requests as rq
from scraping import getDF, get_pdf_content
import google.generativeai as genai
import time 
from pages.echa_find import search_dossier
from pages.echa_summary import echa_pandas
import re as standardre


col1, col2 = st.columns([7,3])
with col1:
    st.title('🧪 Substance Searcher ')

with col2:
    #Bottone
    source = st.radio(
        "",
        options=[":rainbow[ECHA]", ":blue[CIR]"],
        captions = ["Più veloce.", "Più lento."], horizontal=True, index=1)

if source == ":rainbow[ECHA]":
    echastuff = pd.read_excel('echastuff.xlsx')
    
    echa_substance_select = st.selectbox(label = "Inserisci il nome della sostanza che vuoi cercare:", options=echastuff['Substance'], index=None)
    if not echa_substance_select:
        echastuff
    # Se schiaccio una sostanza echa dal multiselect
    if echa_substance_select:      
            substance = echa_substance_select
            final_url = search_dossier(substance)
            if final_url:
                st.page_link(label='Riassunto tossicologico completo sul sito ECHA', page=final_url)
                summary_content = rq.get(final_url).text
                echa_pandas(summary_content)





elif source ==':blue[CIR]':
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
        all_links = table['Links'].to_list()
        dossier_text = ''
        for i in range(len(all_links)):
            dossier_text = get_pdf_content(all_links[i])
            if dossier_text:
                break
        genai.configure(api_key = "AIzaSyDBaM35Zp4FUO0ZDe01OsBpqsTUColrYyw")
        model = genai.GenerativeModel(model_name="gemini-1.5-flash")
        # domanda = st.text_area(label='Type your input here')
        qq = 'Leggi questo testo e trova i valori di NOAEL e di LD50s presenti, poi creami una tabella coi valori trovati. Se non li trovi, restituisci solo il testo: "VALORI NON TROVATI"\n'
        confirm = st.button(label='Ask gemini')
        prompt = f"{qq} : \n {dossier_text}"
        if confirm: 
            response = model.generate_content(prompt)
            response.text
        
    else:
        csv
        genai.configure(api_key = "AIzaSyDBaM35Zp4FUO0ZDe01OsBpqsTUColrYyw")
        model = genai.GenerativeModel(model_name="gemini-1.5-flash")
        # domanda = st.text_area(label='Type your input here')
        qq = 'Leggi questo testo e trova i valori di NOAEL e di LD50s presenti, poi creami una tabella coi valori trovati\n'
        git_link = 'https://github.com/arct0r/projectWork/raw/main/Prova.txt'
        file = rq.get(git_link)
        confirm = st.button(label='Ask gemini')
        if confirm:
            response = model.generate_content(f"{qq} : \n {file.text}")
            response.text



