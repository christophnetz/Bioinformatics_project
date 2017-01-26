26-1-2017
Christoph Netz, University of Groningen
Course Practical Bioinformatics for Biologists

The project was conducted to create an automatised pipeline for phylogeny building based on a csv spreadsheet

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

With the files used here, this does not work yet, as the sequence names are too long. 
Hence in order to work, adjustments have to be carried out, either to the sequence names or the PhyML settings.




Example files:

Input: Sphinginae_CSV.csv

after adding masterscript.sh, extr_data.py and R_seqimport.r and making them executable,
run masterscript.sh from the working directory containing the csv File.
It should successfully generate 6 phylip alignment files for each of the sequences in the csv file,
like the ones to be found in the example_files/output folder. Also the resulting, ,manually produced phylogenies are supplied.

The ML calculation does not yet work due to the overlength of sequence names. 
Producing the alignments, however, is the more important step as it reduces the manual workload considerably. 



