#! /usr/bin/env python

#this program reads in a file, displays its header
#and creates text files containing sequence labels and accession numbers

import re 		#Loads regular expression module

#Set input 
InFileName = 'Sphinginae_CSV.csv'


InFile = open(InFileName, 'r')


#Specify Output file names
OutFileName = 'labels.txt'
COI_Acc_Name = 'COI_Acc.txt'
CAD_Acc_Name = 'CAD_Acc.txt'
DDC_Acc_Name = 'DDC_Acc.txt'
EF1a_Acc_Name = 'EF1a_Acc.txt'
Per_Acc_Name = 'Per_Acc.txt'
Wgl_Acc_Name = 'Wgl_Acc.txt'

#Open output file streams
OutFile = open(OutFileName, 'w')
COI_Acc = open(COI_Acc_Name, 'w')
CAD_Acc = open(CAD_Acc_Name, 'w')
DDC_Acc = open(DDC_Acc_Name, 'w')
EF1a_Acc = open(EF1a_Acc_Name, 'w')
Per_Acc = open(Per_Acc_Name, 'w')
Wgl_Acc = open(Wgl_Acc_Name, 'w')


#Initialize index
LineNumber = 0

for Line in InFile:
  
  if LineNumber > 0:
  
    Line=Line.strip('\n')
    Line=Line.strip('\r')
    ElementList = Line.split(',')
    
    SubFind = r"\s"
    SubReplace = r"_"
    Taxon = re.sub(SubFind,SubReplace,ElementList[0])
    SubFind2 = r"(\w+);.+"
    SubReplace2 = r"\1"
    Origin_1 = re.sub(SubFind2, SubReplace2, ElementList[1])
    Origin = re.sub(SubFind,SubReplace,Origin_1)
    Voucher = ElementList[2]
    COI     = ElementList[3]
    CAD     = ElementList[4]
    DDC     = ElementList[5]
    EF1a    = ElementList[6]
    Per     = ElementList[7]
    Wgl     = ElementList[8]
  
    
    
    
    LabelString = ('"'+Taxon+'_'+Origin+'_'+Voucher+'_'+COI+'_'+CAD+'_'+DDC+'_'+EF1a+'_'+Per+'_'+Wgl+'"'+',\n')      
    OutFile.write (LabelString)
    COI_Acc.write ('"'+COI+'"'+',\n')
    CAD_Acc.write ('"'+CAD+'"'+',\n')
    DDC_Acc.write ('"'+DDC+'"'+',\n')
    EF1a_Acc.write('"'+EF1a+'"'+',\n')
    Per_Acc.write ('"'+Per+'"'+',\n')
    Wgl_Acc.write ('"'+Wgl+'"'+',\n')
    
    
  LineNumber +=1



InFile.close()
OutFile.close()
COI_Acc.close()
CAD_Acc.close()
DDC_Acc.close()
EF1a_Acc.close()
Per_Acc.close()
Wgl_Acc.close()
