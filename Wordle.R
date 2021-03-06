setwd("/Users/mabelfurutsuki/Downloads/Brenner")
#-----------------------------------
# Load Packages
#-----------------------------------
library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")
library("gdata")
library("readxl")

#-----------------------------------
# Read in and Prepare Data
# This part prepares a matrix 
#-----------------------------------
CAGIwordle <- read_excel("CAGI Methods Database v27 8 Feb 17 MKL.xlsx")
abnames <- CAGIwordle$Abbreviation
logcits <- CAGIwordle$`Log(citation)`
towordle <- cbind(abnames, as.numeric(logcits))


#-----------------------------------
# Run Wordle Scripts
#-----------------------------------
seed <- sample(1:10000, 1)
set.seed(seed)
png(height=2500, width=2500, res=500, file=paste(toString(seed), "TestWordle.png"))
wordcloud(words = abnames, freq = logcits, min.freq = 0, scale=c(2,.0001),
          max.words= 100, random.order=TRUE, rot.per=0,
          colors=c(brewer.pal(9, "Reds")[c(3,4, 5, 7, 9)]), fixed.asp=FALSE)


