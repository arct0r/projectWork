# Qui dal sito creiamo una tabella pandas
import pandas as pd 
from bs4 import BeautifulSoup

with open('quacker.html', errors='ignore') as page:
    soup = BeautifulSoup(page, 'html.parser')

    
print(soup.prettify())

