import os.path, json_stream
import matplotlib.pyplot as plt


'''
Input : a list of file sizes
Produces a graph that shows the files' size distribution
Predicts HHC execution time for quadratic model
'''

sizeDir = "C:/Users/franc/Documents/Polytechnique/2A/PSC/Code/data profile/sizeList.json"


N = 100 #number of bars in the chart
maxSize = 1000000000 #max file size expected ; 1Go for example
minSize = 100000000
res = (maxSize - minSize) // N
v = [0 for i in range(N)] #how many files in each size interval

#json size list
input = open(sizeDir,'r')
j = json_stream.load(input)
sizes = j['sizes']

#HHC time prediction : for each file, time is roughly coeff*size², size in megaBytes
coeff = 0.133
time = 0

#for each file, adds its size to the data
for size in sizes:

    r = (size - minSize) // res

    if(0<=r and r<N):
        v[r] +=1

    time += coeff*(size/1000000)*(size/1000000)


input.close()

print(time)

#plot

x = [minSize + i*res for i in range(N)]

plt.plot(x,v)

plt.title("Group size distribution")

plt.xlabel("size in bytes")
plt.ylabel("number of groups")

plt.show()



