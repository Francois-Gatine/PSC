# -*- coding: utf-8 -*-

#First Step

import numpy as np

def LevenshteinDistance(s1,s2):
    """calcul the distance of Levenshtein bewteen s1 and s2"""
    
    D = np.zeros(( len(s1)+1 , len(s2)+1 ), dtype = int)
    
    for i in range( len(s1)+1 ):
        D[i][0] = i
    
    for j in range( len(s2)+1 ):
        D[0][j] = j
    
    #print(D)
    
    for i in range(1, len(s1)+1):
        for j in range(1, len(s2)+1):
            if s1[i-1] == s2[j-1]:
                cost = 0
            else:
                cost = 1
            D[i][j] = min( D[i-1][j]+1, D[i][j-1]+1, D[i-1][j-1]+cost )
            
    #print(D)
    
    return D[len(s1)][len(s2)]

def fragmentComparison(s1,s2,lim):
    """
    Require : String s1 and s2
    Require : A threshold value lim
    Ensure : Are s1 and s2 compatible ?
    """
    
    #delete '.'
    s1 = s1.replace('.',' ')
    s1 = s1.replace('-',' ')
    s2 = s2.replace('.',' ')
    s2 = s2.replace('-',' ')
    
    #split by ' '
    c1 = s1.split()
    c2 = s2.split()
    
    n1 = len(c1)
    n2 = len(c2)
    
    #compare the first fragment
    if ( len(c1[0])>1  and len(c2[0])>1 ):
        if ( LevenshteinDistance(c1[0],c2[0]) > lim ):
            #print(1)
            return False
    else:
        if ( len(c1[0])>1 ):
            if (c1[0][0] != c2[0]):
                #print(2)
                return False
        else:
            if (c1[0] != c2[0][0]):
                #print(3)
                return False
    
    #compare the last fragment
    if ( len( c1[n1-1] )>1 and len( c2[n2-1] )>1 ):
        if ( LevenshteinDistance(c1[n1-1], c2[n2-1]) > lim):
            #print(4)
            return False
    else:
        #print(5)
        return False
    
    #compare the rest fragments
    Mark_c1 = [False] * n1
    Mark_c2 = [False] * n2
    for i in range(1, n1-1):
        for j in range(1, n2-1):
            if ( len( c1[i] )>1 and len( c2[j] )>1 and LevenshteinDistance(c1[i], c2[j])<lim ):
                Mark_c1[i] = True
                Mark_c2[j] = True
    
    for i in range(1, n1-1):
        for j in range(1, n2-1):
            if ( (not(Mark_c1[i])) and len( c1[i] )>1 and len(c2[j]) == 1 and c1[i][0] == c2[j]):
                Mark_c1[i] = True
                Mark_c2[j] = True
    
    for i in range(1, n1-1):
        for j in range(1, n2-1):
            if ( (not(Mark_c2[j])) and len( c2[j] )>1 and len(c1[i]) == 1 and c1[i] == c2[j][0]):
                Mark_c1[i] = True
                Mark_c2[j] = True
    
    for i in range(1, n1-1):
        for j in range(1, n2-1):
            if ( (not(Mark_c1[i])) and (not(Mark_c2[j])) and len(c1[i]) == 1 and len( c2[j] ) == 1  and c1[i] == c2[j]):
                Mark_c1[i] = True
                Mark_c2[j] = True
    
    #check whether at least one string has all fragments marked
    for i in range(1, n1-1):
        if ( (not(Mark_c1[i])) ):
            for j in range(1, n2-1):
                if( (not(Mark_c2[j])) ):
                    #print(6)
                    return False
    
    return True

import json
import json_stream

def sortShortAndLongNameRecords(g):
    """
    Require: Ambiguous group g (the file json g opened)
    Ensure: List S of clusters of authorship records (write a file json S)
    """
    
    ambiguousGroupName = os.path.basename(g.name)
    ambiguousGroupName = ambiguousGroupName.rstrip(".json")
    
    ambiguousGroupDirname = os.path.dirname(g.name)
    
    outputShort_name = ambiguousGroupDirname + "/shortNameRecordsOf" + ambiguousGroupName + ".json"
    outputShort = open(outputShort_name,'w+',encoding="utf-8")
    outputLong_name = ambiguousGroupDirname + "/longNameRecordsOf" + ambiguousGroupName + ".json"
    outputLong = open(outputLong_name,'w+',encoding="utf-8")
    
    outputShort.write('[')
    outputLong.write('[')
    
    authorshipRecords = json_stream.load(g)
    
    author = ""
    lastName = ""
    idRef = ""
    coauthors = []
    defaultTitle = ""
    venue = ""
    duplicId = 0
    Dict = {}
    
    nb_longName = 0
    nb_shortName = 0

    for authorshipRecord in authorshipRecords :

        author = authorshipRecord["author"]
        
        #test the name is in short format or not
        L_author = author.split(' ')
        output = outputLong
        nb_longName += 1
        for i in range(len(L_author)):
            #if the i-th fragement of the name is shorter than 2
            if (len(L_author[i]) <= 2):
                output = outputShort
                
                if (nb_shortName != 0):
                    outputShort.write(',')
                    
                nb_shortName += 1
                nb_longName -= 1
                break
                
        if (output == outputLong and nb_longName != 0):
            outputLong.write(',')
        
        lastName = authorshipRecord["last name"]
        idRef = authorshipRecord["idRef"]
        coauthors = [ coauthor for coauthor in authorshipRecord["coauthors"] ]
        defaultTitle = authorshipRecord["defaultTitle"]
        venue = authorshipRecord["venue"]
        duplicId = authorshipRecord["duplicId"]
        
        Dict = {}
        Dict["author"] = author
        Dict["last name"] = lastName
        Dict["idRef"] = idRef
        Dict["coauthors"] = coauthors
        Dict["defaultTitle"] = defaultTitle
        Dict["venue"] = venue
        Dict["duplicId"] = duplicId
        #print(Dict)
        json.dump(Dict, output, ensure_ascii=False, indent=4)
    
    outputShort.write(']')
    outputLong.write(']')
    
    outputShort.close()
    outputLong.close()
    
    print("There are", nb_longName, "Authorship Records of long name")
    print("There are", nb_shortName, "Authorship Records of short name")
    return
    
