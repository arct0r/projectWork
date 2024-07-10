import pubchempy as pcp

results = pcp.get_compounds('Glucose', 'name')

for result in results:
    result.cid