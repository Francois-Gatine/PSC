# -*- coding: utf-8 -*-

#First Step

import numpy as np

def LevenshteinDistance(s1,s2):
    """
    Require : String s1 and s2
    Ensure : calcul the distance of Levenshtein bewteen s1 and s2
    """
    
    #initialize the matrix of distance 
    D = np.zeros(( len(s1)+1 , len(s2)+1 ), dtype = int)
    
    for i in range( len(s1)+1 ):
        D[i][0] = i
        
    for j in range( len(s2)+1 ):
        D[0][j] = j
    
    #evolve the matrix of distance 
    for i in range(1, len(s1)+1):
        for j in range(1, len(s2)+1):
            if s1[i-1] == s2[j-1]:
                cost = 0
            else:
                cost = 1
            D[i][j] = min( D[i-1][j]+1, D[i][j-1]+1, D[i-1][j-1]+cost )
            
    return D[len(s1)][len(s2)]

def fragmentComparison(s1,s2,lim):
    """
    Require : String s1 and s2
    Require : A threshold value lim
    Ensure : Are s1 and s2 compatible by the threshold value lim?
    """
    
    #create the lists of the fragments of the string c1 and c2
    #delete '.' and '-'
    s1 = s1.replace('.',' ')
    s1 = s1.replace('-',' ')
    s2 = s2.replace('.',' ')
    s2 = s2.replace('-',' ')
    
    #split by ' '
    c1 = s1.split() 
    c2 = s2.split()
    
    #longer of the lists
    n1 = len(c1)
    n2 = len(c2)
    
    #compare the first fragment
    if ( len(c1[0])>1  and len(c2[0])>1 ):
        if ( LevenshteinDistance(c1[0],c2[0]) > lim ):
            return False
    else:
        if ( len(c1[0])>1 ):
            if (c1[0][0] != c2[0]):
                return False
        else:
            if (c1[0] != c2[0][0]):
                return False
    
    #compare the last fragment
    if ( len( c1[n1-1] )>1 and len( c2[n2-1] )>1 ):
        if ( LevenshteinDistance(c1[n1-1], c2[n2-1]) > lim):
            return False
    else:
        return False
    
    #compare the rest fragments
    #markers of the lists c1 and c2; True if this fragment was compared
    Mark_c1 = [False] * n1
    Mark_c2 = [False] * n2
    
    #compare the fragments longer than 1
    for i in range(1, n1-1):
        for j in range(1, n2-1):
            if ( len( c1[i] )>1 and len( c2[j] )>1 and LevenshteinDistance(c1[i], c2[j])<lim ):
                Mark_c1[i] = True
                Mark_c2[j] = True
    
    #compare the fragment i longeer than 1 and the fragment j with only one letter
    for i in range(1, n1-1):
        for j in range(1, n2-1):
            if ( (not(Mark_c1[i])) and len( c1[i] )>1 and len(c2[j]) == 1 and c1[i][0] == c2[j]):
                Mark_c1[i] = True
                Mark_c2[j] = True
                
    #compare the fragment j longeer than 1 and the fragment i with only one letter
    for i in range(1, n1-1):
        for j in range(1, n2-1):
            if ( (not(Mark_c2[j])) and len( c2[j] )>1 and len(c1[i]) == 1 and c1[i] == c2[j][0]):
                Mark_c1[i] = True
                Mark_c2[j] = True
    
    #compare the fragments with only one letter
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
                    return False
    
    return True

import os
 
def mkdir(path): 
    """
    Require: a path (exemple: ./firstStep)
    Ensure: return true if make a new folder in the address path
    """
    folder = os.path.exists(path)
 
    if not folder:                   
        os.makedirs(path)            
        return True
 
    else:
        return False
    
import json
import json_stream

