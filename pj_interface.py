import streamlit as st
import pandas as pd
from bs4 import BeautifulSoup as bs
import requests as rq
from scraping import getDF, get_pdf_content
import google.generativeai as genai
import time 

from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
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
            st.write("Mi collego al sito dell'ECHA")
            url = 'https://chem.echa.europa.eu/'
            # Inizializzo tutto l'ambaradam per scrappare sto dannato sito dell'ECHA
            # Parte del codice è scopiazzato da un eroe che è riuscito a far funzionare Selenium su Streamlit. 
            driver = None
            try:
                # Using on Local
                st.write("Inizializzo i processi di Selenium")
                options = webdriver.ChromeOptions()
                options.add_argument('--headless')
                #options.add_argument('--disable-gpu')
                #options.add_argument('--window-size=1920,1200')
                driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()),
                                        options=options)
                # st.write(f"DEBUG:DRIVER:{driver}")
                driver.get(url)
                time.sleep(2)
                st.write("Cerco la checkbox dei termini e condizioni")
                driver.get("https://chem.echa.europa.eu/")
                driver.set_window_size(1920, 1080)
                driver.find_element(By.XPATH, "//iucdas-mod-substance-search-app").click()
                #driver.find_element(By.CSS_SELECTOR, "iucdas-mod-substance-search-app").click()
                time.sleep(2)
                #st.write("Checkbox cliccata. Ora cerco l'elemento selezionato. ")
                #search_box = driver.find_element(by=By.CLASS_NAME, value='das-root-container')
                #html_doc = driver.page_source

                ##### put the magic here 

                #html_doc
                driver.quit()
                #soup = BeautifulSoup(html_doc, "html.parser")

            except Exception as e:
                st.write(f"{e}")
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
        table = getDF(link)
        dossier_link = table.iloc[0]['Link']
        dossier_text = get_pdf_content(dossier_link)
        genai.configure(api_key = "AIzaSyDBaM35Zp4FUO0ZDe01OsBpqsTUColrYyw")
        model = genai.GenerativeModel(model_name="gemini-1.5-flash")
        # domanda = st.text_area(label='Type your input here')
        qq = 'Leggi questo testo e trova i valori di NOAEL e di LD50s presenti, poi creami una tabella coi valori trovati\n'
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



