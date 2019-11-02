## Read PUMS codebook & data
## author: Len Greski
## date: 16 August 2015
## prerequisites: split the REVISEDPUMS5_36.TXT file into two separate files,
##                one for persons, and one for households
##
## NOTE: n = 953076 in read.fwf() to have program read a fixed number of records, reducing
##       memory allocation. File is 330Mb in size  
##
## Prerequisite: download the 5PCT PUMS record layout spreadsheet from 
##               http://www2.census.gov/census_2000/datasets/PUMS/FivePercent/5%25_PUMS_record_layout.xls
##


startTime <- Sys.time()

# readxl version
library(readxl)
cellRange <- "A2:G1219"
codeBook <- read_xls("./data/5%_PUMS_record_layout.xls",
                    sheet=2,
                    range=cellRange)

## remove blank rows
codeBook <- codeBook[!is.na(codeBook$VARIABLE),]
## remove duplicate rows 
library(data.table)
codeBook <- unique(as.data.table(codeBook))

## remove NA rows by setting length to a numeric variable, and processing
## with !is.na
codeBook$LEN <- as.numeric(codeBook$LEN)
codeBook <- codeBook[!is.na(codeBook$LEN)]

## set widths vector to LEN (length) column 
colWidths <- codeBook$LEN

## set column names to the VARIABLE column in codebook
colNames <- codeBook$VARIABLE
## read PUMS data previously separated by split PUMS R script
personData <- read.fwf("./data/PUMS_person_NY.txt", 
                       colWidths,
                       header=FALSE,
                       n=953076,
                       col.names = colNames,
                       stringsAsFactors=FALSE)
endTime <- Sys.time()
endTime - startTime
print(object.size(personData),units="Mb")
