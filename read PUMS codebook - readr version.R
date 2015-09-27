## Read PUMS codebook & data
## author: Len Greski
## date: 16 August 2015
## prerequisites: split the REVISEDPUMS5_36.TXT file into two separate files,
##                one for persons, and one for households
##
## NOTE: n_max = 953076 in read_fwf() to tell R how much memory to allocate in advance,
##       improving performance  
##
startTime <- Sys.time()
library(xlsx)
library(readr)
## using vgrep() determine the row and column indexes
## reference: http://www.jargon.net/jargonfile/v/vgrep.html
## note that column names are in row 2
colIndex <- 1:7
rowIndex <- 2:1219
codeBook <- read.xlsx("./data/5pct_PUMS_record_layout.xls",
                      sheetIndex=2,
                      colIndex=colIndex,
                      rowIndex=rowIndex,
                      stringsAsFactors=FALSE)
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
codeBookTime <- Sys.time()
cat("Code book processing time")
codeBookTime - startTime
## use Wickham's readr package to read the data 
personData <- read_fwf("./data/PUMS_person_NY.txt", 
                       fwf_widths(colWidths, col_names=colNames),
                       n_max=953076)
endTime <- Sys.time()
cat("total run time")
endTime - startTime
cat("file load time")
endTime - codeBookTime
print(object.size(personData),units="Mb")
