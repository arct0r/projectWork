# ToxF!nder
## Per eseguire il programma:
per eseguire il programma in locale:
installa i requirements ed esegui

`streamlit run PubChem.py`

Da remoto: [toxicity.streamlit.app](https://toxicity.streamlit.app/)

## Pagine dell'app 
### PubChem
- ***Funziona sempre.***
- Ricerca in locale
  - Effettua query con DuckDB ad un csv (convertito da json) con numerevoli valori LD50. Risulta instantaneo.
- Ricerca in rete
  - Effettua Request a PubChem. Dato il nome di una sostanza ne ottiene una tabella con i vari LD50. Non instantaneo ma neanche lento.


### ECHA
- ***Se esiste un dossier tossicologico funziona quasi sempre. Ogni tanto potrebbe avere qualche problema di formattazione del testo o della tabella. In fondo al README è presenta una lista delle sostanze testate.***
  
In qualche modo *complicato* recupera un dossier attivo (o inattivo) dal sito dell'ECHA e, in un modo ancora piu' complicato, ne estrae il riassunto tossicologico e l'acute toxicity.
**Ottenere le tabelle dai riassunti tossicologici dall'html del dossier si è rivelato un incubo.**

### CIR
- ***A causa della fonte estremamente lenta e delle allucinazioni di Gemini il CIR risulta il meno affidabile.***

Data una sostanza verifica se esista un dossier sul sito del CIR. Se esiste ne estrae le pagine dal pdf e cerca i valori LD50 / NOAEL. Queste pagine le fa interpretare da Gemini.

*nota: Gemini non funziona in locale perchè richiede IP non italiano*


## Struttura dei file:
- `PubChem.py` Pagina iniziale per PubChem
- `.pages/Echa.py` Pagina dell'ECHA
- `.pages/CIR.py` Pagina del CIR
- `echa_summary.py` funzioni per creare delle tabelle dato un dossier tossicologico echa
- `echa_find.py` funzioni per recuperare il sito del dossier tossicologico echa
- `pubchem.json` file dal quale abbiamo estratto l'HSDB.csv
- `cir-reports.csv` database delle sostanze inci
- `HSDB.csv` database di PubChem in locale

## Sostanze Testate per l'ECHA:

✅: Funziona
🆗: Funziona ma non perfettamente
❌: Non funziona

- ✅ **'Isooctane'** 
- ✅ **'Carbamic acid ester'**
- ✅ **'Cyanoguanidine'** 
- 🆗 **'Propyl acetate'** Formattazione problematica
- ✅ **'AZODICARBOXYLIC DIMORPHOLIDE'**
- ✅ **'(-) Vince Lactam'** 
- ✅ **'(+)-tartaric acid'**
- 🆗 **'(+)-bornan-2-one'** Formattazione problematica
- ✅ **'(+/-)-cis-3-acetoxy-4-phenylazetidine-2-one [BMS 183040-01]'** 
- ✅ **'( 4-hydroxystyrene, 4-t butoxy styrene and 2,5-dimethyl -2.5-diacryloxyhexane) copolymer'**
- ✅ **'Methyl chloroformate'**
- ✅ **'Hydrolyzed Quinoa'**
- ✅ **'(±)-neomenthol'**
- ✅ **'L-Aspartic acid, N,N'-1,2-ethanediylbis-'**
- ✅ **'Benzene, 2,4-dibromo-1-(dimethoxymethyl)-'**
- 🆗 **'Chlorine dioxide'** Formattazione problematica
- ✅ **'Phenethyl salicylate'** 
- ✅ **'Hydrocarbons, C10-C13, n-alkanes'**
- ✅ **'Decanenitrile'** 
- ✅ **'(+)-menthol'** 
- ✅ **'(+)-neomenthol'** 
- ✅ **'Hydrocarbons, C3'** 
- ✅ **'Ethanol, 1-ethoxy-2,2-difluoro-'** 
- ✅ **'Butyl butyrate'** 
- ✅ **'Aluminum cesium fluoride'** 
- ✅ **'Betamethasone'** 
- 🆗 **'Citral'**  Formattazione problematica
- ✅ **'L-menthan-3-one '**



