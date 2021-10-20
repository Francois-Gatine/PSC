import json
import json_stream

#identify input and output
input=open("publications_20000.json")
output=open("authorshipRecords.json",'a')

#begin streaming
citationRs = json_stream.load(input)


for citationR in citationRs :

    citationTitle=citationR['title']
    frTitle=citationTitle['fr']
    enTitle=citationTitle['en']
    authors=[]

    for author in citationR['authors'] :
        authors.append(author['fullName'])

    publicationYear=citationR['year']

    #one authorship record per coauthor
    for author in authors :
        dict={}
        dict['author']=author
        dict['coauthors']=[person for person in authors if person!=author]
        dict['publicationYear']=publicationYear
        dict['enTitle']=enTitle
        dict['frTitle']=frTitle

        #dump everything in one authorship record
        json.dump(dict,output,ensure_ascii=False, indent=4)
        output.write(',')


input.close()
output.close()