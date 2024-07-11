import streamlit as st
from st_keyup import st_keyup
import pandas as pd
import requests as rq
from io import BytesIO

def pubchem_stuff(cid):
            SummaryLink = f"https://pubchem.ncbi.nlm.nih.gov/compound/{cid}#section=Toxicity"
            csv_link = "https://pubchem.ncbi.nlm.nih.gov/sdq/sdqagent.cgi?infmt=json&outfmt=csv&query={%22download%22:%22*%22,%22collection%22:%22chemidplus%22,%22order%22:[%22relevancescore,desc%22],%22start%22:1,%22limit%22:10000000,%22downloadfilename%22:%22pubchem_cid_QUACK_chemidplus%22,%22where%22:{%22ands%22:[{%22cid%22:%22QUACK%22}]}}"
            csv_link = csv_link.replace('QUACK', str(cid))
            csv = rq.get(csv_link)
            csv_byte = csv.content
            csv = BytesIO(csv_byte)
            csv_df = pd.read_csv(csv, sep=',')
            return [csv_df, SummaryLink]
