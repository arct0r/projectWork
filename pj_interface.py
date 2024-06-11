import streamlit as st
import pandas as pd

st.title('Substance Searcher (sample name)')

with open("cir-reports.csv") as tab:
    csv = pd.read_csv(tab, names=['Ingredienti', 'INCI Nome', 'Link'])

csv = csv[2:]
substance = st.selectbox(label = "Inserisci il nome della sostanza che vuoi cercare:", options=csv['Ingredienti'])
#st.write("Attempting to search: ", substance)

csv.loc[csv['Ingredienti'] == substance]