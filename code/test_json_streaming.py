import json
import json_stream
f=open("C:/Users/aymen/OneDrive/Desktop/test_json_streaming/test.json")
data = json_stream.load(f)
result=data['colors']
for i,elem in enumerate(result):
    print(elem['color'])
f.close()