def sortShortAndLongNameRecords(ambiguousGroupAddress, resultAddress):
    """
    Require: Ambiguous group address 
    Require: Folder address where place the result
    Ensure: Two list of clusters of authorship records;
    One contains the records of short name and the other contains long name.
    (write two files json in the resultAddress)
    """
    
    #make a new folder if resultAddress doesn't exist
    mkdir(resultAddress)
    
    #get the ambiguous group name
    ambiguousGroupName = os.path.basename(ambiguousGroupAddress)
    ambiguousGroupName = ambiguousGroupName.rstrip(".json")
    
    #open the files where writes the result
    outputShort_name = resultAddress + "/shortNameRecordsOf" + ambiguousGroupName + ".json"
    outputShort = open(outputShort_name,'w+',encoding="utf-8")
    outputLong_name = resultAddress + "/longNameRecordsOf" + ambiguousGroupName + ".json"
    outputLong = open(outputLong_name,'w+',encoding="utf-8")
    
    #write a '[' in the beginning
    outputShort.write('[')
    outputLong.write('[')
    
    #open the ambiguous group
    g = open(ambiguousGroupAddress,'r',encoding="utf-8")
    authorshipRecords = json_stream.load(g)
    
    #variables to store all terms in an authorship record 
    author = ""
    lastName = ""
    idRef = ""
    coauthors = []
    defaultTitle = ""
    venue = ""
    duplicId = 0
    Dict = {}
    
    #counters of authorship records with long name and short name
    nb_longName = 0
    nb_shortName = 0

    #counter of execution
    nb_AR = 0
    for authorshipRecord in authorshipRecords :
        
        nb_AR += 1
        if(nb_AR % 500 == 0): print("read", nb_AR, "Authorship Records (sort Authorship Record)")
        
        author = authorshipRecord["author"]
        
        #test the name is in short format or not
        L_author = author.split(' ')
        
        #par default, we consider it as in long format
        output = outputLong
        nb_longName += 1
        
        for i in range(len(L_author)):
            #if the i-th fragement of the name is shorter than 2, we consider it as in short format
            if (len(L_author[i]) <= 2):
                output = outputShort
                
                #write a ',' except before the first authorship record
                if (nb_shortName != 0):
                    outputShort.write(',')
                    
                nb_shortName += 1
                nb_longName -= 1
                break
                
        #write a ',' except before the first authorship record
        if (output == outputLong and nb_longName != 0):
            outputLong.write(',')
        
        #write down the authorship record
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

        json.dump(Dict, output, ensure_ascii=False, indent=4)
    
    #write a ']' in the end
    outputShort.write(']')
    outputLong.write(']')
    
    #close the files opened
    outputShort.close()
    outputLong.close()
    g.close()
    
    #print the counters
    print("sort Authorship Records successfully")
    print("There are", nb_longName, "Authorship Records of long name")
    print("There are", nb_shortName, "Authorship Records of short name")
    
    return
    
def processList (A, Ci, folderAddress):
    """
    Require: list A of authorship records sorted (the address of the file json A)
    Require: list Ci of authorship record clusters named by the first author name
    Require: folder address where place all the authorship record clusters
    Ensure: list C0 of authorship record clusters named by the first author name
    
    """
    
    lim = 2 #threshold value lim of LevenshteinDistance
    
    L_severalARs = set() #set of the numbers of the files which have several Autorchip Records
    
    #make a new folder if folderAddress doesn't exist
    mkdir(folderAddress)
    
    #open the list of authorship records sorted
    f = open(A,'r',encoding="utf-8")
    authorshipRecords = json_stream.load(f)
    
    C0 = Ci
    for authorshipRecord in authorshipRecords:
        
        
        #keep all the variables in memory
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
        
        inserted = False #this authorship record hasn't inserted in some cluster
        i = 0
        while (not inserted and i < len(C0)):
            c = C0[i]
            #if the author name of authorshipRecord is similar with author name from the first authorship record of c
            if (fragmentComparison(author,c,lim)):
                
                #create the list of the coauthor names in c
                file_check = open(folderAddress + "/" + str(i) + "authorshipRecordCluster.json", 'r', encoding="utf-8")
                authorshipRecords_check = json_stream.load(file_check)
                coauthors_check = [] #the list of the coauthor names in c
                
                for authorshipRecord_check in authorshipRecords_check:
                    for coauthor_check in authorshipRecord_check["coauthors"]:
                        coauthors_check.append(coauthor_check)
                        
                file_check.close()
                
                #test if it exists a coauthor name in authorshipRecord that is similar with some coauthor name in c
                for j in range(len(coauthors)): #the j-th coauthor of authorshipRecord
                    coauthorCompared = coauthors[j]
                    for l in range(len(coauthors_check)): #the l-th coauthor 
                        if (fragmentComparison(coauthorCompared,coauthors_check[l],lim)):
                            
                            #delete the last ']'
                            file_write = open(folderAddress + "/" + str(i) + "authorshipRecordCluster.json", 'rb+')
                            file_write.seek(-1, os.SEEK_END)
                            file_write.truncate()
                            file_write.close()

                            #write this authorshipRecord
                            file_write = open(folderAddress + "/" + str(i) + "authorshipRecordCluster.json", 'a', encoding="utf-8")
                            file_write.write(',')
                            json.dump(Dict, file_write, ensure_ascii=False, indent=4)
                            file_write.write(']')
                            file_write.close()
                            
                            L_severalARs.add(i) 
                            
                            inserted = True #this authorshipRecord has inserted
                            break
                    
                    #if break the loop of l, also break the loop of j
                    else:
                        continue
                    break
                
            i += 1
            
        #a new cluster is created if this authorshipRecord hasn't inserted
        if (not inserted):
            
            #write this authorshipRecord
            file_write = open(folderAddress + "/" + str(len(C0)) + "authorshipRecordCluster.json", 'w', encoding="utf-8")
            file_write.write('[')
            json.dump(Dict, file_write, ensure_ascii=False, indent=4)
            file_write.write(']')
            file_write.close()
            
            C0.append(author)
            
    f.close()        
    
    print("The identifiers of the files which have several Authorship Records",L_severalARs)
    
    return C0

