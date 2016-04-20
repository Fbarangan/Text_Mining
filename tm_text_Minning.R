# This is a sample on text minning using TM package.
install.packages('wordcloud')
install.packages('tm')

library(tm)
library(wordcloud)

# check directory
dir()
# Change file name

reviews <- read.csv("testNewSharepoint.csv", stringsAsFactors = FALSE)
str(reviews)

review_text <- paste(reviews$text, collapse=" ")

review_source <- VectorSource(review_text)

corpus <- Corpus(review_source)
corpus <- tm_map(corpus, content_transformer(tolower))

corpus <- tm_map(corpus, removePunctuation)

corpus <- tm_map(corpus, stripWhitespace)

corpus <- tm_map(corpus, removeWords, stopwords(“english”))

dtm <- DocumentTermMatrix(corpus)

dtm2 <- as.matrix(dtm)

frequency <- colSums(dtm2)

frequency <- sort(frequency, decreasing=TRUE)

head(frequency)


words <- names(frequency)

wordcloud(words[1:100], frequency[1:100])
