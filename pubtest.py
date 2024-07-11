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

c1,c2,c3 = st.columns(3)
with c2:
    st.image('images\pubchem.png', width =200)
value = st_keyup("Inserisci il nome o le iniziali della sostanza", key='' )

# Notice that value updates after every key press
pubchem_csv = pd.read_csv('pubchem.csv')
tall_table = st.checkbox('Riduci altezza tabella')
val = 300 if not tall_table else 100
pubchem_subs = st.dataframe(pubchem_csv[pubchem_csv['substances'].str.contains(value, case=False, na=False)]['substances'], height=val, use_container_width=True, on_select="rerun", selection_mode="multi-row",hide_index=True)

df_select = pubchem_subs.selection.rows


if df_select:
    for i in df_select[:4]:
            st.subheader(pubchem_csv['substances'].iloc[i])
            cid = pubchem_csv['cid'].iloc[i]
            acuteTox, summaryLink = pubchem_stuff(cid)
            st.page_link(label=':blue[**Link del riassunto completo**]',page=summaryLink)
            st.dataframe(acuteTox, hide_index=True)
            st.divider()