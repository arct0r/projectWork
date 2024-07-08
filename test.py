import requests as rq
import PyPDF2 
import google.generativeai as genai
import PIL.Image
import os
import re
from io import BytesIO 

'''
if os.path.exists(pdf_path):
    os.remove(pdf_path)
'''

def get_pdf_content(url):
    dossier = rq.get(url)
    contenuto_byte = dossier.content
    pdf_conv = BytesIO(contenuto_byte)
    pdf = PyPDF2.PdfReader(pdf_conv)      
    #number_of_pages = len(pdf.pages)
    extracted_pages = [p.extract_text() for p in pdf.pages]

    dossier_text= ''
    keywords = r"\b(LD50|NOAEL|LD50s|LD 50)\b"  # Combine keywords with word boundaries

    for page in extracted_pages:
        for match in re.finditer(keywords, page):
            start_index = max(0, match.start() - 250)  # Ensure start doesn't go negative
            end_index = min(len(page), match.end() + 250)  # Ensure end doesn't exceed length
            snippet = page[start_index:end_index]
            dossier_text += snippet.replace('\n',' ')

    return dossier_text

'''
with open('dossier.pdf', 'rb') as file:
    pdf = PdfReader(file)
    number_of_pages = len(pdf.pages)
    extracted_pages = [p.extract_text() for p in pdf.pages]
    for page in extracted-_pages:
        if "LD50" in page or "NOAEL" in page or "LD50s" in page or "LD 50" in page:
            ref_pages.append(page)
    print(len(ref_pages))
    print(ref_pages)

    
if os.path.exists(txt_path):
    os.remove(txt_path)
with open("dossier.txt", "w") as text:
    for testo in dossier_text:
        text.write(testo)


    genai.configure(api_key = "AIzaSyDBaM35Zp4FUO0ZDe01OsBpqsTUColrYyw")

    model = genai.GenerativeModel(model_name="gemini-1.5-flash")
    response = model.generate_content(f"Test. Come va?")
    print(response.text)
'''

