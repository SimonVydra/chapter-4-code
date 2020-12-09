#IMPORTS
library(quanteda)
library(feather)
library(stm)
library(dplyr)
library(LDAvis)

#Read the dataframe exported from python
df <- read_feather('C:/STM/dataframe.feather')
texts <- pull(df, var='Text')
metadata <- df[, c(7, 4, 5)]

#Tokenize to replicate data in python and convert to appropriate format
tokens <- tokens(texts, what=c("fastestword"))
corpus <- dfm(tokens, stem=FALSE)
out <- convert(corpus, to=c('stm'), docvars=docvars(corpus))

#Training the model  
topicno <- 35
model <- stm(corpus, K=35, data=metadata, 
                  verbose=TRUE, init.type = "Spectral")

#Generating LDAvis visualisation
visual <- toLDAvis(model, out$documents, reorder.topics=FALSE, lambda.step=1.1, out.dir="35_TEST_CTM") #out.dir="name" to save the visualisation



#THE FOLLOWING GENERATES ADDITIONAL INFORMATION NOT PRESENTED IN THE PAPER
#Generating topic summaries
plot(model, type = "summary", xlim = c(0, 0.3))


#Showing topics correlations
topic_cors <- topicCorr(model, method=c('simple'), verbose=TRUE, cutoff=0.05)
plot(topic_cors, vlabels=as.character(1:topicno))


#Estimating effect of metadata
prep <- estimateEffect(formula=1:topicno ~ Followers+Frequency+s(Days), stmobj=model35, metadata=metadata, uncertainty="Global")
summary(prep, topics = 1)


#Example plot of topic prevalence across time
plot(prep, "Days", method = "continuous", topics = c(), model = model35, 
     xaxt = "n", xlab = "Time", labeltype = "custom", main = "Topic proportion across time",
     custom.labels = c(""))
monthseq <- seq(from = as.Date("2018-08-01"), to = as.Date("2019-08-01"), by = "month")
monthnames <- months(monthseq)
axis(1,at = as.numeric(monthseq) - min(as.numeric(monthseq)), labels = monthnames)




