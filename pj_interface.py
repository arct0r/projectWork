import streamlit as st

st.title('Substance Searcher (sample name)')

substance = st.text_input("Inserisci il nome della sostanza che vuoi cercare:")
st.write("Attempting to search: ", substance)

