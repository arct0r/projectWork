# Qui dal sito creiamo una tabella pandas
import pandas as pd 
import requests as rq
from pypdf import PdfReader
from bs4 import BeautifulSoup as bs
import os
import re
from io import BytesIO


dossier_path = 'C:/Users/PierluigiDurante/OneDrive - ITS Angelo Rizzoli/Desktop/Project Work 1/Progetto/projectWork/dossier.pdf'

# with open('quacker.html', errors='ignore') as page:
    #soup = BeautifulSoup(page, 'html.parser')

# print(soup.prettify())

# Funzione che crea il dataframe con tutte le report e le reference, una volta definito l'ingrediente,
# prende in input il link della pagina contenente tutte le report dell'ingrediente

# Dato un link di CIR questa funzione restituisce una tabella con le informazioni e i link ai pdf
def getDF(link):
    link = 'https://cir-reports.cir-safety.org/cir-ingredient-status-report/?id=b77dee6a-9067-4aea-9f68-d6b4e31c3523'
    page_ref = rq.get(link)
    page_soup = bs(page_ref.text, 'html.parser')
    
    reports = ['https://cir-reports.cir-safety.org/'+i.get('href')[3:] for i in page_soup.findAll('table')[0].findAll('a') if i.get('href').startswith('..')]
    
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


'''
def get_pdf_pages(df):
    ref_pages = []
    keywords = r"\b(LD50|NOAEL|LD50s|LD 50)\b"  # Combine keywords with word boundaries
    for link in df['Link']:
        dossier = rq.get(link)
        with open('dossier.pdf', 'wb') as file:
            file.write(dossier.content)
        with open('dossier.pdf', 'rb') as ff:
            pdf = PdfReader(ff)
            number_of_pages = len(pdf.pages)
            extracted_pages = [p.extract_text() for p in pdf.pages]

            for page in extracted_pages:
                for match in re.finditer(keywords, page):
                    start_index = max(0, match.start() - 250)  # Ensure start doesn't go negative
                    end_index = min(len(page), match.end() + 250)  # Ensure end doesn't exceed length
                    snippet = page[start_index:end_index]
                    ref_pages.append(snippet)
        
        with open("dossier.txt", "w") as text_file:
            for testo in ref_pages:
                text_file.write(testo)
    
    return text_file
'''

def get_pdf_content(url):
    dossier = rq.get(url)
    contenuto_byte = dossier.content
    pdf_conv = BytesIO(contenuto_byte)
    pdf = PdfReader(pdf_conv)      
    #number_of_pages = len(pdf.pages)
    extracted_pages = [p.extract_text() for p in pdf.pages]

    dossier_text= ''
    keywords = r"LD50|NOAEL|LD50s|LD 50"  # Combine keywords with word boundaries

    for page in extracted_pages:
        for match in re.finditer(keywords, page):
            start_index = max(0, match.start() - 250)  # Ensure start doesn't go negative
            end_index = min(len(page), match.end() + 250)  # Ensure end doesn't exceed length
            snippet = page[start_index:end_index]
            dossier_text += snippet.replace('\n',' ')

    return dossier_text

url = 'https://cir-reports.cir-safety.org/view-attachment/?id=a9a8b89b-8e74-ec11-8943-0022482f06a6'
get_pdf_content(url)
