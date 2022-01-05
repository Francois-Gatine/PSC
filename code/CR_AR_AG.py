import ujson,json_stream
import unicodedata
import os.path

# Step 1
# We extract idref values from persons.json and store them in a hashtable

# open persons.json
input=open("/home/arakotoa/Desktop/PSC/persons.json",'r')
publicationsByAuthor = json_stream.load(input)

# create a hashTable :  key = publicationId ; value = {authorId,authorName} itself being a hashtable
publicationTable = {}


#Variables to keep track of how much has been dealt with
packNumber1 = 0
currentPackSize1 = 0
packCapacity1 = 1000


# fill the hashTable by a linear scan using json stream
for publication in publicationsByAuthor :

    #keeping track
    currentPackSize1 += 1
    if currentPackSize1 > packCapacity1 :
        packNumber1 += 1
        currentPackSize1 = 0
        #prints how many citation records have been dealt with
        print("Step 1 : " ,packNumber1 * packCapacity1, " entries done. Dictionary size : ", len(publicationTable))


    publications = publication["publications"]
    publicationIds = []

    #extract all publication ids from persons.json and store them in a list
    for elem in publications :
        publicationIds.append(elem["publication"])

    #main author id and name
    authorId = publication["id"]
    authorName = publication["fullName"]

    #for each publication id, we add them to the hashtable
    for publicationId in publicationIds :
        present = publicationTable.get(publicationId)
        if(present==None) :
            publicationTable[publicationId] = {authorName:authorId}
        else :
            present[authorName]=authorId

# close persons.json
input.close()

print("Step 1 done.")
print("Dictonary size : ", len(publicationTable))






# Step 2
# We generate authorship records from publications.json
# and store them in ambiguous groups


# open publications.json
input = open("/home/arakotoa/Desktop/PSC/publications.json",'r')
publications = json_stream.load(input)


#used to write propper json
newFile = False
newFile2 = False


#duplication ID, to keep track of which records are duplicated
duplicId=0


# counting the number of authors having multiple ids within the same publication
count_different_Ids =0


#Variables to keep track of how much has been dealt with
packNumber2 = 0
currentPackSize2 = 0
packCapacity2 = 10000




