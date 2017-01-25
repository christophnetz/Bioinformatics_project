#! /bin/bash

#Christoph Netz, s3268179, 25-1-2017

#creates text files from csv table 
#containing sequence labels (labels.txt) 
#and accession numbers (COI, CAD, DDC, EF1a, Per, Wgl, $_Acc.txt
extr_data.py

#create label file for the respective sequence by extracting non-missing sequence labels
grep -v "\-\",$" labels.txt > Wgl_labels.txt
grep -v "\-_[^_]*$" labels.txt > Per_labels.txt
grep -v "\-_[^_]*_[^_]*$" labels.txt > EF1a_labels.txt
grep -v "\-_[^_]*_[^_]*_[^_]*$" labels.txt > DDC_labels.txt
grep -v "\-_[^_]*_[^_]*_[^_]*_[^_]*$" labels.txt > CAD_labels.txt
grep -v "\-_[^_]*_[^_]*_[^_]*_[^_]*_[^_]*$" labels.txt > COI_labels.txt


#remove missing accession numbers from accession number files
#keep only modified version
for file in *Acc.txt;
do
grep -v "\-\".*$" $file > 2$file
rm $file
done

#Remove line endings in all text files
#keep only modified files
for file in *.txt; 
do
tr -d '\n' < $file > 3$file
rm $file
done


#Removing commata at line end
sed -ie 's/,$//g' *.txt

#Remove *.txte files that are produced by 'sed'
rm *.txte

#R_seqimport.r



#Alignment

for file in *.fasta;
do
"/usr/bin/mafft"  --globalpair --maxiterate 1000 --reorder \
--adjustdirectionaccurately --phylipout --namelength 200 "$file" > "al_$file.phy"
done

#"/usr/bin/mafft"  --globalpair --maxiterate 1000 --reorder --adjustdirectionaccurately "COI.fasta"  > "al_COI.fasta"
#"/usr/bin/mafft"  --globalpair --maxiterate 1000 --reorder --adjustdirectionaccurately "CAD.fasta"  > "al_CAD.fasta"
#"/usr/bin/mafft"  --globalpair --maxiterate 1000 --reorder --adjustdirectionaccurately "DDC.fasta"  > "al_DDC.fasta"
#"/usr/bin/mafft"  --globalpair --maxiterate 1000 --reorder --adjustdirectionaccurately "EF1a.fasta" > "al_EF1a.fasta"
#"/usr/bin/mafft"  --globalpair --maxiterate 1000 --reorder --adjustdirectionaccurately "Per.fasta"  > "al_Per.fasta"
#"/usr/bin/mafft"  --globalpair --maxiterate 1000 --reorder --adjustdirectionaccurately "Wgl.fasta"  > "al_Wgl.fasta"

echo "Check alignments manually!"
