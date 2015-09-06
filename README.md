# American Community Survey Example
* [Problem Summary](#summary)
* [Repository Contents](#contents)
* [Key Concepts from Getting and Cleaning Data](#concepts)

<h1 id=summary>Problem Summary </h1>
During the August 2015 session for Coursera Johns Hopkins University *Getting and Cleaning Data* course, a question about how to read data from the 2000 American Community Survey Public Use Microdata Sample \(PUMS\) was posted to the Discussion Forum. The PUMS data includes both household and person level data in a single file. The original question raised by a student was, "How do I subset all the rows whose first character is 'P'?"

The initial responses from other students explained how the file is a fixed length file that should be read with <code>read.fwf()</code>, and referred him to the [2000 ACS PUMS codebook](http://www2.census.gov/census_2000/datasets/PUMS/FivePercent/5%25_PUMS_record_layout.xls).

Pointing the student to the codebook was not sufficient for him to solve the problem on his own.  Since the problem was an interesting "real world" application of the material covered in *Getting and Cleaning Data,* we developed the solution that is stored within this Github repository.

<h1 id=contents>Repository Contents</h1>
The [lgreski/acsexample](https://github.com/lgreski/acsexample) repository includes three files that can be used to read the data from a single state's contribution to the [2000 American Community Survey Public Use Microdata Sample](http://www2.census.gov/census_2000/datasets/PUMS/FivePercent/). The [American Community Survey](https://www.census.gov/programs-surveys/acs/technical-documentation/pums.html) includes extensive documentation, ranging from code books to user notes and errata. A complete inventory of all available [PUMS data](https://www.census.gov/programs-surveys/acs/data/pums.html) is also available on the U.S. Census Bureau website.

<table>
<tr><th>File Name</th><th>Description</th></tr>
<tr><td valign=top>read PUMS codebook.R</td><td>R script to read the American Community Survey Public Use Microdata Sample codebook and a single state's data. The codebook is distributed as a Microsoft Excel spreadsheet. The ACS survey data read is the output from the split PUMS person and households.R script. The script uses <code>read.fwf()</code> to read the survey data. </td></tr>
<tr><td valign=top>read PUMS codebook - readr version.R</td><td>R script to read the American Community Survey Public Use Microdata Sample codebook and a single state's data. The codebook is distributed as a Microsoft Excel spreadsheet. The ACS survey data read is the output from the split PUMS person and households.R script. The script uses Hadley Wickham's <code>readr</code> package <code>read_fwf()</code> function to read the survey data.</td></tr>
<tr><td valign=top>split PUMS person and households.R</td><td>R script to parse the census file and separate into two files for downstream processing: a person-level file and a household-level file. The script uses <code>readLines()</code> and <code>substr()</code> to split the data into the appropriate output files. </td></tr>
</table>

<h1 id=concepts>Key Concepts from Getting and Cleaning Data</h1>

Techniques for reading data from a variety of sources are covered during weeks one and two, including XML, JSON, Excel files, application APIs, and other sources.

One of the key challenges faced by students in the Johns Hopkins Data Science Specialization is how to generalize the teaching of a specific technique to make it usable to solve problems beyond the specific example\(s\) demonstrated in the lectures.  

As a learning exercise, the solution posted for reading the PUMS data is noteworthy because it combines three techniques into an elegant solution for reading this data in R, including:

  1. Use of <code>readLines()</code> to split the data into household and person level records,
  2. Use of <code>read.xlsx()</code> to generate the content required as arguments to <code>read.fwf()</code>, and
  3. Use of <code>readr::read_fwf()</code> instead of <code>read.fwf()</code> to reduce the data load time from 19 minutes to 9 seconds on a laptop with an Intel i5 processor.

<h1 id=process>The Process</h1>
To build a data frame that contains the perso-level data from a particular state's PUMS raw data file, we must complete a sequence of three steps, as illustrated below.

<img src="activity diagram.png" alt="Drawing" style="width: 350px;" /> 
