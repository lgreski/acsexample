# acsexample
Example R code for reading American Community Survey state level files, using the Microsoft Excel codebook provided with the data.

# Files in the repository #
<table>
<tr><th>File Name</th><th>Description</th></tr>
<tr><td valign=top>read PUMS codebook.R</td><td>R script to read the American Community Survey Public Use Microdata Survey codebook and a single state's data. The codebook is distributed as a Microsoft Excel spreadsheet. The ACS survey data read is the output from the split PUMS person and households.R script. The script uses read.fwf() to red the survey data. </td></tr>
<tr><td valign=top>read PUMS codebook - readr version.R</td><td>R script to read the American Community Survey Public Use Microdata Survey codebook and a single state's data. The codebook is distributed as a Microsoft Excel spreadsheet. The ACS survey data read is the output from the split PUMS person and households.R script. The script uses Hadley Wickham's readr package read_fwf() function to red the survey data.</td></tr>
<tr><td valign=top>split PUMS person and households.R</td><td>R script to parse the census file and separate into two files for downstream processing: a person-level file and a household-level file. The script uses readLines() and substr() to split the data into the appropriate output files. </td></tr>
</table>
