#!/usr/bin/env python
# coding: utf-8

# In[ ]:


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
    
    #split by ' '
    c1 = s1.split(' ')
    c2 = s2.split(' ')
    
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

