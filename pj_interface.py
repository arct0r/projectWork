import streamlit as st
import pandas as pd
from bs4 import BeautifulSoup as bs
import requests as rq

st.title('Substance Searcher (sample name)')

with open("cir-reports.csv") as tab:
    csv = pd.read_csv(tab, names=['Ingredienti', 'INCI Nome', 'Link'])

csv = csv[2:]
csv = csv.drop_duplicates(subset=['Link'])

substance = st.selectbox(label = "Inserisci il nome della sostanza che vuoi cercare:", options=csv['Ingredienti'])
#st.write("Attempting to search: ", substance)

result = csv.loc[csv['Ingredienti'] == substance]
link = result.iloc[0]['Link']
link
page_ref = rq.get(link)

page_soup = bs(page_ref.text, 'html.parser')
# print(page_soup.prettify())

#page_soup.findAll('table')[0].findAll('tr')
['https://cir-reports.cir-safety.org/'+i.get('href')[3:] for i in page_soup.findAll('table')[0].findAll('a')]


