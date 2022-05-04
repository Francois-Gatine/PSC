# build html webpage per AG
# the input files are those just after the execution of preprocessing

from os import listdir
import json
from os.path import isfile

dir = "/home/echarghaoui/github_Aymen/PSC/data/4presentation/PostPreProcessing/"
dir_subfolder =  dir+"html_files/"
dir_PostHHC = "/home/echarghaoui/github_Aymen/PSC/data/4presentation/PostHHC/jga/clustersOfjga/0authorshipRecordCluster.html"
files = [ file for file in listdir(dir) if isfile(dir+file)]


for i in range(len(files)):
    file = files[i]
    AG_file = open(dir+file)
    AG = json.load(AG_file)
    strTable = "<html><head><style> table, th, td {border: 1px solid black;border-collapse: collapse;}</style><title> PostPreprocessing </title></head><body><h1> Ambiguous Group : "+file+ "</h1><table><tr><th>Author name</th><th>idRef from persons.json</th><th>idRef from publications.json</th><th>Coauthors</th><th>Title of the publication</th><th>venue</th><th>duplicId</th></tr>"
    for AR in AG:
        coauthors=""
        for coauthor in AR['coauthors']:
            coauthors += coauthor + '\n'
        idPersons=""
        for idPerson in AR['idRef']['persons']:
            idPersons += idPerson + '\n'
        strTable += "<tr><td>"+AR['author']+"</td><td>"+idPersons+"</td><td>"+AR['idRef']['publications']+"</td><td>"+ coauthors+"</td><td>"+ AR["defaultTitle"]+"</td><td>"+ AR['venue'] +"</td><td>"+ str(AR['duplicId']['duplicId'])+"</td></tr>"
    strTable += "</table>"
    # next and previous button
    next = files[(i+1)%len(files)][:-5]
    previous = files[(i-1)%len(files)][:-5]
    strTable +=  "<a href=" + '"' + 'file://'+dir_subfolder+next+".html"+ '"'+ ">next   </a>"+"<a href=" + '"'+'file://'+dir_subfolder+previous+".html"+ '"' + ">previous</a>"+"<a href=" + '"'+'file://'+dir_PostHHC+ '"' + ">"+"   Next Step : HHC</a>"+"</html>"
    html = open(dir_subfolder+file[:-5]+".html",'w')
    html.write(strTable)
    html.close()
    AG_file.close()
