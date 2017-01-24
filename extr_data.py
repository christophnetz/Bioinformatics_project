#! /usr/bin/env python

#this program reads in a file, displays its header
#and creates text files containing sequence labels and accession numbers

import re 		#Loads regular expression module

#Set input 
InFileName = raw_input("Enter file name: ")

InFile = open(InFileName, 'r')
