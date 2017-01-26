#! /bin/bash

#Christoph Netz, s3268179, 25-1-2017
#Script takes CSV file as input and imports, labels and aligns sequences 


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


#takes accession number and label textfiles 
#and imports Genbank sequences to fasta files

R_seqimport2.r


#remove all text files, only fasta files are needed from now on

rm *.txt


#Alignment of all fasta files in WD, format changed to phylip

for file in *.fasta;
do
"/usr/bin/mafft"  --globalpair --maxiterate 1000 --reorder \
--adjustdirectionaccurately --phylipout --namelength 100 "$file" > "al_$file.phy"
done


#remove all fasta files, only phylip files needed

rm *.fasta


#Give output message

echo "Import and alignment concluded. Check alignments manually!"
