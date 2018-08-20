# file for iteratively making 

# File 1: Should be an R-Script 
# contains a loop that iteratively calls an Rmarkdown file (i.e. File 2)

# load packages
library(knitr)
library(markdown)
library(rmarkdown)

meld <- read.csv("./TheAbstractSubmissions2018.csv")

first_author_name <- paste(meld$a, meld$b,sep = "")
MI = meld$MI; for(i in MI){
  if(is.na(MI[i]) == ""){
  }  else(MI == MI[i])
}
MI = gsub("[[:punct:]]", "", MI)#remove any '.' or other punctuation
author_name = stringr::str_to_title(paste(meld$a, MI, meld$b))#standardize the capitalization

first_coauthor = meld[,c( "g", "h")];second_coauthor = meld[,c("j", "k")]; third_coauthor = meld[, c("m", "n")];fourth_coauthor = meld[,c("p", "q")]; fifth_coauthor = meld[,c("s", "t")];sixth_coauthor= meld[,c("v", "w")]

coauthors = meld[,c("g", "h","j", "k","m", "n","p", "q","s", "t","v", "w")];coauthors$x = ""
title = meld[,'title']

names = list()
for (i in 1:length(author_name)){
  z = min(which(apply(coauthors[i,], MARGIN = 2, ragtop::is.blank)))
  
  names[i] = coauthors[i,1:as.numeric(z)];return(as.data.frame(unlist(names)))
}

for(i in 1:nrow(meld)){
  rmarkdown::render('test.Rmd',  # file 2
                      output_file =  paste("report_", '_', Sys.Date(), ".html", sep=''), 
                      output_dir = '/Users/majerus/Desktop/R/auto_reporting/test/reports')
}