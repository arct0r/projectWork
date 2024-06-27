import requests as rq
from PyPDF2 import PdfReader
import google.generativeai as genai
import PIL.Image
import os


dossier = rq.get('https://cir-reports.cir-safety.org/view-attachment?id=9862ac6b-8e74-ec11-8943-0022482f06a6')

with open('pdf.pdf', 'wb') as file:
    file.write(dossier.content)
    
ref_pages = []

with open('pdf.pdf', 'rb') as file:
    pdf = PdfReader(file)
    number_of_pages = len(pdf.pages)
    extracted_pages = [p.extract_text() for p in pdf.pages]
    for page in extracted_pages:
        if "LD50" in page or "NOAEL" in page:
            ref_pages.append(page)
    print(len(ref_pages))
    print(ref_pages)

    text_file = open("Prova.txt", "w")
    for testo in ref_pages:
        text_file.write(testo)


'''
    genai.configure(api_key = "AIzaSyDBaM35Zp4FUO0ZDe01OsBpqsTUColrYyw")

    model = genai.GenerativeModel(model_name="gemini-1.5-flash")
    response = model.generate_content(f"Test. Come va?")
    print(response.text)
'''
