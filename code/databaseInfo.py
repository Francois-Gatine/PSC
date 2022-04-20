import ujson,json_stream,re
import unicodedata
import os.path

'''
Entry : cluster info files (one per ambiguous group)
Output : "pure" infos to be fed into the database
Data structure : same as cluster info files, in "dbInfo" folder
'''

infoDir = "C:/Users/franc/Desktop/Test IdRef_2/info"
#infoDir = "/Info"

dbInfoDir = "C:/Users/franc/Desktop/Test IdRef_2/dbInfo"
#dbInfoDir = "/dbInfo"


def joinPath(p1, p2):
    return p1 + "/" + p2


#Group by group
for agName in os.listdir(infoDir):

    #get all file names, input and output
    infoFile = joinPath(infoDir, agName)
    dbInfoFile = joinPath(dbInfoDir, agName)

    outputList = []

    #open files and streams
    input = open(infoFile)
    infoStream = json_stream.load(input)

    output = open(dbInfoFile, 'a')


    for cluster in infoStream :

        #Id = cluster['id']

        NameStream = cluster['name']
        Name = ""

        if(isinstance(NameStream, str)):
            Name = NameStream
        else:
            NameList = []
            for x in NameStream :
                NameList.append(x)
            Name = str(NameList)


        #idRefs
        idRefSet = set()

        #transient streaming json list
        #we find its length by hand
        idRefStream = cluster['idRefs']
        l = 0

        for x in idRefStream :
            l += 1
            if(x != ""):
                idRefSet.add(x)
            else:
                idRefSet.add('empty')
            #print(x)
        #print(idRefList)
        #print(l)


        '''
        #IdRef implementation v1 :
        #five fields for IdRef, and one "remain" field if there are more

        IdRef1 = "none"
        IdRef2 = "none"
        IdRef3 = "none"
        IdRef4 = "none"
        IdRef5 = "none"
        Remain = []

        if l>= 1 :
            IdRef1 = idRefList[0]
            if l>=2 :
                IdRef2 = idRefList[1]
                if l>=3 :
                    IdRef3 = idRefList[2]
                    if l>=4 :
                        IdRef4 = idRefList[3]
                        if l>=5 :
                            IdRef5 = idRefList[4]

        if l>6 :
            for i in range(5, l-1):
                Remain.append(idRefList[i+1])


        #remain and id have been removed
        dict = {'Name' : Name, 'IdRef1' : IdRef1, 'IdRef2' : IdRef2, 'IdRef3' : IdRef3, 'IdRef4' : IdRef4, 'IdRef5' : IdRef5}
        '''

        #IdRef implementation v2 :
        #One IdRef field

        dict = {'Name' : Name, 'IdRefs' : str(idRefSet)}

        outputList.append(dict)

    #dumps the list in the dbInfo file
    ujson.dump(outputList,output,ensure_ascii=False, indent=4)



    input.close()
    output.close()





