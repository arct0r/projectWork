import streamlit as st
import requests
from bs4 import BeautifulSoup
import re
import streamlit.components.v1 as components
import urllib.parse
import lxml

with open("testpagesummary.html") as summary:
    summary = summary.read()
    soup = BeautifulSoup(summary)
    soup.prettify()
    sections = soup.find_all('section')

    section_names = {section.find('h3').text.lstrip().rstrip() : section for section in sections if 'Additional information' not in section.find('h3').text.lstrip().rstrip()}
    for key, value in section_names.items():

        values = value.find_all('div')
        values = [value.text.lstrip().rstrip() for value in values if value.text.lstrip().rstrip() != '']
        values_corrected = []

        for value in values:
            if ('\n' or '\t') in value:
                value = value.replace('\n', '     ')
                value = value.replace('\t', '     ')
            if '  ' in value:
                values = value.split('  ')
                values_corrected.append(values[0].rstrip().lstrip())
                values_corrected.append(values[-1].rstrip().lstrip())
            else:
                values_corrected.append(value)
        # Occhio a questo 
        section_names[key] = values_corrected
        # Questo codice è indescrivibile persino per me
        

    section_names


    #divs = section_names[0]['Administrative data'].find_all("div")
    #divs 