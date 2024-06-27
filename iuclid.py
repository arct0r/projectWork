#! python3 - getQuantitiesfromIUCLID6.py
# Connect to IUCLID6 REST API and collect all quantity information of specific substance files,
# print it in a txt file.

import os
import re
import json
import requests
from requests.auth import HTTPBasicAuth


user = 'SuperUser'
password = 'root'

s_REST_API = 'http://localhost:8080/iuclid6-ext/api/ext/v1/'
response1 = requests.get(s_REST_API)
j_resp = json.loads(response1.text)
print(response1)