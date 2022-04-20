# -*- coding: utf-8 -*-

#Second Step
import sys

import FirstStep

import nltk
#nltk.download('stopwords')
from nltk.corpus import stopwords

import json_stream

import os

import string

from transformers import AutoTokenizer, AutoModel
from sentence_transformers import util

import time

#from memory_profiler import profile # test memory

import math

# def getWorkTitleTermsFre(identity, folderAddress, stopWords):
#     """
#     Require: Cluster of authorship record at work (the id identity of this cluster)
#     Require: Set stopWords of stop words in English
#     Ensure: List T_t of the titles of this cluster
#     """
    
#     L_title = [] #list of the words of the title
    
#     file_check = open(folderAddress + "/" + str(identity) + "authorshipRecordCluster.json", 'r', encoding="utf-8")
    
#     authorshipRecords = json_stream.load(file_check)
    
#     for authorshipRecord in authorshipRecords:
        
#         #replace the punctuation
#         defaultTitle = ""
        
#         for c in authorshipRecord["defaultTitle"]:
#             if c in string.punctuation:
#                 c = ' '
#             defaultTitle += c
            
#         defaultTitle = defaultTitle.split()
        
#         #delete the stop words
#         L_defaultTitle = [w.lower() for w in defaultTitle if w.lower() not in stopWords]
#         L_title += L_defaultTitle
        
        
#     #find the 10 most common words    
#     freq = nltk.FreqDist(L_title)
#     T_t = [w for (w, f) in freq.most_common(10)]
    
#     file_check.close()
    
#     return T_t

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
    
    nb_calcul = 5 # number of titles to calculate for each iteration
    
    nb_ite = math.ceil(len(L_title)/nb_calcul)
    
    # # preprocess the input
    # inputs = tokenizer(L_title[0:min(nb_calcul, len(L_title))], padding=True, truncation=True, return_tensors="pt", max_length=512)
    # # computing the embedding
    # result = model(**inputs)
    # # take the first token in the batch as the embedding
    # T_t = result.last_hidden_state[:, 0, :].detach()
    T_t = []
    for i in range(0, nb_ite):
        start = i*nb_calcul
        # preprocess the input
        inputs = tokenizer(L_title[start:min(start+nb_calcul, len(L_title))], padding=True, truncation=True, return_tensors="pt", max_length=512)
        # computing the embedding
        result = model(**inputs)
        # take the first token in the batch as the embedding
        T_t += result.last_hidden_state[:, 0, :].detach()
      
    result = None
    inputs = None
    
    return T_t

# def addWorkTitleTerms(identity, folderAddress, tokenizer, model, T_t):
#     """
#     Require: Cluster of authorship record at work (the id identity of this cluster)
#     Ensure: List T_t of the titles of this cluster
#     """
    
#     L_title = [] #list of the titles of the cluster
    
#     file_check = open(folderAddress + "/" + str(identity) + "authorshipRecordCluster.json", 'r', encoding="utf-8")
    
#     authorshipRecords = json_stream.load(file_check)
    
#     for authorshipRecord in authorshipRecords:
#         title = authorshipRecord["defaultTitle"]
#         L_title.append(title)
    
#     file_check.close()
    
#     nb_calcul = 5 # number of titles to calculate for each iteration
    
#     nb_ite = math.ceil(len(L_title)/nb_calcul)
    
#     for i in range(nb_ite):
#         start = i*nb_calcul
#         # preprocess the input
#         inputs = tokenizer(L_title[start:min(start+nb_calcul, len(L_title))], padding=True, truncation=True, return_tensors="pt", max_length=512)
#         # computing the embedding
#         result = model(**inputs)
#         # take the first token in the batch as the embedding
#         T_t += result.last_hidden_state[:, 0, :].detach()
    
#     result = None
#     inputs = None
    
#     return T_t

