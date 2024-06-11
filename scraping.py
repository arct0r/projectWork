# Qui dal sito creiamo una tabella pandas
import pandas as pd 
import requests as rq
from bs4 import BeautifulSoup as bs

# with open('quacker.html', errors='ignore') as page:
    #soup = BeautifulSoup(page, 'html.parser')

# print(soup.prettify())

# Funzione che crea il dataframe con tutte le report e le reference, una volta definito l'ingrediente,
# prende in input il link della pagina contenente tutte le report dell'ingrediente
def getDF(link):
    page_ref = rq.get(link)

    page_soup = bs(page_ref.text, 'html.parser')
    
    #reports = ['https://cir-reports.cir-safety.org/'+i.get('href')[3:] for i in page_soup.findAll('table')[0].findAll('a')]
    #dates = [k.text for k in page_soup.findAll('table')[1]]
    test = [k for k in page_soup.findAll('tr')]
    print(test)
    #print(reports)
    #print(dates)

    df = pd.DataFrame()

    return test

def getDF_soup():
    with open("sample_page.html") as page:
        page_soup = bs(page, 'html.parser')
    
    #reports = ['https://cir-reports.cir-safety.org/'+i.get('href')[3:] for i in page_soup.findAll('table')[0].findAll('a')]
    #dates = [k.text for k in page_soup.findAll('table')[1]]
    test = [k.findAll('td').text for k in page_soup.findAll('tr')]
    print(test)
    #test = [k for k in test.findAll('td')]
    #print(test)
    #print(reports)
    #print(dates)

    #df = pd.DataFrame()

    return None
getDF_soup()

