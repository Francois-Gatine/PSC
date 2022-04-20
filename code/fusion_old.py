import os.path
import json
from unionfind import unionfind



# create a dict mapping each value of duplicId to all clusters containing that value
# build a bijective correspondance between clusters and 0,...,num_clusters-1

str2int = {}
int2str = {}

map_duplicId={}
info_dir="C:/Users/franc/Desktop/Test IdRef_2/info/"

num_clusters = 0
num_AG = 0
for AG in os.listdir(info_dir) :

    file = open(info_dir+AG,'r')
    # example AG = 'dad.json'
    AG_info = json.load(file)
    for cluster in AG_info :
        for duplicId in cluster["duplicIds"] :
            if(duplicId!="0"):
                if  not(duplicId in map_duplicId.keys()) :
                    map_duplicId[duplicId]=[]
                map_duplicId[duplicId].append(AG[:3]+str(cluster["id"]))

        str2int[AG[:3]+str(cluster["id"])]=num_clusters
        int2str[num_clusters]=AG[:3]+str(cluster["id"])
        num_clusters +=1
    file.close()
    num_AG+=1
    print(str(num_AG) + "AGs done")


# build the unionfind data structure

u = unionfind(num_clusters)
for duplicId in map_duplicId:
    L=map_duplicId[duplicId]
    for i in range(len(L)):
        for j in range(i):
            u.unite(str2int[L[i]],str2int[L[j]])

print("union find data structure is built")
# generate files

count =0
for eq in u.groups():
    if(len(eq)>1):
        count += 1
    '''
        s=""
        for x in eq:
            s += (int2str[x] + " , ")
        print(s)
    '''
print(count)
num_equiv=0
for equiv_set in u.groups() :
    if len(equiv_set) >1 :

        num_equiv+=1
        # different clusters having the same duplicId

        # getting information
        idRefs=[]
        names=[]

        for i in range(len(equiv_set)) :
            dir = info_dir+int2str[equiv_set[i]][:3]+".json"
            file = open(dir,'r')
            AG = json.load(file)
            cluster = AG[int(int2str[equiv_set[i]][-1])]
            if("idRefs" in cluster):
                idRefs.extend(cluster["idRefs"])
            if("names" in cluster):
                names.append(cluster["name"])
            file.close()
        idRefs = list(dict.fromkeys(idRefs))
        names = list(dict.fromkeys(names))

        print("getting info from "+ str(num_equiv) +" AGs done")

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
                    if("name" in AG[cluster_id]):
                        dict["name"] = AG[cluster_id]["name"]
                    if("idRefs" in AG[cluster_id]):
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
                    dict={}
                    dict["id"] = AG[cluster_id]["id"]
                    copyOfAg.append(dict) ## to ensure that AG[cluster_id] works later!
            file.seek(0)
            json.dump(copyOfAg,file,ensure_ascii=False, indent=4)
            file.truncate()
        print("writing to " + str(num_equiv) +"AGs done")

# cleaning empty json objects

for AG in os.listdir(info_dir) :
    file = open(info_dir+AG,'r+')
    # example AG = 'dad.json'
    AG_info = json.load(file)
    copyOfAg = []
    for cluster in AG_info :
        if(len(cluster.keys())>1) :
            dict={}
            dict["name"]=cluster["name"]
            dict["idRefs"]=cluster["idRefs"]
            copyOfAg.append(dict)
    file.seek(0)
    json.dump(copyOfAg,file,ensure_ascii=False, indent=4)
    file.truncate()
print("cleaning step done")

