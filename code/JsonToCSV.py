import json, csv

def jsonToCSV(address_json, address_csv):         
    """
    input: the address of the .json file of ambiguous group
    output: 
    """
    fileInput = open(address_json,'r',encoding='utf8')    #open the json file
    fileOutput = open(address_csv,'w')  #load csv file
    writer = csv.writer(fileOutput)

    data = json.load(fileInput)  #load json content

    keys = []           # to collect keys of json
    for row in data:
        keys = row.keys()
        writer.writerow(keys)
        break

    for row in data:            # to write rows in csv file
        writer.writerow(row.values())

    fileInput.close()
    fileOutput.close()

jsonToCSV('../data/Info/ceb.json', '../data/Info/ceb.csv')