def getWorkVenueTerms(identity, folderAddress, stopWords, venueStopWords):
    """
    Require: Cluster of authorship record at work (the id identity of this cluster)
    Require: Set stopWords of stop words in English
    Ensure: a frequency dictionary V_fd of the venus of this cluster 
            and a list V_acronym of the acronym of the venus of this cluster
    """
    
    V_fd = dict()
    V_acronym = []
    
    file_check = open(folderAddress + "/" + str(identity) + "authorshipRecordCluster.json", 'r', encoding="utf-8")
    
    authorshipRecords = json_stream.load(file_check)
    
    for authorshipRecord in authorshipRecords:
        
        #replace punctuations
        venue = ""
        
        for c in authorshipRecord["venue"]:
            if c in string.punctuation:
                c = ' '
            venue += c
            
        venue = venue.split()
        
        acronym = ""
        
        #delete stop words and store acronym
        for w in venue:
            w = w.lower()
            if w not in stopWords:
                acronym += w[0]
                if w in V_fd:
                    V_fd[w] += 1
                else:
                    if w not in venueStopWords:
                        V_fd[w] = 1
                        
        V_acronym.append(acronym)
    
    return (V_fd, V_acronym)

def addWorkVenueTerms(V_t_i, V_t_j):
    """
    Ensure: merge VenueTerms i and j, place in VenueTerems i
    """
    
    (V_fd_i, V_acronym_i) = V_t_i
    (V_fd_j, V_acronym_j) = V_t_j
        
    for key,value in V_fd_j.items():
        if key in V_fd_i:
            V_fd_i[key] += value
        else:
            V_fd_i[key] = value
    
    V_acronym_i += V_acronym_j
    V_t_i = (V_fd_i, V_acronym_i)
    
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
                # print(i,j,util.cos_sim(T_t1[i], T_t2[j]))
                return True
    return False

def isSubWord(word, V_acronym):
    if any(word in acronym for acronym in V_acronym):
        return True
    return False
    
def venueSimilarity(V_t1, V_t2, lim_venue):
    """
    If one of three conditions below is satisfied, then they are similar:
        1. It exists some words(key of V_fd2) in V_fd2 that also exist in V_fd1 
        and sum of frequency of words in V_fd1 is bigger than lim_venue.
        2. It exists one word in V_fd2 is a sub-word of acronym of V_acronym1
        3. It exists one word in V_fd1 is a sub-word of acronym of V_acronym2
    """
    
    (V_fd1,V_acronym1) = V_t1
    (V_fd2,V_acronym2) = V_t2
    
    for (word , frequency) in V_fd2.items():
        if word in V_fd1:
            #condition 1
            lim_venue -= V_fd1[word]
            if lim_venue < 1:
                return True
        else:
            #condition 2
            if isSubWord(word, V_acronym1):
                return True
    
    #condition 3
    for (word , frequency) in V_fd1.items():
        if isSubWord(word, V_acronym2):
            return True
    
    return False

# def secondStepSlow(Ci, folderAddress):
#     """
#     Require: List Ci of clusters of authorship records
#     Ensure: List Co of clusters of authorship records
#     """
    
#     lim_name = 2    #name threshold
#     lim_title = 0.7   #title threshold 
#     lim_venue = 2    #venue threshold
    
#     Co = Ci[:]
#     lenCo = len(Co)
    
#     existedCo = [] #this ith file existe or not
#     for i in range(lenCo):
#         existedCo.append(True)
    
#     #CoTitleTerms = []
#     CoVenueTerms = []
    
#     #the following two lines should be done once !
#     #load model and tokenizer
#     tokenizer = AutoTokenizer.from_pretrained('allenai/specter')
#     model = AutoModel.from_pretrained('allenai/specter')
    
#     stopWords = set(stopwords.words("english"))
#     venueStopWords = {"journal","j","review","reviews","theory","theories"}
    
#     for i in range(len(Co)):
#         #CoTitleTerms.append(getWorkTitleTerms(i, folderAddress, tokenizer, model))
#         CoVenueTerms.append(getWorkVenueTerms(i, folderAddress, stopWords, venueStopWords))
    
#     i = 0
#     j = 1
#     while i < lenCo:
#         if not existedCo[i] :
#             i += 1
#             continue
#         #print("compare", i, "th Authorship Record Cluster with others")
#         while j < lenCo:
#             if i == j or (not existedCo[j]):
#                 j += 1
#                 continue
#             if FirstStep.fragmentComparison(Co[i],Co[j],lim_name):
#                 #print("compare",i,j)
#                 if titleSimilarity(getWorkTitleTerms(i, folderAddress, tokenizer, model), getWorkTitleTerms(j, folderAddress, tokenizer, model), lim_title) or venueSimilarity(CoVenueTerms[i], CoVenueTerms[j], lim_venue):
#                     #print("merge",i,j)
#                     #delete ']'
#                     file_i = open(folderAddress + "/" + str(i) + "authorshipRecordCluster.json", 'rb+')
#                     file_i.seek(-1, os.SEEK_END)
#                     file_i.truncate()
#                     file_i.close()
                    
