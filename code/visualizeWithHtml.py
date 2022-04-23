import csv

'''
input :
        le fichier results est un csv de la forme contenant plusieurs lignes de la forme :
        Resveratrol-Linoleate protects from exacerbated endothelial permeability via a  drastic inhibition of the MMP-9 activity, Bioscience Reports,idref177207914,Thierry Durand

        il n'est pas nécessaire que les articles du même auteur se succèdent

        vérifier que le fichier results ne contient pas de ligne vide, sinon erreur


output :
        autant de fichiers html que d'auteurs présents dans le fichier results ayant au moins deux articles. Les auteurs à un article sont ignorés.
'''


dir = "/home/echarghaoui/2A/"
results = "articles.csv"
# getting information from input file
articles={}
authors=[]
file = open(dir+results)
reader = csv.reader(file)
for article in reader:

    if(article[-1] in articles):
        articles[article[-1]].append(article[:3].copy())
    else :
        articles[article[-1]]=[article[:3].copy()]
        authors.append(article[-1])
# articles ready


# bulding the html files avec index des auteurs

for i in range(len(authors)):
    author = authors[i]
    if(len(articles[author])>1) :
        strTable = "<html><style> table, th, td { width: 80%;border: 1px solid black;} </style><table><tr><th>Titre de l'article</th><th>Revue</th><th>IdRef</th></tr>"
        for article in articles[author]:
            row = "<tr><td>"+article[0]+ "</td><td>"+article[1]+"</td><td>"+article[2]+"</td></tr>"
            strTable = strTable + row
        strTable = strTable + "</table><p style="+'"'+"text-align:center;"+'"'+">" + " proviennent du même auteur : " + author + "</p>"
        # next and previous button
        next = authors[(i+1)%len(authors)]
        previous = authors[(i-1)%len(authors)]
        strTable = strTable +  "<a href=" + '"' + 'file://'+dir+next+".html"+ '"'+ ">next   </a>"+"<a href=" + '"'+'file://'+dir+previous+".html"+ '"' + ">previous</a></html>"
        print("<a href=" + dir+next+ ">next   </a>"+"<a href=" + dir+previous+ ">previous</a></html>" )
        html = open(dir+author+".html",'w')
        html.write(strTable)
        html.close()
