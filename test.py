import requests as rq
from PyPDF2 import PdfReader


dossier = rq.get('https://cir-reports.cir-safety.org/view-attachment?id=9862ac6b-8e74-ec11-8943-0022482f06a6')

with open('pdf.pdf', 'wb') as file:
    file.write(dossier.content)

with open('pdf.pdf', 'rb') as file:
    pdf = PdfReader(file)
    page = pdf.pages[1]
    print(page.extract_text())