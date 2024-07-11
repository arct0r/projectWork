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



st.title('👩🏻‍🔬 Substance Surfer')

pubchem_tab, echa_tab, cir_tab  = st.tabs([":violet[**PubChem**]", ":rainbow[**ECHA**]", ":blue[**CIR**]"])

with echa_tab:
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



with cir_tab:
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
        table
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
        

with pubchem_tab:
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
