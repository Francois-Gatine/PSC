# build html webpage to visualize the contents of a sample of publications.json

import json

dir = "/home/echarghaoui/github_Aymen/PSC/data/4presentation/"
file = "publications.json"

# List of all citation records present in the file

publications = open(dir+file)
CRs = json.load(publications)

# building the html page
# one html page for all citation records

strTable = "<html><head><style> table, th, td {border: 1px solid black;border-collapse: collapse;}</style><title> a sample of citation records </title></head><body><h1> a sample of citation records </h1><table><tr><th>Title</th><th>Authors</th><th>Venue</th></tr>"
for i in range(len(CRs)):
    authors = ""
    for author in CRs[i]['authors']:
        authors+=author["fullName"] + " "+author["person"]+'\n'
    strTable += "<tr><td>"+CRs[i]['title']['default']+"</td><td>"+authors+"</td><td>"+CRs[i]['source']['title']+"</td></tr>"
strTable += "</table></body></html>"
html = open(dir+"publications.html",'w')
html.write(strTable)
html.close()
publications.close()