#                     file_i = open(folderAddress + "/" + str(i) + "authorshipRecordCluster.json", 'a+', encoding="utf-8")
#                     file_i.write(',')
                    
#                     file_j = open(folderAddress + "/" + str(j) + "authorshipRecordCluster.json", 'r', encoding="utf-8")
                    
#                     #delete the first '['
#                     firstLine = True
#                     for line in file_j:
#                         if firstLine:
#                             firstLine = False
#                             line = line.strip('[')
#                         file_i.write(line)
                    
#                     file_i.close()
#                     file_j.close()
                    
#                     os.remove(folderAddress + "/" + str(j) + "authorshipRecordCluster.json")
                    
#                     Co[j] = ""
#                     existedCo[j] = False
                    
#                     #CoTitleTerms[i] = addWorkTitleTerms(i, folderAddress, tokenizer, model, CoTitleTerms[i])
#                     CoVenueTerms[i] = addWorkVenueTerms(i, folderAddress, stopWords, venueStopWords, CoVenueTerms[i])
#                     #CoTitleTerms[j] = None
#                     CoVenueTerms[j] = None
                    
#                     j = 0
                    
#             j += 1
#         i += 1
#         j = i + 1
        
#     tokenizer = None
#     model = None
#     #print(Co)
#     return Co

# def secondStepFre(Ci, folderAddress):
#     """
#     Require: List Ci of clusters of authorship records
#     Ensure: List Co of clusters of authorship records
#     """
    
#     lim_name = 2    #name threshold
#     lim_title = 2   #title threshold 
    
#     stopWords = set(stopwords.words("english"))
    
#     Co = Ci[:]
#     lenCo = len(Co)
    
#     existedCo = [] #this ith file existe or not
#     for i in range(lenCo):
#         existedCo.append(True)
    
#     CoTitleTerms = []
#     for i in range(len(Co)):
#         CoTitleTerms.append(getWorkTitleTermsFre(i, folderAddress, stopWords))
    
#     i = 0
#     j = 1
#     while i < lenCo:
#         if not existedCo[i] :
#             i += 1
#             continue
#         while j < lenCo:
#             if i == j or (not existedCo[j]):
#                 j += 1
#                 continue
#             if FirstStep.fragmentComparison(Co[i],Co[j],lim_name):
#                 #print("compare",i,j)
#                 if titleSimilarityFre(CoTitleTerms[i], CoTitleTerms[j], lim_title): #or venueSimilarity(VenueTerms[i], VenueTerms[j], lim_venue):
#                     print("merge",i,j)
#                     #delete ']'
#                     file_i = open(folderAddress + "/" + str(i) + "authorshipRecordCluster.json", 'rb+')
#                     file_i.seek(-1, os.SEEK_END)
#                     file_i.truncate()
#                     file_i.close()
                    
#                     file_i = open(folderAddress + "/" + str(i) + "authorshipRecordCluster.json", 'a+', encoding="utf-8")
#                     file_i.write(',')
                    
#                     file_j = open(folderAddress + "/" + str(j) + "authorshipRecordCluster.json", 'r', encoding="utf-8")
                    
#                     #delete the first '['
#                     firstLine = True
#                     for line in file_j:
#                         if firstLine:
#                             firstLine = False
#                             line = line.strip('[')
#                         file_i.write(line)
                    
#                     file_i.close()
#                     file_j.close()
                    
#                     os.remove(folderAddress + "/" + str(j) + "authorshipRecordCluster.json")
                    
#                     Co[j] = ""
#                     existedCo[j] = False
                    
#                     CoTitleTerms[i] = getWorkTitleTermsFre(i, folderAddress, stopWords)
#                     CoTitleTerms[j] = []
                    
#                     j = 0
                    
#             j += 1
#         i += 1
#         j = i + 1
    
#     #print(Co)
#     return Co

