# -*- coding: utf-8 -*-

#Second Step

import FirstStep

import nltk
#nltk.download('stopwords')
from nltk.corpus import stopwords

import json_stream

import os

import string

def getWorkTitleTerms(identity, folderAddress, stopWords):
    """
    Require: Cluster of authorship record at work (the id identity of this cluster)
    Require: Set stopWords of stop words in English
    Ensure: List T_t of the titles of this cluster
    """
    
    L_title = [] #list of the words of the title
    
    file_check = open(folderAddress + "/" + str(identity) + "authorshipRecordCluster.json", 'r', encoding="utf-8")
    
    authorshipRecords = json_stream.load(file_check)
    
    for authorshipRecord in authorshipRecords:
        
        #replace the punctuation
        defaultTitle = ""
        
        for c in authorshipRecord["defaultTitle"]:
            if c in string.punctuation:
                c = ' '
            defaultTitle += c
            
        defaultTitle = defaultTitle.split()
        
        #delete the stop words
        L_defaultTitle = [w.lower() for w in defaultTitle if w.lower() not in stopWords]
        L_title += L_defaultTitle
        
        
    #find the 10 most common words    
    freq = nltk.FreqDist(L_title)
    T_t = [w for (w, f) in freq.most_common(10)]
    
    file_check.close()
    
    return T_t
        
#print(getWorkTitleTerms(0,folderAddress,set(stopwords.words("english"))))
    
def titleSimilarity(T_t1, T_t2, lim_title):
    """
    We compare the LevenshteinDistance of each pairs from T_t1, T_t2 respectively.
    If the 2 lists have certain numbers (nbCommonWords) in common, then they are similar.
    """
    nbCommonWords = 2
    for i in range(len(T_t1)):
        for j in range(len(T_t2)):
            if (FirstStep.LevenshteinDistance(T_t1[i], T_t2[j]) <= lim_title):
                nbCommonWords -= 1
                if (nbCommonWords == 0):
                    return True
    return False
    
def secondStep(Ci, folderAddress):
    """
    Require: List Ci of clusters of authorship records
    Ensure: List Co of clusters of authorship records
    """
    
    lim_name = 2 #name threshold
    lim_title = 2 #title threshold 
    
    stopWords = set(stopwords.words("english"))
    
    Co = Ci[:]
    lenCo = len(Co)
    
    existedCo = [] #this ith file existe or not
    for i in range(lenCo):
        existedCo.append(True)
    
    i = 0
    j = 1
    while i < lenCo:
        if not existedCo[i] :
            i += 1
            continue
        T_t1 = getWorkTitleTerms(i, folderAddress, stopWords)
        while j < lenCo:
            if i == j or (not existedCo[j]):
                j += 1
                continue
            if FirstStep.fragmentComparison(Co[i],Co[j],lim_name):
                print("compare",i,j)
                T_t2 = getWorkTitleTerms(j, folderAddress, stopWords)
                if titleSimilarity(T_t1, T_t2, lim_title):
                    print("merge",i,j)
                    #delete ']'
                    file_i = open(folderAddress + "/" + str(i) + "authorshipRecordCluster.json", 'rb+')
                    file_i.seek(-1, os.SEEK_END)
                    file_i.truncate()
                    file_i.close()
                    
                    file_i = open(folderAddress + "/" + str(i) + "authorshipRecordCluster.json", 'a+', encoding="utf-8")
                    file_i.write(',')
                    
                    file_j = open(folderAddress + "/" + str(j) + "authorshipRecordCluster.json", 'r', encoding="utf-8")
                    
                    #delete the first '['
                    firstLine = True
                    for line in file_j:
                        if firstLine:
                            firstLine = False
                            line = line.strip('[')
                        file_i.write(line)
                    
                    file_i.close()
                    file_j.close()
                    
                    os.remove(folderAddress + "/" + str(j) + "authorshipRecordCluster.json")
                    
                    Co[j] = ""
                    existedCo[j] = False
                    
                    T_t1 = getWorkTitleTerms(i, folderAddress, stopWords)
                    
                    j = 0
                    
            j += 1
        i += 1
        j = i + 1
    
    #print(Co)
    return Co

(Ci,folderAddress) = FirstStep.firstStep("../data/ada.json")
print(Ci)
Co = secondStep(Ci, folderAddress)
print(Co)

