# file for iteratively making 

# File 1: Should be an R-Script 
# contains a loop that iteratively calls an Rmarkdown file (i.e. File 2)

# load packages
library(knitr)
library(markdown)
library(rmarkdown)

meld <- read.csv("./TheAbstractSubmissions2018.csv")

#for(i in 1:nrow(meld)){
for(i in 1:nrow(meld)){
  rmarkdown::render('abstract-test_markdown.Rmd',  # file 2
                    output_file =  paste("report_",i,'_', Sys.Date(), ".pdf", sep=''), 
                    output_dir = './reports')
}
droplevels(meld[1,'abstract'])
