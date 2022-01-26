#####Code folder#####

The algorithm functions as follows :


1 - [Preprocessing] (authorshipRecordsProduction.py)
From "publications.json", we output a file containing all authorship records, that is :
each json object corresponds to a publication with a main author, author ID, co-authors, title, venue title.


2 - [Ambiguous Groups] (AmbiguousGroupsFromARs.py)
We group the authorship records by similar author name, which outputs LOTS of files.
(Namely, we match the first letter of the first name, and the first two letters of the last name)

3 - [First Step] (FirstStep.py)
For each ambiguous group, we compare the names of the authors 
by using the fragment comparison function (fragmentComparison).
If the names seem to match and if the authorship records have common co-authors,
the authorship are copied in the same file, called a cluster.

4 - [Second Step] (SecondStep.py)
We compare titles and venue titles between clusters, 
to determine if two clusters have to be merged together.
At the end of the Second Step, authorship records in the same folder should correspond to the same author.


The file CR_AR_AG.json combines [Preprocessing] and [Ambiguous Groups].