# build html webpage to visualize the contents of a sample of publications.json

import json

dir = "/home/echarghaoui/github_Aymen/PSC/data/4presentation/"
file_pub = "publications.json"
file_pers = "persons.json"

# List of all citation records present in the file

publications = open(dir+file_pub)
CRs = json.load(publications)

persons = open(dir+file_pers)
by_authors = json.load(persons)

# getting all idRefs from persons and storing them in a dictionary

name2id = {}
for author in by_authors:
    if not(author["fullName"] in name2id):
        name2id[author["fullName"]] = []
    name2id[author["fullName"]].append(author["id"])


# building the html page
# one html page for all citation records

strTable = "<html><head><style> table, th, td {border: 1px solid black;border-collapse: collapse;}</style><title> a sample of citation records </title></head><body><h1> a sample of citation records </h1><table><tr><th>Title</th><th>Authors</th><th>Venue</th></tr>"
for i in range(len(CRs)):
    authors = ""
    for author in CRs[i]['authors']:
        if author["person"] != "":
            id = author["person"]
        elif author["fullName"] in name2id:
            id = name2id[author["fullName"]][0]
        else :
            id=""
        authors+=author["fullName"] + " "+id+'\n'
    strTable += "<tr><td>"+CRs[i]['title']['default']+"</td><td>"+authors+"</td><td>"+CRs[i]['source']['title']+"</td></tr>"
strTable += "</table></body></html>"
html = open(dir+"publications.html",'w')
html.write(strTable)
html.close()
publications.close()

