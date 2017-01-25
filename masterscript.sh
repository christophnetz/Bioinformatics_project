#! /bin/bash

extr_data.py


grep -v "\-\",$" labels.txt > Wgl_labels.txt
grep -v "\-_[^_]*$" labels.txt > Per_labels.txt
grep -v "\-_[^_]*_[^_]*$" labels.txt > EF1a_labels.txt
grep -v "\-_[^_]*_[^_]*_[^_]*$" labels.txt > DDC_labels.txt
grep -v "\-_[^_]*_[^_]*_[^_]*_[^_]*$" labels.txt > CAD_labels.txt
grep -v "\-_[^_]*_[^_]*_[^_]*_[^_]*_[^_]*$" labels.txt > COI_labels.txt


grep -v "\-\".*$" COI_Acc.txt > 2COI_Acc.txt
grep -v "\-\".*$" CAD_Acc.txt > 2CAD_Acc.txt
grep -v "\-\".*$" DDC_Acc.txt > 2DDC_Acc.txt
grep -v "\-\".*$" EF1a_Acc.txt > 2EF1a_Acc.txt
grep -v "\-\".*$" Per_Acc.txt > 2Per_Acc.txt
grep -v "\-\".*$" Wgl_Acc.txt > 2Wgl_Acc.txt


tr -d '\n' < 2COI_Acc.txt > 3COI_Acc.txt
tr -d '\n' < 2CAD_Acc.txt > 3CAD_Acc.txt
tr -d '\n' < 2DDC_Acc.txt > 3DDC_Acc.txt
tr -d '\n' < 2EF1a_Acc.txt > 3EF1a_Acc.txt
tr -d '\n' < 2Per_Acc.txt > 3Per_Acc.txt
tr -d '\n' < 2Wgl_Acc.txt > 3Wgl_Acc.txt

tr -d '\n' < COI_labels.txt > COI_labels2.txt
tr -d '\n' < CAD_labels.txt > CAD_labels2.txt
tr -d '\n' < DDC_labels.txt > DDC_labels2.txt
tr -d '\n' < EF1a_labels.txt > EF1a_labels2.txt
tr -d '\n' < Per_labels.txt > Per_labels2.txt
tr -d '\n' < Wgl_labels.txt > Wgl_labels2.txt


#Removing commata at line end
sed -ie 's/,$//g' 3EF1a_Acc.txt
sed -ie 's/,$//g' EF1a_labels2.txt

sed -ie 's/,$//g' 3Per_Acc.txt
sed -ie 's/,$//g' Per_labels2.txt

#R_seqimport.r


#"/usr/bin/mafft"  --globalpair --maxiterate 1000 --reorder --adjustdirectionaccurately "COI.fasta"  > "al_COI.fasta"
#"/usr/bin/mafft"  --globalpair --maxiterate 1000 --reorder --adjustdirectionaccurately "CAD.fasta"  > "al_CAD.fasta"
#"/usr/bin/mafft"  --globalpair --maxiterate 1000 --reorder --adjustdirectionaccurately "DDC.fasta"  > "al_DDC.fasta"
#"/usr/bin/mafft"  --globalpair --maxiterate 1000 --reorder --adjustdirectionaccurately "EF1a.fasta" > "al_EF1a.fasta"
#"/usr/bin/mafft"  --globalpair --maxiterate 1000 --reorder --adjustdirectionaccurately "Per.fasta"  > "al_Per.fasta"
#"/usr/bin/mafft"  --globalpair --maxiterate 1000 --reorder --adjustdirectionaccurately "Wgl.fasta"  > "al_Wgl.fasta"

