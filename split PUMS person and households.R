## Read PUMS data and separate P records from H records
## author: Len Greski
## date: 15 August 2015
## prerequisites: download https://www2.census.gov/census_2000/datasets/PUMS/FivePercent/New_York/REVISEDPUMS5_36.TXT from U.S. Census website
##                to ./data subdirectory under R working directory
##
## NOTE: raw data file is 410Mb in size, this will take a while on smaller machine, and 
##       it generates an R data object that is 460.5Mb
## 
## NOTE: raw data file contains 1,366,081 records 
##  

if(!file.exists("./data/REVISEDPUMS5_36.TXT")){
  download.file("https://www2.census.gov/census_2000/datasets/PUMS/FivePercent/New_York/REVISEDPUMS5_36.TXT",
                "./data/REVISEDPUMS5_36.TXT",
                method="curl",
                mode="w")
}
if(!file.exists("./data/5%_PUMS_record_layout.xls")) {
  download.file("https://www2.census.gov/census_2000/datasets/PUMS/FivePercent/5%_PUMS_record_layout.xls",
                "./data/5%_PUMS_record_layout.xls",
                method="curl",
                mode="wb")
}

inFile <- "./data/REVISEDPUMS5_36.TXT"
outputPersonFile <- "./data/PUMS_person_NY.txt"
outputHouseholdFile <- "./data/PUMS_household_NY.txt"

system.time(theInput <- readLines(inFile,n = -1))
system.time(theResult <- lapply(theInput,function(x) {
     if(substr(x,1,1)=="P") {cat(x,file=outputPersonFile,sep="\n",append=TRUE)}
     else {cat(x,file=outputHouseholdFile,sep="\n",append=TRUE)}
}))
print(object.size(theInput),units="Mb")