#! /usr/bin/env Rscript


#Load library for seq import
library(ape) 

#specify sequences that shall be imported
seqtype = c("COI", "CAD", "DDC", "EF1a", "Per", "Wgl")

#loop over vector with desired sequences
for (i in seqtype){
  print (i)  #print sequence

  #Load character vector containing accession numbers
  Acc <- scan(paste0("32", i, "_Acc.txt"), what="character",sep=",")
  
  #Load character vector containing labels (same order as acc. num!)
  labels <- scan(paste0("3", i, "_labels.txt"), what="character",sep=",")
  
  #import GenBank sequences Acc with labels 'labels' to object seq_data
  seq_data <- read.GenBank(Acc, seq.names = labels)
  
  #write object to fasta file
  write.dna(seq_data, file =paste0(i, ".fasta"), format = "fasta", append =
              FALSE, nbcol = 6, colsep = " ", colw = 10)
}

