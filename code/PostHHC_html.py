# build html page per cluster right after the execution of HHC (both first and second step)
# each cluster is theoritically representing one author (tough one should apply fusion.py)

from os import listdir
import json
from os.path import isfile

dir = "/home/echarghaoui/github_Aymen/PSC/data/4presentation/PostHHC/"
dir_subfolder =  "clustersOf"

all_clusters =[]
for AG in listdir(dir):
    all_clusters.extend([[AG,file] for file in listdir(dir+AG+"/"+dir_subfolder+AG+"/") if file[-5:]==".json"])

# bulding the html files per cluster

for i in range(len(all_clusters)):
    AG,cluster_last = all_clusters[i]
    cluster = open(dir+AG+"/"+dir_subfolder+AG+"/"+cluster_last)
    cluster = json.load(cluster)
    strTable = "<html><head><style> table, th, td { width: 80%;border: 1px solid black;} </style><title> PostHHC </title></head><table><tr><th>Title</th><th>Venue</th></tr>"
    idRefs=[]
    for AR in cluster:
        strTable += "<tr><td>"+AR["defaultTitle"]+ "</td><td>"+AR["venue"]+"</td></tr>"
        idRefs.append(AR['idRef']['publications'])
        if(len(AR['idRef']['persons'])>0):
            idRefs.extend(AR['idRef']['persons'])
    idRefs = list(dict.fromkeys(idRefs))
    str_idRefs=""
    for id in idRefs:
        if len(id)>0:
            str_idRefs += id + '\n'
    strTable = strTable + "</table><p style="+'"'+"text-align:center;"+'"'+">" + " proviennent du même auteur : " + cluster[0]["author"] + "</p><p> having IdRefs : " + str_idRefs+"</p>"
    # next and previous button
    AGnext, next = all_clusters[(i+1)%len(all_clusters)]
    AGprevious,previous = all_clusters[(i-1)%len(all_clusters)]
    strTable = strTable +  "<a href=" + '"' + 'file://'+dir+AGnext+"/"+dir_subfolder+AGnext+"/"+next[:-5]+".html"+ '"'+ ">next   </a>"+"<a href=" + '"'+'file://'+dir+AGprevious+"/"+dir_subfolder+AGprevious+"/"+previous[:-5]+".html"+ '"' + ">previous</a></html>"
    html = open(dir+AG+"/"+dir_subfolder+AG+"/"+cluster_last[:-5]+".html",'w')
    html.write(strTable)
    html.close()
