import streamlit as st
import pandas as pd
from bs4 import BeautifulSoup as bs
import requests as rq
from scraping import getDF

st.title('⌬ Substance Searcher  ')

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