# linear scan through publications trying to finding if a matching between publicationIds exist
for citationR in publications :



    #keeping track
    currentPackSize2 += 1
    if currentPackSize2 > packCapacity2 :
        packNumber2 += 1
        currentPackSize2 = 0
        #prints how many citation records have been dealt with
        print("Step 2 : ", packNumber2 * packCapacity2, " entries done.")




    try :
        #citationRiD
        citationRiD = citationR['id']
        authorsWithIds = publicationTable.get(citationRiD)


        #venue
        source=citationR['source']
        venue=source['title']
        if(venue==""):
            # if no venue title exists, move to the next citationR
            continue


        #authors
        citation_authors=citationR['authors']


        #get authors' last name, full name and hopefully idRef
        authorsLN=[]
        authorsFN=[]
        authorsIds=[]

        for author in citation_authors:


            #the "person" field holds the idref Id of the author
            #but doesn't alwais exist. If it doesn't, we replace it with step 1
            DoesPersonExist = False

            #iterates through each field and the corresponding value in the current author
            for field,val in author.items() :
                #idRef if it exists
                if (field=='person') :
                    author_initialId = val
                    DoesPersonExist = True
                elif (field=='lastName') :
                    author_last_name=val
                elif (field=='fullName') :
                    author_name = val

            #if there is no "persons" field
            if(not DoesPersonExist) :
                author_initialId = None

            #if no author name exists, move to the next author
            if(author_name==""):
                continue

            #if the author is not in the hashTable
            #we add a blank ID
            if(authorsWithIds==None or authorsWithIds.get(author_name)==None):

                if(author_initialId != None) :
                    authorsIds.append(author_initialId)
                else :
                    authorsIds.append("")

            #otherwise
            else :
                author_id = authorsWithIds.get(author_name)

                #in case we find more than one ID
                #for the same author
                if (author_id!=None ) :
                    if(author_initialId!=None
                        and author_id != author_initialId) :

                        count_different_Ids+=1

                    authorsIds.append(author_id)

            authorsLN.append(author_last_name)
            authorsFN.append(author_name)



        #title
        citationTitle=citationR['title']


        try :
            defaultTitle = citationTitle['default']
        except KeyError :
            continue

        # if the title is empty, move on to the next citationR
        if(defaultTitle==""):
            continue

        #publicationType : we only process "publication"
        productionType=citationR['productionType']
        if(productionType == "publication"):




            # Step 3 (within Step 2) : store each record in the
            # corresponding ambiguous group



            for i in range(len(authorsFN)):


                #dumps all the infos in an authorship record
                dict={}
                dict['author']=authorsFN[i]
                dict['last name']=authorsLN[i]
                dict['idRef'] = authorsIds[i]
                dict['coauthors']=[person for person in authorsFN if person!=authorsFN[i]]
                dict['defaultTitle']=defaultTitle
                dict['venue']=venue


                # dummy dump to avoid a unicode error
                # if such error is detected, we skip to the next author
                try:
                    exceptionCatcher = ujson.dumps(dict,ensure_ascii=False).encode('utf8')
                except UnicodeEncodeError:
                    print("Unicode error at " + str(packNumber2 * packCapacity2 + currentPackSize2))
                    print(dict['author'])
                    continue



                # lowercase and create a string without special characters
                AuthorName = dict['author']
                AuthorNameWithNoAccent=''.join((c for c in unicodedata.normalize('NFD', AuthorName) if unicodedata.category(c) != 'Mn'))

                #remove unexpected blank spaces
                LastName = dict['last name'].replace(" ","")



                #create file names
                AuthorNameBlocks = AuthorName.split()
                Identifier = (AuthorNameBlocks[0][0]+LastName[0:2]).lower()
                IdentifierWithNoAccent=''.join((c for c in unicodedata.normalize('NFD', Identifier) if unicodedata.category(c) != 'Mn'))




                #If we create a new file, we should add '[' and no comma
                newFile = not (os.path.isfile("/home/arakotoa/Desktop/PSC/AmbiGroups/"+Identifier+".json"))



                #if there are special characters, another record with standard characters is created
                #file and fileNoAccent are opened one at a time, to avoid an obscure mixing bug
                if(AuthorName!=AuthorNameWithNoAccent) :

                    #Add a new duplication ID, then dump the record twice
                    duplicId+=1
                    dict['duplicId']=duplicId


                    file = open("/home/arakotoa/Desktop/PSC/AmbiGroups/"+Identifier+".json",'a')

                    #adding comma if needed, file with special characters
                    if(newFile):
                        file.write('[')
                    else:
                        file.write(',')

                    #dump
                    dict['author']=AuthorName
                    ujson.dump(dict,file,ensure_ascii=False, indent=4)
                    file.close()




                    #repeat new file test for new file
                    newFile2 = not (os.path.isfile("AmbiGroups/"+IdentifierWithNoAccent+".json"))


                    fileNoAccent = open("/home/arakotoa/Desktop/PSC/AmbiGroups/"+IdentifierWithNoAccent+".json",'a')

                    #adding comma if needed, file without special characters
                    if(newFile2):
                        fileNoAccent.write('[')
                    else:
                        fileNoAccent.write(',')


                    #dump
                    dict['author']=AuthorNameWithNoAccent
                    ujson.dump(dict,fileNoAccent,ensure_ascii=False, indent=4)
                    fileNoAccent.close()


                #otherwise, duplication ID is 0, only one dump
                else :

                    file = open("/home/arakotoa/Desktop/PSC/AmbiGroups/"+Identifier+".json",'a')

                    #adding comma if needed
                    if(newFile):
                        file.write('[')
                    else:
                        file.write(',')

                    #dump
                    dict['duplicId']=0
                    ujson.dump(dict,file,ensure_ascii=False, indent=4)
                    file.close()




    except (KeyError, json_stream.base.TransientAccessException) :
        #print("Key Error or transient access error")
        continue



#closing input file
input.close()


#adds ']' at the end of every file
for fileName in os.listdir("/home/arakotoa/Desktop/PSC/AmbiGroups/") :

    file = open("/home/arakotoa/Desktop/PSC/AmbiGroups/" + fileName, 'a')
    file.write(']')
    file.close()


print("Steps 2 and 3 done.")


print(count_different_Ids, " different IDs.")


