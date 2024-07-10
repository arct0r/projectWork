import streamlit as st
import requests
from bs4 import BeautifulSoup
import streamlit.components.v1 as components
import urllib.parse
import lxml
from pages.echa_summary import echa_pandas
import re as standardre


# Lista delle sostanza testate
substances = [
'Carbamic acid ester',
'Isooctane',
'Cyanoguanidine',
'Propyl acetate', # Da sta sostanza si può notare come il sito dell'ECHA sia molto piu' aggiornato dei dati da 10gb
'AZODICARBOXYLIC DIMORPHOLIDE', # Sostanza senza dossiers attivi. Ne ha uno inattivo ma è vecchissimo e con status 'No longer valid'.
'(-) Vince Lactam', #Sostanza con un dossier attivo ma senza riassunti tossicologici.
'(+)-tartaric acid' #Active dossiers. Summary tossicologico senza NOAEL. 
                                #Acute toxicity con LD50. Al momento non va per la conversione del testo.
]

selection = st.selectbox('Substance test', options=substances, index=None)


def search_dossier(substance):
        # Prima parte. Ottengo rmlID e rmlName
        #st.code('https://chem.echa.europa.eu/api-substance/v1/substance?pageIndex=1&pageSize=100&searchText='+substance)
        req_0 = requests.get('https://chem.echa.europa.eu/api-substance/v1/substance?pageIndex=1&pageSize=100&searchText='+urllib.parse.quote(substance))
        #'La prima cosa da fare è fare una ricerca con il nome della sostanza ma trasformata attraverso urllib'
        req_0_json = req_0.json()
        #req_0_json
        rmlId = req_0_json['items'][0]['substanceIndex']['rmlId']
        rmlName= req_0_json['items'][0]['substanceIndex']['rmlName']
        #'rmlId: ' + rmlId
        #'rmlName: '+rmlName

        # Seconda parte. Ottengo assetExternalId e rootKey
        req_1_url = 'https://chem.echa.europa.eu/api-dossier-list/v1/dossier?pageIndex=1&pageSize=100&rmlId=' + rmlId + '&registrationStatuses=Active'
        #st.code('https://chem.echa.europa.eu/api-dossier-list/v1/dossier?pageIndex=1&pageSize=100&rmlId=100.244.411&registrationStatuses=Active')
        req_1 = requests.get(req_1_url)
        req_1_json = req_1.json()
        #req_1_json
        if req_1_json['items']==[]:
            #':red[No active dossiers. Trying the Inactive ones.]'
            req_1_url = 'https://chem.echa.europa.eu/api-dossier-list/v1/dossier?pageIndex=1&pageSize=100&rmlId=' + rmlId + '&registrationStatuses=Inactive'
            #st.code('https://chem.echa.europa.eu/api-dossier-list/v1/dossier?pageIndex=1&pageSize=100&rmlId=100.244.411&registrationStatuses=Active')
            req_1 = requests.get(req_1_url)
            req_1_json = req_1.json()
            #req_1_json
            if req_1_json['items']==[]:
                f":red[Non ho trovato nessun dossier attivo per '{rmlName}'. Cerco tra quelli inattivi]"
                return False
                st.stop()
            else:
               f":green[Ho trovato dei dossiers inattivi per '{rmlName}']"
        else:
            ':green[Ho trovato dei dossiers attivi!]'
        
        assetExternalId = req_1_json['items'][0]['assetExternalId']
        rootKey = req_1_json['items'][0]['rootKey']
        #'assetExternalId: ' +assetExternalId
        #'rootKey: ' + rootKey

        #':orange[Qualche accortezza. Non è detto che i dossiers siano attivi. Per esempio se cercate "Isooctane" non avrete dossiers attivi ma solo inattivi]'
        #'Servirà settare lo status nella richiesta come "Inactive"'
        #'https://chem.echa.europa.eu/api-dossier-list/v1/dossier?pageIndex=1&pageSize=100&rmlId=100.043.495&registrationStatuses=Inactive'


        # Terza parte. Ottengo assetExternalId 
        #"Con l'assetExternalId è possibile arrivare alla pagina principale del dossier."
        #"Da questa pagina bisogna scrappare l'ID del riassunto tossicologico, :red[**SE ESISTE**]"
        req_2 = requests.get('https://chem.echa.europa.eu/html-pages/' + assetExternalId + '/index.html')
        index = BeautifulSoup(req_2.text, 'html.parser')
        index.prettify()

        # Quarta parte. Ottengo l'ID del riassunto tossicologico dall'index.html
        #"In tutto quell'HTML ci interessa solo un div. BeautifulSoup ha problemi se ci sono troppi div innestati. Quindi uso una combinazione di quello e di Regex"

        div = index.find_all("div", id = ['id_7_Toxicologicalinformation'])
        str_div = str(div)
        str_div = str_div.split('</div>')[0]

        #print(type(re.search('href="([^"]+)"', str_div)).__name__)
        if type(standardre.search('href="([^"]+)"', str_div)).__name__ == 'NoneType':
            ":red[Haven't found any toxicological summary for the given substance.]"
            return False
            st.stop()

        UIC = standardre.search('href="([^"]+)"', str_div).group(1)
        #'IUC: \n'
        #UIC
        #

    #index

        # Quinta parte. Recupero l'html del dossier tossicologico e faccio ritornare il content
        #st.code("'https://chem.echa.europa.eu/html-pages/'+ assetExternalId + '/documents/' + UIC + '.html'")
        final_url = 'https://chem.echa.europa.eu/html-pages/'+ assetExternalId + '/documents/' + UIC + '.html'
        #final_url
                
        if final_url:
            return final_url
        else:
            return False

if selection:
    substance = selection
    final_url = search_dossier(substance)
    if final_url:
        st.page_link(label='Riassunto tossicologico completo sul sito ECHA', page=final_url)
        summary_content = requests.get(final_url).text
        echa_pandas(summary_content)






