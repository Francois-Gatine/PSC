import ujson,unicodedata,json_stream
import os.path
import time

#get execution time
startTime = time.clock()

input=open("/home/arakotoa/Desktop/PSC/AuthorshipRecordsPublications.json")
AuthorshipRs = json_stream.load(input)

#duplication ID, to keep track of which records are duplicated
duplicId=0

#keep track of the number of records dealt with
recordCounter = 0
packNumber = 0
packSize = 100000

#helps to write propper json
newFile = False
newFile2 = False







for AuthorshipR in AuthorshipRs:


    try:

        #print how much is done
        recordCounter += 1
        if(recordCounter > packSize):
            packNumber += 1
            recordCounter = 0
            print(packNumber*packSize)
            print(time.clock()-startTime)



        #lowercase everything, create a string without special characters
        AuthorName = AuthorshipR["author"].lower()
        AuthorNameWithNoAccent=''.join((c for c in unicodedata.normalize('NFD', AuthorName) if unicodedata.category(c) != 'Mn'))

        #remove uexpected blank spaces
        LastName = AuthorshipR["last name"].replace(" ","")




        #create file names
        AuthorNameBlocks = AuthorName.split()
        Identifier = (AuthorNameBlocks[0][0]+LastName[0:2]).lower()
        IdentifierWithNoAccent=''.join((c for c in unicodedata.normalize('NFD', Identifier) if unicodedata.category(c) != 'Mn'))




        #If we create a new file, we should add '[' and no comma
        newFile = not (os.path.isfile("/home/arakotoa/Desktop/PSC/testAmbiGroups/"+Identifier+".json"))




        #store important infos into the dictionary
        dict ={}
        dict['author']=AuthorName
        dict['last name']=LastName
        dict['coauthors']=[person for person in AuthorshipR['coauthors']]
        dict['defaultTitle']=AuthorshipR['defaultTitle']
        dict['venue']=AuthorshipR['venue']




        #if there are special characters, another record with standard characters is created
        #file and fileNoAccent are opened one at a time, to avoid an obscure mixing bug
        if(AuthorName!=AuthorNameWithNoAccent) :

            #Add a new duplication ID, then dump the record twice
            duplicId+=1
            dict['duplicId']=duplicId


            file = open("/home/arakotoa/Desktop/PSC/testAmbiGroups/"+Identifier+".json",'a')

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
            newFile2 = not (os.path.isfile("/home/arakotoa/Desktop/PSC/testAmbiGroups/"+IdentifierWithNoAccent+".json"))


            fileNoAccent = open("/home/arakotoa/Desktop/PSC/testAmbiGroups/"+IdentifierWithNoAccent+".json",'a')

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

            file = open("/home/arakotoa/Desktop/PSC/testAmbiGroups/"+Identifier+".json",'a')

            #adding comma if needed
            if(newFile):
                file.write('[')
            else:
                file.write(',')

            #dump
            dict['duplicId']=0
            ujson.dump(dict,file,ensure_ascii=False, indent=4)
            file.close()

    except ValueError :
        print("Value Error : " + AuthorName)
        continue

input.close()



#adds ']' at the end of every file
for fileName in os.listdir("/home/arakotoa/Desktop/PSC/testAmbiGroups/") :

    file = open("/home/arakotoa/Desktop/PSC/testAmbiGroups/" + fileName, 'a')
    file.write(']')
    file.close()




#duration
print(time.clock()-startTime)

