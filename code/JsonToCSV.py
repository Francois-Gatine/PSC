import json, csv
import os.path

def jsonToCSV(address_json, address_csv):         
    """
    input: the address of json file of ambiguous group, the address of csv file we are to write
    output: convert the content to csv file
    """
    fileInput = open(address_json,'r',encoding='utf8')    #read the json file
    fileOutput = open(address_csv,'w', newline='', encoding='utf-8')  #load csv file
    writer = csv.writer(fileOutput,delimiter='|')

    data = json.load(fileInput)  #load json content

    keys = []           # to collect keys of json
    for row in data:
        writer.writerow(row.keys())
        break

    for row in data:            # to write rows in csv file
        writer.writerow(row.values())
    fileInput.close()
    fileOutput.close()

info_input = 'C:/Users/liu/Documents/GitHub/test/data/dbInfo'
info_output ='C:/Users/liu/Documents/GitHub/test/data/dbInfo_csv'
for AG in os.listdir(info_input):
    AG = AG.split('.')[0]
    jsonToCSV(info_input + '/' + AG + '.json', info_output +'/' + AG + '.csv')