#@profile(precision=4,stream=open('memory_profiler.log','w+'))
def secondStep(Ci, folderAddress, tokenizer, model):
    """
    Require: List Ci of clusters of authorship records
    Ensure: List Co of clusters of authorship records
    """
    
    lim_name = 2    #name threshold
    lim_title = 0.7   #title threshold 
    lim_venue = 2    #venue threshold
    
    Co = Ci[:]
    lenCo = len(Co)
    
    existedCo = [] #this ith file existe or not
    for i in range(lenCo):
        existedCo.append(True)
    
    CoTitleTerms = []
    CoVenueTerms = []
    
    stopWords = set(stopwords.words("english"))
    venueStopWords = {"journal","j","review","reviews","theory","theories"}
    
    for i in range(len(Co)):
        CoTitleTerms.append(getWorkTitleTerms(i, folderAddress, tokenizer, model))
        CoVenueTerms.append(getWorkVenueTerms(i, folderAddress, stopWords, venueStopWords))
    
    i = 0
    j = 1
    while i < lenCo:
        if not existedCo[i] :
            i += 1
            continue
        #print("compare", i, "th Authorship Record Cluster with others")
        while j < lenCo:
            if i == j or (not existedCo[j]):
                j += 1
                continue
            if FirstStep.fragmentComparison(Co[i],Co[j],lim_name):
                #print("compare",i,j)
                if titleSimilarity(CoTitleTerms[i], CoTitleTerms[j], lim_title) or venueSimilarity(CoVenueTerms[i], CoVenueTerms[j], lim_venue):
                    #print("merge",i,j)
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
                    
                    CoTitleTerms[i] += CoTitleTerms[j]
                    addWorkVenueTerms(CoVenueTerms[i], CoVenueTerms[j])
                    CoTitleTerms[j] = None
                    CoVenueTerms[j] = None
                    
                    j = 0
                    
            j += 1
        i += 1
        j = i + 1
        
    tokenizer = None
    model = None
    #print(Co)
    return Co

def folderAddress_save(folderAddress, codeAddress):
    f_name = codeAddress + "/folderAddress.txt"
    f = open(f_name,"w", encoding="utf-8")
    f.write(folderAddress)
    f.close()
    
def folderAddress_read(codeAddress):
    f_name = codeAddress + "/folderAddress.txt"
    f = open(f_name,"r", encoding="utf-8")
    folderAddress = f.read()
    f.close()
    return folderAddress
    
def Ci_save(Ci, codeAddress):
    f_name = codeAddress + "/Ci.txt"
    f = open(f_name,"w", encoding="utf-8")
    for line in Ci:
        f.write(line+'\n')
    f.close()
    return
    
def Ci_read(codeAddress):
    Ci = []
    f_name = codeAddress + "/Ci.txt"
    with open(f_name, "r") as f:
        for line in f:
            Ci.append(line.strip('\n'))
    return Ci

def HHC(AGsAddress,resultAddress):
    """
    Require: address of ambigous groups
    Require: address of results
    Ensure: execute HHC in those ambigous groups
    """

    #make a new folder if resultAddress doesn't exist
    FirstStep.mkdir(resultAddress)

    #the following two lines should be done once !
    #load model and tokenizer
    tokenizer = AutoTokenizer.from_pretrained('allenai/specter')
    model = AutoModel.from_pretrained('allenai/specter')

    start_HHC = time.time()
    for root,dirs,files in os.walk(AGsAddress):
        for name in files: 
            start = time.time()
            (Ci,folderAddress) = FirstStep.firstStep(os.path.join(root, name), os.path.join(resultAddress,os.path.splitext(name)[0]))
            end = time.time()
            print("First Step of HHC for", name, "execute successfully")
            print("runtime of first step is",end - start,"s")
            start = time.time()
            Co = secondStep(Ci, folderAddress, tokenizer, model)
            end = time.time()
            print("Second Step of HHC for", name, "execute successfully")
            print("runtime of second step is",end - start,"s")
            print("total runtime is",end - start_HHC,"s")


#test
if __name__ == '__main__':
    
    start = time.time()
    # # List Ci of clusters of authorship records
    # (Ci,folderAddress) = FirstStep.firstStep("../AGs/dob.json", "../AGs_result/dob")
    # # print(Ci)
    
    # end = time.time()
    # print("runtime of first step is",end - start,"s")

    # folderAddress_save(folderAddress, ".")
    # Ci_save(Ci, ".")
    
    # # Co = secondStepFre(Ci, folderAddress)
    # # print(Co)
    
    # Ci = Ci_read(".")
    # folderAddress = folderAddress_read(".")
    
    # Co = secondStep(Ci, folderAddress)
    # # print(Co)
    
    # end = time.time()
    # print("runtime of second step is",end - start,"s")
    
    print("start")
    HHC("./AGs","./AGs_result")
