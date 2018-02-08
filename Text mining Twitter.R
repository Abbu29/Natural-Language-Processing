#Installing packages 

install.packages("tm")
install.packages("twitteR")
install.packages("wordcloud")
install.packages("RColorBrewer")
install.packages("e1017")
install.packages("class")
install.packages("base64enc")
install.packages("devtools")
install.packages("httr")
install.packages("openssl")
install.packages("httpuv")



library(httr)
library(twitteR)
library(openssl)
library(httpuv)
library(twitteR)
library(tm)
library(stringr)
library(dplyr)
library(wordcloud)
library(RColorBrewer)



#Connect to twitter
setup_twitter_oauth(ckey,skey,token,sectoken)
#Search for topic in twitter
soccer.tweets <- searchTwitter("soccer", n=2000, lang="en")
soccer.text <- sapply(soccer.tweets, function(x) x$getText())
#CLean text data
soccer.text <- iconv(soccer.text, 'UTF-8', 'ASCII')
soccer.corpus <- Corpus(VectorSource(soccer.text))
#Create a document term matrix
term.doc.matrix <- TermDocumentMatrix(soccer.corpus,control = list(removePunctuation = TRUE,stopwords = c("soccer","http", stopwords("english")),removeNumbers = TRUE,tolower = TRUE))
#Check out the Matrix
head(term.doc.matrix)
term.doc.matrix <- as.matrix(term.doc.matrix)
#Get word counts
word.freqs <- sort(rowSums(term.doc.matrix), decreasing=TRUE) 
dm <- data.frame(word=names(word.freqs), freq=word.freqs)
#Create word cloud
wordcloud(dm$word, dm$freq, random.order=FALSE, colors=brewer.pal(8, "Dark2"))









head(term.doc.matrix)