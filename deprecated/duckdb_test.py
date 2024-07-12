import streamlit as st
import duckdb
import json
import pandas as pd 


# Questi metodi mi servono per trasformare un JSON immenso in un csv ben formattato.

# Load the JSON file
with open('pubchem.json', 'r') as file:
    data = json.load(file)

# Trasformo il json in dizionario
substances = []
for annotation in data['Annotations']['Annotation']:
    for item in annotation['Data']:
        substances.append({
            'Name': annotation['Name'],
            'Measure': 'LD50',
            'Toxicity': ' '.join(item['Value']['StringWithMarkup'][0]['String'].split()[1:]),
            'Reference': item.get('Reference', [None])[0]
        })

# Converto il dizionario in un dataframe
df = pd.DataFrame(substances)
df

# Lo salvo in locale
df.to_csv('HSDB.csv')

# Mi connetto con duckdb
conn = duckdb.connect(':memory:')

# Creo una table con un select di duckdb
conn.execute("CREATE TABLE substances AS SELECT * FROM read_csv_auto('HSDB.csv')")

# Prendo i primi 10 risultati
result = conn.execute("SELECT * FROM substances LIMIT 10").df()
result = result.drop(['column0'], axis=1)

# Formatto un po' meglio il risultato
result = result.rename(columns={
    'column1': 'Name',
    'column2': 'Measure',
    'column3': 'Toxicity',
    'column4': 'Reference',
})
result = result.tail(-1)
result

