import streamlit as st
import zipfile
from bs4 import BeautifulSoup
import lxml.etree as etree
import xmltodict
import pprint
import json
import streamlit.components.v1 as components


def transform_xml_with_xsl(xml_file, xsl_file):
    # Legge il contenuto del file XML
    with open(xml_file, 'rb') as f:
        xml_content = f.read()

    # Legge il contenuto del file XSL
    with open(xsl_file, 'rb') as f:
        xsl_content = f.read()

    # Parsea il contenuto XML e XSL
    xml_doc = etree.XML(xml_content)
    xsl_doc = etree.XML(xsl_content)

    # Crea un trasformator XSLT
    transform = etree.XSLT(xsl_doc)

    # Applica la trasformazione
    result = transform(xml_doc)

    # Stampa l'output trasformato
    print(str(result))

    # Se si vuole salvare l'output su un file
    with open('output.html', 'wb') as f:
        f.write(etree.tostring(result, pretty_print=True, encoding='UTF-8'))

'Testing NOAEL and NOAC extraction from an i6z file'

with zipfile.ZipFile('32c89044-3a73-48cf-b60c-81f746554bff.i6z', 'r') as zip_ref:
    zip_ref.extractall('extractedi6z/')
    st.write('Succesfully extracted the i6z file.')


with open('.\extractedi6z\manifest.xml', 'r') as manifest:
    data = manifest.read()
    bs_data = BeautifulSoup(data)
    bs_data.prettify()
    documents = bs_data.find_all('document')
    tags_content = [a.find_all({'subtype':'DataTox', 'name':''}) for a in documents]
    DataTox_content = [b for b in tags_content if 'DataTox' in b[0]][0]
    DataTox_content
    DataTox_content_link = DataTox_content[1]
    DataTox_content_link = DataTox_content_link.attrs['xlink:href']
    DataTox_content_link
# DataTox data link is extracted. Now we open it.

# Opening XML file with beautifulsoup.
with open(f".\extractedi6z\{DataTox_content_link}", 'r') as DataTox_i6d:
    DataTox_i6d_content = DataTox_i6d.read()
    DataTox_xml = BeautifulSoup(DataTox_i6d_content, 'lxml')
    print(DataTox_xml.prettify())
    pp = pprint.PrettyPrinter(indent=4)
    c = xmltodict.parse(DataTox_i6d_content)
    # Ho trasformato l'xml in un mega dizionario, una specie di Json. 
    useful_stuff = c['i6c:Document']['i6c:Content']['ENDPOINT_SUMMARY.DataTox']
    useful_stuff
    print(useful_stuff)
    # Da questo idealmente vorrei creare una tabella.

# Ora facciamo lo stesso con l'xsl
with open(f".\extractedi6z\ENDPOINT_SUMMARY-DataTox.xsl", 'r') as DataTox_xsl:
    DataTox_xsl_content = DataTox_xsl.read()
    d = xmltodict.parse(DataTox_xsl_content)
    # Ho trasformato l'xml in un mega dizionario, una specie di Json. 
    useful_stuff = d['xsl:stylesheet']['xsl:template']
