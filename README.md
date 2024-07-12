# ToxF!nder
## Per eseguire il programma:
per eseguire il programma in locale:
installa i requirements ed esegui
streamlit run PubChem.py
Da remoto: toxicity.streamlit.app

## Sezioni 
### PubChem
- Locale
- Non locale

### ECHA
- Funziona.
Intercetto attraverso le requests le pagine del dossier
è stata la parte piu' complicata del progetto.
**Ottenere le tabelle dai riassunti tossicologici è stato un incubo**

### CIR
pdf, trova le pagine con ld50 / noael, le passa a gemini
nota: Gemini non funziona in locale perchè richiede IP non italiano

## Struttura dei file:
- `PubChem.py`
- pubtest.py


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



