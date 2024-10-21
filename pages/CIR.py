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
import random

#### HEADER ################################
col1,col2,col3 = st.columns([5,4,1])
with col1:
    st.title('👩🏻‍🔬 :red[Tox]*F!nder*')
with col2:
    source = st.radio(
            "",
            options=[":rainbow[ECHA]",":violet[**PubChem**]", ":blue[CIR]"],
            captions = ["LD50", "NOAEL", "Misto"], horizontal=True, index=2)
with col3:
    st.markdown("<div style='width: 1px; height: 29px'></div>", unsafe_allow_html=True)
    with st.popover('ℹ️'):
          ''':violet[**PubChem**] estrae instantaneamente i valori LD50. 🚀'''
          ''':rainbow[**ECHA**] estrae velocemente dai dossier tossicologici sul sito Echa. Sia NOAEL sia LD50. 😎'''
          ''':blue[CIR] è lento. Estrae dai pdf e fa interpretare all'***Intelligenza Artificiale*** 😲'''

############################################

if source == ':rainbow[ECHA]':
    st.switch_page('pages/Echa.py')


if source == ":blue[CIR]":
    'CIR not available in this testing version'
        

if source == ":violet[**PubChem**]":
    st.switch_page('PubChem.py')

st.image('duckdb.svg', width=80)