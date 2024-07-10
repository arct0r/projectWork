import streamlit as st
import requests
from bs4 import BeautifulSoup
import requests as re 
import streamlit.components.v1 as components
import urllib.parse
import lxml
import pandas as pd

page = re.get('https://chem.echa.europa.eu/html-pages/3bbf1ca2-c4c6-4dfd-a388-683f7d96f14b/documents/IUC5-276f7bd6-a119-480a-b589-a5c64d1203bc_1c7aefbf-3d23-4505-af5b-be691bca38fb.html')
#page.content
soup = BeautifulSoup(page.content)
soup.prettify()
soup