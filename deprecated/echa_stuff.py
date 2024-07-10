import streamlit as st
import requests
from bs4 import BeautifulSoup
import re
import streamlit.components.v1 as components
import urllib.parse
import lxml
st.set_page_config(layout="wide")
st.title('ECHA')

def echa_summary2pandas(content):
    'Prettifying the summary'
    # This is the issue https://www.reddit.com/r/learnpython/comments/10mj0mc/beautiful_soup_4_only_returns_the_first_sub_tag/
    soup = BeautifulSoup(content, 'lxml')
    sections = soup.find_all(attrs={"data-cy":'das-block'})
    h3s = soup.find_all('h3')
    #h3s
    #sections
    st.write(len(sections))
    #test = list(soup.select_one('.section-link-list').stripped_strings)
    #test
    pass

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

substance = selection

if selection:
    'Selected Substance: :blue[**'+substance + "**]"

    with st.expander(label='1. First Request. Get rmlID e rmlName'):

        st.code('https://chem.echa.europa.eu/api-substance/v1/substance?pageIndex=1&pageSize=100&searchText='+substance)
        req_0 = requests.get('https://chem.echa.europa.eu/api-substance/v1/substance?pageIndex=1&pageSize=100&searchText='+urllib.parse.quote(substance))
        'La prima cosa da fare è fare una ricerca con il nome della sostanza ma trasformata attraverso urllib'
        req_0_json = req_0.json()
        req_0_json
        rmlId = req_0_json['items'][0]['substanceIndex']['rmlId']
        rmlName= req_0_json['items'][0]['substanceIndex']['rmlName']
        'rmlId: ' + rmlId
        'rmlName: '+rmlName

    with st.expander(label='2. Second Request. Get assetExternalId e rootKey da un dossier'):
        req_1_url = 'https://chem.echa.europa.eu/api-dossier-list/v1/dossier?pageIndex=1&pageSize=100&rmlId=' + rmlId + '&registrationStatuses=Active'
        st.code('https://chem.echa.europa.eu/api-dossier-list/v1/dossier?pageIndex=1&pageSize=100&rmlId=100.244.411&registrationStatuses=Active')
        req_1 = requests.get(req_1_url)
        req_1_json = req_1.json()
        req_1_json
        if req_1_json['items']==[]:
            ':red[No active dossiers. Trying the Inactive ones.]'
            req_1_url = 'https://chem.echa.europa.eu/api-dossier-list/v1/dossier?pageIndex=1&pageSize=100&rmlId=' + rmlId + '&registrationStatuses=Inactive'
            st.code('https://chem.echa.europa.eu/api-dossier-list/v1/dossier?pageIndex=1&pageSize=100&rmlId=100.244.411&registrationStatuses=Active')
            req_1 = requests.get(req_1_url)
            req_1_json = req_1.json()
            req_1_json
            if req_1_json['items']==[]:
                f":red[Haven't found any active or unactive dossiers for '{rmlName}']"
                st.stop()
        else:
            ':green[Found some active dossiers]'
        
        assetExternalId = req_1_json['items'][0]['assetExternalId']
        rootKey = req_1_json['items'][0]['rootKey']
        'assetExternalId: ' +assetExternalId
        'rootKey: ' + rootKey

        ':orange[Qualche accortezza. Non è detto che i dossiers siano attivi. Per esempio se cercate "Isooctane" non avrete dossiers attivi ma solo inattivi]'
        'Servirà settare lo status nella richiesta come "Inactive"'
        'https://chem.echa.europa.eu/api-dossier-list/v1/dossier?pageIndex=1&pageSize=100&rmlId=100.043.495&registrationStatuses=Inactive'


    with st.expander(label='3. Third Request'):
        "Con l'assetExternalId è possibile arrivare alla pagina principale del dossier."
        st.code('https://chem.echa.europa.eu/html-pages/3bbf1ca2-c4c6-4dfd-a388-683f7d96f14b/index.html')
        "Da questa pagina bisogna scrappare l'ID del riassunto tossicologico, :red[**SE ESISTE**]"
        req_2 = requests.get('https://chem.echa.europa.eu/html-pages/' + assetExternalId + '/index.html')
        index = BeautifulSoup(req_2.text, 'html.parser')
        index.prettify()

    with st.expander(label="4. Recuperare un altro ID dall'index.html"):
        "In tutto quell'HTML ci interessa solo un div. BeautifulSoup ha problemi se ci sono troppi div innestati. Quindi uso una combinazione di quello e di Regex"
        st.code('''
            <div class="collapse" id="id_7_Toxicologicalinformation">
            <ul>
            <ul>
            <li class="das-leaf_parent">
            <a class="das-leaf das-docid-IUC5-276f7bd6-a119-480a-b589-a5c64d1203bc_1c7aefbf-3d23-4505-af5b-be691bca38fb" href="IUC5-276f7bd6-a119-480a-b589-a5c64d1203bc_1c7aefbf-3d23-4505-af5b-be691bca38fb" rel="host">
            <div class="das-link-content">
            <i class="das-has-tooltip icon icon-item icon-ENDPOINT_SUMMARY icon-document-summary" data-dastttxt="Endpoint summary"></i>
            <span class="das-has-tooltip" data-dastttxt="S-01 | Toxicological information Summary (DN(M)ELs)">
                                                S-01 | Toxicological information Summary (DN(M)ELs)
                                                </span>
            </div>''')
        div = index.find_all("div", id = ['id_7_Toxicologicalinformation'])
        str_div = str(div)
        str_div = str_div.split('</div>')[0]
        #str_div
        print(type(re.search('href="([^"]+)"', str_div)).__name__)
        if type(re.search('href="([^"]+)"', str_div)).__name__ == 'NoneType':
            ":red[Haven't found any toxicological summary for the given substance.]"
            st.stop()
        UIC = re.search('href="([^"]+)"', str_div).group(1)
        'IUC: \n'
        UIC
        #

    #index

    with st.expander(label="5. Recuperare l'html del  riassunto tossicologico"):
        st.code("'https://chem.echa.europa.eu/html-pages/'+ assetExternalId + '/documents/' + UIC + '.html'")
        final_url = 'https://chem.echa.europa.eu/html-pages/'+ assetExternalId + '/documents/' + UIC + '.html'
        final_url
        tox_summ_html = requests.get(final_url).content
        echa_summary2pandas(tox_summ_html)


    if final_url:
        with st.expander(label='Tox Summary'):
            st.components.v1.iframe(final_url, height=15000)

with st.expander(label=':red[**Problematica attuale**]'):
    "Questi dossiers sono pieni zeppi di NOAEL, NOAEC, DNEL e via dicendo. In altri dossier è ancora presente l'LD50."
    "Il problema di fondo è che :red[**prendere i valori isolati senza il contesto degli studi è inutile.**] \n "
    "Lascio i link ai riassunti così come sono? Includo la pagina html nel documento così come è ora?"




