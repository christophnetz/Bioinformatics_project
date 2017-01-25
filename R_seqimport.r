#! /usr/bin/env R


#! /usr/bin/env R

library(ape)



Acc <- scan("3COI_Acc.txt", what="character",sep=",")
labels <- scan("COI_labels2.txt", what="character",sep=",")

seq_data <- read.GenBank(Acc, seq.names = labels)


write.dna(seq_data, file ="COI.fasta", format = "fasta", append =
            FALSE, nbcol = 6, colsep = " ", colw = 10)
###########################

Acc <- scan("3CAD_Acc.txt", what="character",sep=",")
labels <- scan("CAD_labels2.txt", what="character",sep=",")

seq_data <- read.GenBank(Acc, seq.names = labels)


write.dna(seq_data, file ="CAD.fasta", format = "fasta", append =
            FALSE, nbcol = 6, colsep = " ", colw = 10)
######################################
Acc <- scan("3DDC_Acc.txt", what="character",sep=",")
labels <- scan("DDC_labels2.txt", what="character",sep=",")

seq_data <- read.GenBank(Acc, seq.names = labels)


write.dna(seq_data, file ="DDC.fasta", format = "fasta", append =
            FALSE, nbcol = 6, colsep = " ", colw = 10)

###################################
Acc <- scan("3EF1a_Acc.txt", what="character",sep=",")
labels <- scan("EF1a_labels2.txt", what="character",sep=",")

seq_data <- read.GenBank(Acc, seq.names = labels)


write.dna(seq_data, file ="EF1a.fasta", format = "fasta", append =
            FALSE, nbcol = 6, colsep = " ", colw = 10)
#############################
Acc <- scan("3Per_Acc.txt", what="character",sep=",")
labels <- scan("Per_labels2.txt", what="character",sep=",")

seq_data <- read.GenBank(Acc, seq.names = labels)


write.dna(seq_data, file ="Per.fasta", format = "fasta", append =
            FALSE, nbcol = 6, colsep = " ", colw = 10)
###############################

Acc <- scan("3Wgl_Acc.txt", what="character",sep=",")
labels <- scan("Wgl_labels2.txt", what="character",sep=",")

seq_data <- read.GenBank(Acc, seq.names = labels)


write.dna(seq_data, file ="Wgl.fasta", format = "fasta", append =
            FALSE, nbcol = 6, colsep = " ", colw = 10)
