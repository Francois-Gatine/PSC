import os.path
import json
from unionfind import unionfind



# create a dict mapping each value of duplicId to all clusters containing that value
# build a bijective correspondance between clusters and 0,...,num_clusters-1

str2int = {}
int2str = {}

map_duplicId={}
info_dir="/home/echarghaoui/github_Aymen/PSC/code/fusion/Info/"

num_clusters = 0
for AG in os.listdir(info_dir) :

        file = open(info_dir+AG,'r')
        # example AG = 'dad.json'
        AG_info = json.load(file)
        for cluster in AG_info :
            for duplicId in cluster["duplicIds"] :
                if not(duplicId in map_duplicId.keys()) :
                    map_duplicId[duplicId]=[]
                map_duplicId[duplicId].append(AG[:3]+str(cluster["id"]))

            str2int[AG[:3]+str(cluster["id"])]=num_clusters
            int2str[num_clusters]=AG[:3]+str(cluster["id"])
            num_clusters +=1
        file.close()




# build the unionfind data structure

u = unionfind(num_clusters)
for duplicId in map_duplicId:
    L=map_duplicId[duplicId]
    for i in range(len(L)):
        for j in range(i):
            u.unite(str2int[L[i]],str2int[L[j]])


# generate files

for equiv_set in u.groups() :
    if len(equiv_set) >1 :
        # different clusters having the same duplicId

        # getting information
        idRefs=[]
        names=[]

        for i in range(len(equiv_set)) :
            dir = info_dir+int2str[equiv_set[i]][:3]+".json"
            file = open(dir,'r')
            AG = json.load(file)
            cluster = AG[int(int2str[equiv_set[i]][-1])]
            idRefs.extend(cluster["idRefs"])
            names.append(cluster["name"])
            file.close()
        idRefs = list(dict.fromkeys(idRefs))
        names = list(dict.fromkeys(names))

        # building the merged info

        visitedAGs = {}

        for i in range(len(equiv_set)):
            dir = info_dir+int2str[equiv_set[i]][:3]+".json"
            file = open(dir,'r+')
            AG = json.load(file)
            copyOfAg = []
            id_count = 0
            for cluster_id in range(len(AG)) :
                if(cluster_id != int(int2str[equiv_set[i]][-1])):
                    dict={}
                    dict["id"] = AG[cluster_id]["id"]
                    dict["name"] = AG[cluster_id]["name"]
                    dict["idRefs"] = list(dict.fromkeys(AG[cluster_id]["idRefs"]))
                    copyOfAg.append(dict)
                elif(not((int2str[equiv_set[i]][:3]) in visitedAGs.keys())):
                    dict={}
                    dict["id"] = AG[cluster_id]["id"]

                    dict["name"] = [names[j] for j in range(len(names)) if int2str[j][:-1]==int2str[equiv_set[i]][:3] ]
                    dict["idRefs"] = list(dict.fromkeys(idRefs))
                    copyOfAg.append(dict)
                    visitedAGs[int2str[equiv_set[i]][:3]]=0
                else :
                    copyOfAg.append({}) ## to ensure that AG[cluster_id] works later!
            file.seek(0)
            json.dump(copyOfAg,file,ensure_ascii=False, indent=4)
            file.truncate()

# cleaning empty json objects

for AG in os.listdir(info_dir) :
    file = open(info_dir+AG,'r+')
    # example AG = 'dad.json'
    AG_info = json.load(file)
    copyOfAg = []
    for cluster in AG_info :
        if(bool(cluster)) :
            dict={}
            dict["name"]=cluster["name"]
            dict["idRefs"]=cluster["idRefs"]
            copyOfAg.append(dict)
    file.seek(0)
    json.dump(copyOfAg,file,ensure_ascii=False, indent=4)
    file.truncate()



