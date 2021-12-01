#####Data folder#####

This folder contains data samples from each step of the algorithm.

- "publications_sample.json" : a sample from "publications.json".
Contains information about the articles it references.

- "AR_sample.json" : a sample from the file of all authorship records.
A purified version of publications.json, for which each article has a main author, co-authors, a title and a venue title.
A given publication shows up as many times as it has authors (so that each author is the main author at least once).

- "AG_sample.json" : a sample of an ambiguous group.
In that case, the authors all have their first name beginning with B, and last name beginning with Fe.