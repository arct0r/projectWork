import streamlit as st
import pandas as pd
from bs4 import BeautifulSoup as bs
import requests as rq
from scraping import getDF
import google.generativeai as genai


st.title('⌬ Substance Searcher 🧪')

#Bottone
source = st.radio(
    "Seleziona la fonte di dati",
    [":rainbow[ECHA]", ":blue[CIR]"],
    captions = ["Più veloce, attraverso l'API di Iuclid", "Scraping manuale, lento"], horizontal=True, index=1)

if source == ":rainbow[ECHA]":
    "Hey, you shouldn't click that yet."
elif source ==':blue[CIR]':
    with open("cir-reports.csv") as tab:
        csv = pd.read_csv(tab, names=['Ingredienti', 'INCI Nome', 'Link'])

    csv = csv[2:]
    csv = csv.drop_duplicates(subset=['Link'])

    substance = st.selectbox(label = "Inserisci il nome della sostanza che vuoi cercare:", options=csv['Ingredienti'], index=None)
    #st.write("Attempting to search: ", substance)
    if substance:
        result = csv.loc[csv['Ingredienti'] == substance]
        link = result.iloc[0]['Link']   
        link
        page_ref = rq.get(link)
        page_soup = bs(page_ref.text, 'html.parser')
        table = getDF(link)
        table     
    else:
        csv
        genai.configure(api_key = "AIzaSyDBaM35Zp4FUO0ZDe01OsBpqsTUColrYyw")
        model = genai.GenerativeModel(model_name="gemini-1.5-flash")
        # domanda = st.text_area(label='Type your input here')
        qq = 'Leggi questo testo e trova i valori di NOAEL e di LD50s presenti, poi creami una tabella coi valori trovati\n'
        #print(qq+text_file.read())
        #f"{type(text_file)}"
        #f"{text_file.read()}"
        'aaaa'   
        git_link = 'https://github.com/arct0r/projectWork/raw/main/Prova.txt'
        file = rq.get(git_link)
        #with open(, 'r') as testo:
         #   text = testo.read()
        #st.write(text)
        confirm = st.button(label='Ask gemini')
        if confirm:
            response = model.generate_content(f"{qq} : \n {file.text}")
            response.text



