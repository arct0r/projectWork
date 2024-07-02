import streamlit as st
import pandas as pd
from bs4 import BeautifulSoup as bs
import requests as rq
from scraping import getDF, get_pdf_pages
import google.generativeai as genai
import time 

from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.chrome.service import Service
import time
from bs4 import BeautifulSoup

def get_website_content(url):
    driver = None
    try:
        # Using on Local
        options = webdriver.ChromeOptions()
        options.add_argument('--headless')
        options.add_argument('--disable-gpu')
        options.add_argument('--window-size=1920,1200')
        driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()),
                                  options=options)
        st.write(f"DEBUG:DRIVER:{driver}")
        driver.get(url)
        time.sleep(5)
        html_doc = driver.page_source
        driver.quit()
        soup = BeautifulSoup(html_doc, "html.parser")
        return soup.get_text()
    except Exception as e:
        st.write(f"DEBUG:INIT_DRIVER:ERROR:{e}")
    finally:
        if driver is not None: driver.quit()
    return None

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
        with st.status("Downloading data...", expanded=True) as status:
            st.write("Cerco la sostanza selezionata sul sito dell'echa")
            url = 'https://chem.echa.europa.eu/'
            # Inizializzo tutto l'ambaradam per scrappare sto dannato sito dell'ECHA
            # Parte del codice è scopiazzato da un eroe che è riuscito a far funzionare Selenium su Streamlit. 
            driver = None
            try:
                # Using on Local
                options = webdriver.ChromeOptions()
                options.add_argument('--headless')
                #options.add_argument('--disable-gpu')
                #options.add_argument('--window-size=1920,1200')
                driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()),
                                        options=options)
                st.write(f"DEBUG:DRIVER:{driver}")
                driver.get(url)
                html_doc = driver.page_source
                html_doc
                driver.quit()
                #soup = BeautifulSoup(html_doc, "html.parser")

            except Exception as e:
                st.write(f"DEBUG:INIT_DRIVER:ERROR:{e}")
            finally:
                if driver is not None: driver.quit()


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
        #linkjhmjm
        page_ref = rq.get(link)
        page_soup = bs(page_ref.text, 'html.parser')
        table = getDF(link)
        #table
        pagine = get_pdf_pages(table)
        genai.configure(api_key = "AIzaSyDBaM35Zp4FUO0ZDe01OsBpqsTUColrYyw")
        model = genai.GenerativeModel(model_name="gemini-1.5-flash")
        # domanda = st.text_area(label='Type your input here')
        qq = 'Leggi questo testo e trova i valori di NOAEL e di LD50s presenti, poi creami una tabella coi valori trovati\n'
        git_link = 'https://github.com/arct0r/projectWork/raw/main/Prova.txt'
        file = rq.get(git_link)
        confirm = st.button(label='Ask gemini')
        prompt = f"{qq} : \n {file.text}"
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



