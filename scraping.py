# Qui dal sito creiamo una tabella pandas
import pandas as pd 
import requests as rq
from PyPDF2 import PdfReader as pdfr
from bs4 import BeautifulSoup as bs
import os

dossier_path = 'C:/Users/PierluigiDurante/OneDrive - ITS Angelo Rizzoli/Desktop/Project Work 1/Progetto/projectWork/dossier.pdf'

# with open('quacker.html', errors='ignore') as page:
    #soup = BeautifulSoup(page, 'html.parser')

# print(soup.prettify())

# Funzione che crea il dataframe con tutte le report e le reference, una volta definito l'ingrediente,
# prende in input il link della pagina contenente tutte le report dell'ingrediente

# Dato un link di CIR questa funzione restituisce una tabella con le informazioni e i link ai pdf
def getDF(link):
    page_ref = rq.get(link)
    page_soup = bs(page_ref.text, 'html.parser')
    
    reports = ['https://cir-reports.cir-safety.org/'+i.get('href')[3:] for i in page_soup.findAll('table')[0].findAll('a')]
    # Pigliamo tutti i link

    test = [i.contents for i in page_soup.findAll('td')]
    # Pigliamo tutto

    test = test[3:]
    # Eliminiamo le prime 3 informazioni estratte. Sono inutili.

    df = pd.DataFrame()
    for i in range(0,len(test),3):
        df = pd.concat([df, pd.DataFrame({1: test[i], 2: test[i+1], 3: test[i+2]})], ignore_index=True)
    # Creiamo il dataframe

    df = df.assign(Link=reports)
    # Inseriamo i link nel dataframe

    df = df.rename(columns={1: "Name", 2: "Status", 3: "Date/Reference", 4: "Link"})
    # Rinominiamo le colonne del dataframe
    
    df = df.drop(['Name','Status'], axis=1) #temp drop
    return df

# Funzione per testare lo scraping manualmente
def getDF_soup():
    with open("sample_page.html") as page:
        page_soup = bs(page, 'html.parser')
    
    reports = ['https://cir-reports.cir-safety.org/'+i.get('href')[3:] for i in page_soup.findAll('table')[0].findAll('a')]
    test = [i.contents for i in page_soup.findAll('td')]
    test = test[3:]
    print(test)
    new_test = []
    df = pd.DataFrame()


    for i in range(0,len(test),3):
        df = pd.concat([df, pd.DataFrame({1: test[i], 2: test[i+1], 3: test[i+2]})], ignore_index=True)


    df = df.assign(Link=reports)
    df = df.rename(columns={1: "Name", 2: "Status", 3: "Date/Reference", 4: "Link"})
    print(df)

    #test = [k.findAll('td').text for k in page_soup.findAll('tr')]
    #print(test)

    #test = [k for k in test.findAll('td')]
    #print(test)

    #print(reports) this works. It gets the links.
    #print(dates)

    #df = pd.DataFrame()

    return None

getDF_soup()

def get_pdf_pages(df):
    ref_pages = []
    remove_dossier()
    for link in df['Link']:
        dossier = rq.get(link)
        with open('dossier.pdf', 'wb') as file:
            file.write(dossier.content)
        with open('dossier.pdf', 'rb') as file_read:
            pdf_file = pdfr(file_read)
            # number_of_pages = len(pdf_file.pages)
            extracted_pages = [p.extract_text() for p in pdf_file.pages]
            for page in extracted_pages:
                if "LD50" in page or "NOAEL" in page:
                    ref_pages.append(page)
        #print(len(ref_pages))
        #print(ref_pages)
        text_file = open("dossier.txt", "w")
        for testo in ref_pages:
            text_file.write(testo)
    
    return text_file

def remove_dossier(pdf_path = dossier_path):
    if os.path.exists(pdf_path):
        os.remove(pdf_path)