import os
 
def mkdir(path): 
    """
    path exemple: ./firstStep
    """
    folder = os.path.exists(path)
 
    if not folder:                   
        os.makedirs(path)            
        return True
 
    else:
        return False
    
def processList (A, Ci, folderAddress):
    """
    Require: list A of authorship records (the file json A opened)
    Require: list Ci of authorship record clusters named by the first author name
    Require: the addresse of the file of the Ambiguous Group
    Ensure: list C0 of authorship record clusters named by the first author name
    
    """
    
    lim = 2 #threshold value lim of LevenshteinDistance
    
    L_severalARs = set() #list of the numbers of the files which have several Autorchip Records
    
    mkdir(folderAddress)
    
    authorshipRecords = json_stream.load(A)
    
    s = 1
    C0 = Ci
    for authorshipRecord in authorshipRecords:
        print(s)
        s += 1
        author = authorshipRecord["author"]
        lastName = authorshipRecord["last name"]
        idRef = authorshipRecord["idRef"]
        coauthors = [ coauthor for coauthor in authorshipRecord["coauthors"] ]
        defaultTitle = authorshipRecord["defaultTitle"]
        venue = authorshipRecord["venue"]
        duplicId = authorshipRecord["duplicId"]
        
        Dict = {}
        Dict["author"] = author
        Dict["last name"] = lastName
        Dict["idRef"] = idRef
        Dict["coauthors"] = coauthors
        Dict["defaultTitle"] = defaultTitle
        Dict["venue"] = venue
        Dict["duplicId"] = duplicId
        
        inserted = False
        i = 0
        while (not inserted and i < len(C0)):
            c = C0[i]
            #if the author name from a is similar with author name from the first authorship record of c
            if (fragmentComparison(author,c,lim)):
                #if it exists a coauthor name in a that is similar with some coauthor name in c
                file_check = open(folderAddress + "/" + str(i) + "authorshipRecordCluster.json", 'r', encoding="utf-8")
                authorshipRecords_check = json_stream.load(file_check)
                coauthors_check = [] #the list of the coauthor names in c
                
                for authorshipRecord_check in authorshipRecords_check:
                    for coauthor_check in authorshipRecord_check["coauthors"]:
                        coauthors_check.append(coauthor_check)
                        
                file_check.close()
                
                for j in range(len(coauthors)): #the j-th coauthor of authorship record a
                    coauthorCompared = coauthors[j]
                    for l in range(len(coauthors_check)): #the l-th coauthor 
                        if (fragmentComparison(coauthorCompared,coauthors_check[l],lim)):
                            
                            #delete ']'
                            file_write = open(folderAddress + "/" + str(i) + "authorshipRecordCluster.json", 'rb+')
                            file_write.seek(-1, os.SEEK_END)
                            file_write.truncate()
                            file_write.close()

                            file_write = open(folderAddress + "/" + str(i) + "authorshipRecordCluster.json", 'a', encoding="utf-8")
                            file_write.write(',')
                            json.dump(Dict, file_write, ensure_ascii=False, indent=4)
                            file_write.write(']')
                            file_write.close()

                            L_severalARs.add(i)
                            
                            inserted = True
                            break
                    else:
                        continue
                    break
                
            i += 1
        #a new cluster is created with this authorship record a
        if (not inserted):
            file_write = open(folderAddress + "/" + str(len(C0)) + "authorshipRecordCluster.json", 'w', encoding="utf-8")
            file_write.write('[')
            json.dump(Dict, file_write, ensure_ascii=False, indent=4)
            file_write.write(']')
            file_write.close()
            
            C0.append(author)
            
    print("The numbers of the files which have several Autorchip Records",L_severalARs)
    
    return C0

