26-1-2017
Christoph Netz, University of Groningen

code for automatized phylogeny building based on a csv spreadsheet

The code is written in Shell, python and R. 
Dependencies:		python module re	(for regular expressions)
			R library ape		(for GenBank sequence import)
			MAFFT v7.215		(for sequence alignment)
			PhyML 20131022		(for ML phylogeny calculation)

The program is separated into two shell scripts. 

1) The masterscript.sh calls extr_data.py   for data extraction from the csv masterscript.sh
		 	 and R_seqimport.r  for data import from NCBI GenBank.
It then aligns all sequences and finishes in order to allow the user to check the alignment manually.
The script allows for the unlimited addition of further taxa. If the sequence set is changed, 
adjustments will have to be made. 

2) The script tree_calc.sh calculates ML phylogenies for all phylip files in the current working directory. 

With the files used here, this does not work until now, as the sequence names are too long. 
Hence in order to work, adjustments have to be carried out.




