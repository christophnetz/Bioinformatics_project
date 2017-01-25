#! /usr/bin/env python

#this program reads in a file, displays its header
#and creates text files containing sequence labels and accession numbers

import re 		#Loads regular expression module

#Set input 
InFileName = 'Sphinginae_CSV.csv'
#InFileName = raw_input("Enter file name: ")

InFile = open(InFileName, 'r')
InFile.readline()



OutFileName = 'labels.txt'
COI_Acc_Name = 'COI_Acc.txt'
CAD_Acc_Name = 'CAD_Acc.txt'
DDC_Acc_Name = 'DDC_Acc.txt'
EF1a_Acc_Name = 'EF1a_Acc.txt'
Per_Acc_Name = 'Per_Acc.txt'
Wgl_Acc_Name = 'Wgl_Acc.txt'
OutFile = open(OutFileName, 'w')
COI_Acc = open(COI_Acc_Name, 'w')
CAD_Acc = open(CAD_Acc_Name, 'w')
DDC_Acc = open(DDC_Acc_Name, 'w')
EF1a_Acc = open(EF1a_Acc_Name, 'w')
Per_Acc = open(Per_Acc_Name, 'w')
Wgl_Acc = open(Wgl_Acc_Name, 'w')

LineNumber = 0

for Line in InFile:
  
  if LineNumber > 0:
  
    Line=Line.strip('\n')
    Line=Line.strip('\r')
    ElementList = Line.split(',')
    
    SubFind = r"(\w+)\s(\w+)"
    SubReplace = r"\1_\2"
    Taxon = re.sub(SubFind,SubReplace,ElementList[0])
    SubFind2 = r"(\w+);.+"
    SubReplace2 = r"\1"
    Origin = re.sub(SubFind2, SubReplace2, ElementList[1])
    Voucher = ElementList[2]
    COI     = ElementList[3]
    CAD     = ElementList[4]
    DDC     = ElementList[5]
    EF1a    = ElementList[6]
    Per     = ElementList[7]
    Wgl     = ElementList[8]
  
    
    
    
    LabelString = ('"'+Taxon+'_'+Origin+'_'+Voucher+'_'+COI+'_'+CAD+'_'+DDC+'_'+EF1a+'_'+Per+'_'+Wgl+'"'+',\n')      
    OutFile.write (LabelString)
    COI_Acc.write (',\n'+'"'+COI+'"'+',\n')
    CAD_Acc.write (',\n'+'"'+CAD+'"'+',\n')
    DDC_Acc.write (',\n'+'"'+DDC+'"'+',\n')
    EF1a_Acc.write(',\n'+'"'+EF1a+'"'+',\n')
    Per_Acc.write (',\n'+'"'+Per+'"'+',\n')
    Wgl_Acc.write (',\n'+'"'+Wgl+'"'+',\n')
    
    
  LineNumber +=1



InFile.close()
OutFile.close()
COI_Acc.close()
CAD_Acc.close()
DDC_Acc.close()
EF1a_Acc.close()
Per_Acc.close()
Wgl_Acc.close()
