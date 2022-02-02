# -*- coding: utf-8 -*-

#Second Step

import FirstStep

import nltk
#nltk.download('stopwords')
from nltk.corpus import stopwords

import json_stream

import os

import string

from transformers import AutoTokenizer, AutoModel
from sentence_transformers import util

def getWorkTitleTermsFre(identity, folderAddress, stopWords):
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
    
def getWorkTitleTerms(identity, folderAddress, tokenizer, model):
    """
    Require: Cluster of authorship record at work (the id identity of this cluster)
    Ensure: List T_t of the titles of this cluster
    """
    
    L_title = [] #list of the titles of the cluster
    
    file_check = open(folderAddress + "/" + str(identity) + "authorshipRecordCluster.json", 'r', encoding="utf-8")
    
    authorshipRecords = json_stream.load(file_check)
    
    for authorshipRecord in authorshipRecords:
        title = authorshipRecord["defaultTitle"]
        L_title.append(title)
    
    file_check.close()
    
    # preprocess the input
    inputs = tokenizer(L_title, padding=True, truncation=True, return_tensors="pt", max_length=512)
    # computing the embedding
    result = model(**inputs)
    # take the first token in the batch as the embedding
    T_t = result.last_hidden_state[:, 0, :]
    
    return T_t

def getWorkVenueTermsFre(identity, folderAddress, stopWords):
    """
    Require: Cluster of authorship record at work (the id identity of this cluster)
    Require: Set stopWords of stop words in English
    Ensure: List V_t of the titles of this cluster
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

def getWorkVenueTerms(identity, folderAddress):
    """
    Require: Cluster of authorship record at work (the id identity of this cluster)
    Ensure: feature vector of the venue titles in this cluster
    """
    
    
def titleSimilarityFre(T_t1, T_t2, lim_title):
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

def titleSimilarity(T_t1, T_t2, lim_title):
    """
    We compare the cos similarity of each pairs from T_t1, T_t2 respectively.
    If the biggest similarity between two lists is bigger than lim_title, then they are similar.
    """
    for i in range(len(T_t1)):
        for j in range(len(T_t2)):
            if(util.cos_sim(T_t1[i], T_t2[j]) > lim_title):
                return True
    return False
    
def venueSimilarity(V_1, V_2, lim_venue):
    """
    We use word-embedding to compare the similarity between the 2 publication venues.
    We compare the feature vector of 2 clusters respectively, and if their included angle is big enough, then they are similar.
    """
    
    
def secondStepSlow(Ci, folderAddress):
    """
    Require: List Ci of clusters of authorship records
    Ensure: List Co of clusters of authorship records
    """
    
    lim_name = 2    #name threshold
    lim_title = 2   #title threshold 
    
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
                #print("compare",i,j)
                T_t2 = getWorkTitleTerms(j, folderAddress, stopWords)
                if titleSimilarity(T_t1, T_t2, lim_title) :
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

def secondStepFre(Ci, folderAddress):
    """
    Require: List Ci of clusters of authorship records
    Ensure: List Co of clusters of authorship records
    """
    
    lim_name = 2    #name threshold
    lim_title = 2   #title threshold 
    
    stopWords = set(stopwords.words("english"))
    
    Co = Ci[:]
    lenCo = len(Co)
    
    existedCo = [] #this ith file existe or not
    for i in range(lenCo):
        existedCo.append(True)
    
    CoTitleTerms = []
    for i in range(len(Co)):
        CoTitleTerms.append(getWorkTitleTermsFre(i, folderAddress, stopWords))
    
    i = 0
    j = 1
    while i < lenCo:
        if not existedCo[i] :
            i += 1
            continue
        while j < lenCo:
            if i == j or (not existedCo[j]):
                j += 1
                continue
            if FirstStep.fragmentComparison(Co[i],Co[j],lim_name):
                #print("compare",i,j)
                if titleSimilarityFre(CoTitleTerms[i], CoTitleTerms[j], lim_title): #or venueSimilarity(VenueTerms[i], VenueTerms[j], lim_venue):
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
                    
                    CoTitleTerms[i] = getWorkTitleTermsFre(i, folderAddress, stopWords)
                    CoTitleTerms[j] = []
                    
                    j = 0
                    
            j += 1
        i += 1
        j = i + 1
    
    #print(Co)
    return Co

def secondStep(Ci, folderAddress):
    """
    Require: List Ci of clusters of authorship records
    Ensure: List Co of clusters of authorship records
    """
    
    #the following two lines should be done once !
    #load model and tokenizer
    tokenizer = AutoTokenizer.from_pretrained('allenai/specter')
    model = AutoModel.from_pretrained('allenai/specter')
    
    lim_name = 2    #name threshold
    lim_title = 0.7   #title threshold 
    #lim_venue =     #venue threshold
    
    #stopWords = set(stopwords.words("english"))
    
    Co = Ci[:]
    lenCo = len(Co)
    
    existedCo = [] #this ith file existe or not
    for i in range(lenCo):
        existedCo.append(True)
    
    CoTitleTerms = []
    #CoVenueTerms = []
    for i in range(len(Co)):
        CoTitleTerms.append(getWorkTitleTerms(i, folderAddress, tokenizer, model))
        #VenueTerms.append(getWorkVenueTitleTerms(i, folderAddress))
    
    i = 0
    j = 1
    while i < lenCo:
        if not existedCo[i] :
            i += 1
            continue
        while j < lenCo:
            if i == j or (not existedCo[j]):
                j += 1
                continue
            if FirstStep.fragmentComparison(Co[i],Co[j],lim_name):
                #print("compare",i,j)
                if titleSimilarity(CoTitleTerms[i], CoTitleTerms[j], lim_title): #or venueSimilarity(VenueTerms[i], VenueTerms[j], lim_venue):
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
                    
                    CoTitleTerms[i] = getWorkTitleTerms(i, folderAddress, tokenizer, model)
                    #CoVenueTerms[i] = getWorkVenueTitleTerms(i, folderAddress)
                    CoTitleTerms[j] = []
                    #CoVenueTerms[j] =  []
                    
                    j = 0
                    
            j += 1
        i += 1
        j = i + 1
    
    #print(Co)
    return Co


    
(Ci,folderAddress) = FirstStep.firstStep("../data/AG_sample.json", "../data/AG_sample")
print(Ci)

Co = secondStepFre(Ci, folderAddress)
print(Co)

#Co = secondStep(Ci, folderAddress)
#print(Co)
