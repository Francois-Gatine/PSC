#is json.dump efficient

import ujson
import json_stream

input=open("input folder directory/publications.json")
output_publications=open("output folder directory/AuthorshipRecordsPublications.json",'a')

citationRs = json_stream.load(input)

output_publications.write('[')

#used to write propper json
comma = False


#Variables to keep track of how much has been dealt with
packNumber = 0
currentPackSize = 0
packCapacity = 100000


for citationR in citationRs :

    currentPackSize += 1

    if currentPackSize > packCapacity :
        packNumber += 1
        currentPackSize = 0
        #prints how many citation records have been dealt with
        print(packNumber * packCapacity)

    try :

        #venue
        source=citationR['source']
        venue=source['title']

        if(venue==""):
            continue

        #authors
        citation_authors=citationR['authors']
        #get last name and full name
        authorsLN=[]
        authorsFN=[]

        for author in citation_authors:

            try :
                author_last_name=author['lastName']
                author_name=author['fullName']

                if(author_name==""):
                    continue

                authorsLN.append(author_last_name)
                authorsFN.append(author_name)

            except KeyError :
                continue



        #title
        citationTitle=citationR['title']

        try :
            defaultTitle = citationTitle['default']
        except KeyError :
            continue

        if(defaultTitle==""):
            continue


        #publicationType
        productionType=citationR['productionType']


        if(productionType == "publication"):

            for i in range(len(authorsFN)):

                #puts a comma when needed
                if(comma):
                    output_publications.write(',')
                comma = True

                #dumps all the infos in an authorship record
                dict={}
                dict['author']=authorsFN[i]
                dict['last name']=authorsLN[i]
                dict['coauthors']=[person for person in authorsFN if person!=authorsFN[i]]
                dict['defaultTitle']=defaultTitle
                dict['venue']=venue



                #dummy dump to trigger an exception if there is one
                #then, actual dump
                try :
                    #dummy dump : skips the actual dump if there is an exception
                    exceptionCatcher = ujson.dumps(dict,ensure_ascii=False).encode('utf8')

                    ujson.dump(dict,output_publications,ensure_ascii=False, indent=4)

                except UnicodeEncodeError:
                    print("Unicode error : " + str(packNumber * packCapacity + currentPackSize))
                    print(dict['author'])
                    #to avoid printing too many commas
                    comma = False


    except (KeyError, json_stream.base.TransientAccessException) :
        continue


output_publications.write(']')

input.close()
output_publications.close()