#####Code folder#####

The algorithm functions as follows :


1 - [Preprocessing] [Ambiguous Groups] (preprocessing.py)
From "publications.json" and "persons.json", we output a file containing all authorship records, that is :
each json object corresponds to a publication with a main author, author ID, co-authors, title, venue title.

We group the authorship records by similar author name, which outputs LOTS of files (15,000).
(Namely, we match the first letter of the first name, and the first two letters of the last name)


2 - [First Step] (FirstStep.py)
For each ambiguous group, we compare the names of the authors 
by using the fragment comparison function (fragmentComparison).
If the names seem to match and if the authorship records have common co-authors,
the authorship are copied in the same file, called a cluster.


3 - [Second Step] (SecondStep.py)
We compare titles and venue titles between clusters, 
to determine if two clusters have to be merged together.
At the end of the Second Step, authorship records in the same folder should correspond to the same author.


4- [IdRef_2]
We first extract only the necessary data (ClustersInfo.py) : from each AG, we write a json file
that contains, for all clusters in the group, the list of IdRefs and DuplicIds that they contain.

We apply fusion.py to merge all Clusters sharing DuplicIds : each group then contains all the information
about the authors that appear in it. We finally clean the data (databaseInfo.py) for it to be converted
into CSV (JsonToCSV.py).

We import the CSV file in a PostgreSQL database and use it to detect anomalies (IdRef_2.py)


[Additionnal files]
 - dataProfile.py produces the graphs showing the number of files per range of size. It uses
the list of sizes from all the AG.
 - librairies.txt lists the librairies we used, and the commands / urls related to them