# Qui dal sito creiamo una tabella pandas
import pandas as pd 
from bs4 import BeautifulSoup

page = open("quacker.html", "r")
soup1 = BeautifulSoup(page, 'html.parser')

print(page.prettify())
