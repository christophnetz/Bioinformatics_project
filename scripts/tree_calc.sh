#! /bin/bash

#Calculate phylogenies from all phylip files in wd. Substitution model GTR

for file in *.phy;
do
phyml -i $file -d nt -n 1 -b 20 -m GTR
done

