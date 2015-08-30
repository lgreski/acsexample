## Read PUMS data and separate P records from H records
## author: Len Greski
## date: 15 August 2015
## prerequisites: download http://www2.census.gov/census_2000/datasets/PUMS/FivePercent/New_York/REVISEDPUMS5_36.TXT from U.S. Census website
##                to ./data subdirectory under R working directory
##
## NOTE: raw data file is 410Mb in size, this will take a while on smaller machine, and 
##       it generates an R data object that is 460.5Mb
## 
## NOTE: raw data file contains 1,366,081 records 
##  
inFile <- "./data/REVISEDPUMS5_36.TXT"
outputPersonFile <- "./data/PUMS_person_NY.txt"
outputHouseholdFile <- "./data/PUMS_household_NY.txt"

theInput <- readLines(inFile,n = -1)
theResult <- lapply(theInput,function(x) {
     if(substr(x,1,1)=="P") {cat(x,file=outputPersonFile,sep="\n",append=TRUE)}
     else {cat(x,file=outputHouseholdFile,sep="\n",append=TRUE)}
})
print(object.size(theInput),units="Mb")