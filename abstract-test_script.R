# file for iteratively creating abstracts

# File 1(this file): Should be an R-Script 
# contains a loop that iteratively calls an Rmarkdown file (i.e. File 2)

# load packages
library(knitr)
library(markdown)
library(rmarkdown)

meld <- read.csv("./submission-subset_2018.csv")#this is a subset of the data
# there are special characters that need to be fixed in full dataset
colnames(meld) = c("submission_time","author_1_first","author_1_mi","author_1_last","email","author_1_affiliation","phone","fax","address","status","moderator","judge","presentation_type","additional_authors","author_2_first","author_2_mi", "author_2_last", "author_2_affiliation","author_3_first", "author_3_mi", "author_3_last", "author_3_affiliation","author_4_first", "author_4_mi", "author_4_last", "author_4_affiliation","author_5_first", "author_5_mi", "author_5_last", "author_5_affiliation","author_6_first", "author_6_mi", "author_6_last", "author_6_affiliation","author_7_first", "author_7_mi", "author_7_last", "author_7_affiliation","author_8_first", "author_8_mi", "author_8_last", "author_8_affiliation","author_9_first", "author_9_mi", "author_9_last", "author_9_affiliation","author_10_first", "author_10_mi", "author_10_last", "author_10_affiliation","title","abstract")


for(i in 1:nrow(meld)){
  rmarkdown::render('abstract-test_markdown.Rmd',  # file 2
                    output_format = 'pdf_document',
                    output_file =  paste(meld$author_1_last[i],'_','MT-AWRA','_',"2018",'_',"abstract", ".pdf", sep=''), 
                    output_dir = './reports')
}#output is found in 'reports' folder