def processListEfficient (A, Ci, folderAddress):
    """
    Require: list A of authorship records (the file json A opened)
    Require: list Ci of authorship record clusters named by the first author name
    Require: the addresse of the file of the Ambiguous Group
    Ensure: list C0 of authorship record clusters named by the first author name
    
    """
    
    lim = 2 #threshold value lim of LevenshteinDistance
    
    L_severalARs = set() #list of the numbers of the files which have several Autorchip Records
    
    mkdir(folderAddress)
    
    authorshipRecords = json_stream.load(A)
    
    C0 = Ci
    
    C0coauthors = []
    for i in range(len(C0)):
        C0coauthors.append([])
    
    for authorshipRecord in authorshipRecords:
        
        author = authorshipRecord["author"]
        lastName = authorshipRecord["last name"]
        idRef = authorshipRecord["idRef"]
        coauthors = [ coauthor for coauthor in authorshipRecord["coauthors"] ]
        defaultTitle = authorshipRecord["defaultTitle"]
        venue = authorshipRecord["venue"]
        duplicId = authorshipRecord["duplicId"]
        
        Dict = {}
        Dict["author"] = author
        Dict["last name"] = lastName
        Dict["idRef"] = idRef
        Dict["coauthors"] = coauthors
        Dict["defaultTitle"] = defaultTitle
        Dict["venue"] = venue
        Dict["duplicId"] = duplicId
        
        inserted = False
        i = 0
        while (not inserted and i < len(C0)):
            c = C0[i]
            #if the author name from a is similar with author name from the first authorship record of c
            if (fragmentComparison(author,c,lim)):
                #if it exists a coauthor name in a that is similar with some coauthor name in c
                if C0coauthors[i] == []:
                    file_check = open(folderAddress + "/" + str(i) + "authorshipRecordCluster.json", 'r', encoding="utf-8")
                    
                    authorshipRecords_check = json_stream.load(file_check)
                    for authorshipRecord_check in authorshipRecords_check:
                            C0coauthors[i] += authorshipRecord_check["coauthors"]
                            
                    file_check.close()
                
                for j in range(len(coauthors)): #the j-th coauthor of authorship record a
                    coauthorCompared = coauthors[j]
                    for l in range(len(C0coauthors[i])): #the l-th coauthor 
                        if (fragmentComparison(coauthorCompared,C0coauthors[i][l],lim)):
                            
                            #delete ']'
                            file_write = open(folderAddress + "/" + str(i) + "authorshipRecordCluster.json", 'rb+')
                            file_write.seek(-1, os.SEEK_END)
                            file_write.truncate()
                            file_write.close()

                            file_write = open(folderAddress + "/" + str(i) + "authorshipRecordCluster.json", 'a', encoding="utf-8")
                            file_write.write(',')
                            json.dump(Dict, file_write, ensure_ascii=False, indent=4)
                            file_write.write(']')
                            file_write.close()

                            C0coauthors[i] += coauthors #update the list of the coauthors
                            L_severalARs.add(i)
                            
                            inserted = True
                            break
                    else:
                        continue
                    break
                
            i += 1
        #a new cluster is created with this authorship record a
        if (not inserted):
            file_write = open(folderAddress + "/" + str(len(C0)) + "authorshipRecordCluster.json", 'w', encoding="utf-8")
            file_write.write('[')
            json.dump(Dict, file_write, ensure_ascii=False, indent=4)
            file_write.write(']')
            file_write.close()
            
            #update the list of the coauthors and the authors
            C0coauthors.append([])
            C0coauthors[-1] += coauthors 
            C0.append(author)
            
    print("The identities of the files which have several Autorchip Records", L_severalARs)
    
    return C0

def firstStep(ambiguousGroupAddress):
    """
    Require: Ambiguous group g (the addresse of the file of the Ambiguous Group)
    Ensure: List C of clusters of authorship records
    """
    
    g = open(ambiguousGroupAddress,'r',encoding="utf-8")
    
    ambiguousGroupName = os.path.basename(g.name)
    ambiguousGroupName = ambiguousGroupName.rstrip(".json")
    
    ambiguousGroupDirname = os.path.dirname(g.name)
    
    sortShortAndLongNameRecords(g)
    
    g.close()
    
    folderAddress = ambiguousGroupDirname + "/clustersOf" + ambiguousGroupName
    
    outputLong_name = ambiguousGroupDirname + "/longNameRecordsOf" + ambiguousGroupName + ".json"
    
    L = open(outputLong_name,'r',encoding="utf-8")
    C1 = []
    #C2 = processList(L,C1,folderAddress)
    C2 = processListEfficient(L,C1,folderAddress)
    L.close()

    outputShort_name = ambiguousGroupDirname + "/shortNameRecordsOf" + ambiguousGroupName + ".json"
    S = open(outputShort_name,'r',encoding="utf-8")
    #C3 = processList(S,C2,folderAddress)
    C3 = processListEfficient(S,C2,folderAddress)
    S.close()

    return (C3,folderAddress)

#(C3,folderAddress) = firstStep("../data/AG_sample.json")
#print(C3)
#print(folderAddress)