#difference between processList and processListEfficient: processListEfficient store a list of the coauthors of authorship record clusters in memory
def processListEfficient (A, Ci, folderAddress):
    """
    Require: list A of authorship records sorted (the address of the file json A)
    Require: list Ci of authorship record clusters named by the first author name
    Require: folder address where place all the authorship record clusters
    Ensure: list C0 of authorship record clusters named by the first author name
    
    """
    
    lim = 2 #threshold value lim of LevenshteinDistance
    
    L_severalARs = set() #list of the numbers of the files which have several Autorchip Records
    
    #make a new folder if folderAddress doesn't exist
    mkdir(folderAddress)
    
    #open the list of authorship records sorted
    f = open(A,'r',encoding="utf-8")
    authorshipRecords = json_stream.load(f)
    
    C0 = Ci
    
    #list of the coauthors of authorship record clusters C0
    C0coauthors = []
    
    #initialize this list
    for i in range(len(C0)):
        C0coauthors.append([])
    
    #counter of execution
    nb_AR = 0
    for authorshipRecord in authorshipRecords:
        
        nb_AR += 1
        if(nb_AR % 500 == 0): print("read", nb_AR, "Authorship Records (creat Authorship Record Clusters)")
        
        #keep all the variables in memory
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
        
        inserted = False #this authorship record hasn't inserted in some cluster
        i = 0
        while (not inserted and i < len(C0)):
            c = C0[i]
            #if the author name from a is similar with author name from the first authorship record of c
            if (fragmentComparison(author,c,lim)):
                
                #evolve the list of the coauthor names
                if C0coauthors[i] == []:
                    file_check = open(folderAddress + "/" + str(i) + "authorshipRecordCluster.json", 'r', encoding="utf-8")
                    
                    authorshipRecords_check = json_stream.load(file_check)
                    for authorshipRecord_check in authorshipRecords_check:
                            C0coauthors[i] += authorshipRecord_check["coauthors"]
                            
                    file_check.close()
                
                #test if it exists a coauthor name in authorshipRecord that is similar with some coauthor name in c
                for j in range(len(coauthors)): #the j-th coauthor of authorshipRecord 
                    coauthorCompared = coauthors[j]
                    for l in range(len(C0coauthors[i])): #the l-th coauthor 
                        if (fragmentComparison(coauthorCompared,C0coauthors[i][l],lim)):
                            
                            #delete ']'
                            file_write = open(folderAddress + "/" + str(i) + "authorshipRecordCluster.json", 'rb+')
                            file_write.seek(-1, os.SEEK_END)
                            file_write.truncate()
                            file_write.close()
                            
                            #write this authorshipRecord
                            file_write = open(folderAddress + "/" + str(i) + "authorshipRecordCluster.json", 'a', encoding="utf-8")
                            file_write.write(',')
                            json.dump(Dict, file_write, ensure_ascii=False, indent=4)
                            file_write.write(']')
                            file_write.close()

                            C0coauthors[i] += coauthors #update the list of the coauthors
                            
                            L_severalARs.add(i)
                            
                            inserted = True  #this authorshipRecord has inserted
                            break
                        
                    #if break the loop of l, also break the loop of j
                    else:
                        continue
                    break
                
            i += 1
            
        #a new cluster is created with this authorshipRecord 
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
    
    print("creat Authorship Record Cluters successfully")            
    print("The identitiers of the files which have several Authorship Records", L_severalARs)
    
    return C0

def firstStep(ambiguousGroupAddress, resultAddress):
    """
    Require: Addresse of the ambiguous group)
    Ensure: List C of clusters of authorship records
    """
    
    sortShortAndLongNameRecords(ambiguousGroupAddress, resultAddress)
    
    #get the ambiguous group name
    ambiguousGroupName = os.path.basename(ambiguousGroupAddress)
    ambiguousGroupName = ambiguousGroupName.rstrip(".json")
    
    #folder address where place all the authorship record clusters 
    folderAddress = resultAddress + "/clustersOf" + ambiguousGroupName
    
    outputLongAddress = resultAddress + "/longNameRecordsOf" + ambiguousGroupName + ".json"
    C1 = []
    #C2 = processList(L,C1,folderAddress)
    C2 = processListEfficient(outputLongAddress,C1,folderAddress)

    outputShortAddress = resultAddress + "/shortNameRecordsOf" + ambiguousGroupName + ".json"
    #C3 = processList(S,C2,folderAddress)
    C3 = processListEfficient(outputShortAddress,C2,folderAddress)

    return (C3,folderAddress)


#test
if __name__ == '__main__':
    (C3,folderAddress) = firstStep("../data/AG_sample.json","../data/AG_sample")
    print(C3)
    print(folderAddress)


