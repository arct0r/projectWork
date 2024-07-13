import streamlit as st 
import pandas as pd
from pages.Echa import echa_df
from echa_find import search_dossier
import time
import uuid
import requests as rq
import random
from echa_summary import echa_pandas

start_scraping = st.button('Start scraping')
try:
    scraped_substances = pd.read_csv('scraped_substances.csv')
except:
    scraped_substances = pd.DataFrame({'Scraped Substances':[], 'ToxSummFilename':[]})
scraped_substances

total = len(echa_df)
st.write(total)
parts = [i for i in range(0,total,500)]
parts.append(parts[-1]+(total-parts[-1]-1))
parts
# Essendo tante sostanze devo dividere il ciclo in varie parti.

echa_pandas
if start_scraping:
    scraped = 0
    with st.spinner('Scraping'):
        for i in range(len(echa_df)):
            counter = i
            substance = echa_df['Substance'].iloc[i]
            check = scraped_substances[scraped_substances['Scraped Substances']==substance]
            if check.empty:
                try:
                    link = search_dossier(substance)
                    if link:
                        st.page_link(label=f"{substance} dossier tossicologico", page=link)
                        html_summ = rq.get(link).text
                        html_summ_uuid = uuid.uuid4()
                        html_summ_file = open(f'echa_scraping/{html_summ_uuid}.html', 'w')
                        html_summ_file.write(html_summ)
                        scraped_substances = scraped_substances._append({'Scraped Substances':substance, 'ToxSummFilename':html_summ_uuid}, ignore_index=True)
                        html_summ_file.close()
                        print(f"I have created the file for: {substance}. UUID is: {html_summ_uuid}")
                        f"I have created the file for: {substance}. UUID is: {html_summ_uuid}"
                        scraped += 1
                    time.sleep(random.uniform(0.1, 0.5))
                except:
                    print(f'Something went wrong with {substance}')
            else:
                print(f'{substance} already scraped. Moving on.')

    f"Scraped {scraped} substances"
    scraped_substances
    scraped_substances.to_csv('scraped_substances.csv', index=False)


#uuid = 'd6a8edf0-a69b-4c1c-a603-1427706e8892'
#test_file = open(f'echa_scraping/{uuid}.html', 'r').read()
#echa_pandas(test_file)