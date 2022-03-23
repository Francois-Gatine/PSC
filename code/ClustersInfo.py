import ujson,json_stream,re
import unicodedata
import os.path

'''
Entry : all clusters in all ambiguous groups.
Data structure : "Ags" folder containing ambiguous groups, that is, folders containing the clusters in that group.
Ensures : for all clusters, create an "info" document that stores IdRefs and duplicIds in the cluster
'''


#FILE DIRECTORIES
#agsDir = "C:/Users/franc/Documents/Polytechnique/2A/PSC/Code/ClustersInfo/AGs"
agsDir = "/AGs"
#infoDir = "C:/Users/franc/Documents/Polytechnique/2A/PSC/Code/ClustersInfo/info"
infoDir = "/Info"



def joinPath(p1, p2):
    return p1 + "/" + p2


#Group by group
for agName in os.listdir(agsDir):

    #Get AG folder
    agFolder = joinPath(agsDir, agName)

    #open corresponding info
    #one file per ambiguous group (AG)
    infoName = joinPath(infoDir, agName)
    info = open(infoName + ".json", 'a')
    infoList = []

    #create an ID for each cluster
    clusterId = 0

    #Iterate through the clusters in that group
    for clusterName in os.listdir(agFolder):

        #open cluster
        cluster = open(joinPath(agFolder, clusterName))
        clusterStream = json_stream.load(cluster)


        idRefList = []
        #dictionnary {duplicId : [AGs]}
        duplicIdList = {}


        for AR in clusterStream:

            #add the idRefs of that AR to the info
            idRef = AR['idRef']


            id1 = idRef['publications']
            if(not (id1 in idRefList)):
                idRefList.append(id1)

            for id in idRef['persons']:
                if(not (id in idRefList)):
                    idRefList.append(id)


            #add the duplicId of that AR to the info
            duplicId = AR['duplicId']

            id = duplicId['duplicId']
            AGs = duplicId['AGs']

            #add entries to the dictionary without repetition
            classifiedAGs = duplicIdList.get(id)

            if(classifiedAGs == None):
                duplicIdList[id] = []
                for ag in AGs:
                    if(not (ag in duplicIdList.get(id))):
                        duplicIdList.get(id).append(ag)
            else:
                for ag in AGs:
                    if(not (ag in classifiedAGs)):
                        classifiedAGs.append(ag)

        dict = {'id' : clusterId , 'name' : clusterName , 'idRefs' : idRefList ,'duplicIds' : duplicIdList}
        print(dict)


        #adds the cluster info to the list
        infoList.append(dict)

        cluster.close()

        clusterId += 1


    #dumps the list in the info file
    ujson.dump(infoList,info,ensure_ascii=False, indent=4)



    info.close()






















