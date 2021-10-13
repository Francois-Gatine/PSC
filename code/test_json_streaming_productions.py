import json
import json_stream
input=open("C:/Users/aymen/OneDrive/Desktop/test_json_streaming/firstString.json")
output=open("C:/Users/aymen/OneDrive/Desktop/test_json_streaming/authorshipRecords.json",'a')
citationRs = json_stream.load(input)
frTitle=""
enTitle=""
authors=[]
publicationYear=""
dict={}
citationTitle={}
for citationR in citationRs :
    citationTitle=citationR['title']
    frTitle=citationTitle['fr']
    enTitle=citationTitle['en']
    authors=[]
    for author in citationR['authors'] :
        authors.append(author['fullName'])
    publicationYear=citationR['year']
    for author in authors :
        dict={}
        dict['author']=author
        dict['coauthors']=[person for person in authors if person!=author]
        dict['publicationYear']=publicationYear
        dict['enTitle']=enTitle
        dict['frTitle']=frTitle
        json.dump(dict,output,ensure_ascii=False, indent=4)
input.close()
output.close()