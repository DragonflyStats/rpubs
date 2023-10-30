---
title: "Bootstrap"
output: html_document
date: '2022-10-17'
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```
#using the mtcars data set
#clean/normalize the data
data(mtcars)
mydata = na.omit(mtcars) #deletion of missing
mydata = scale(mydata) #standarize variables

# Determine number of clusters
wss <- (nrow(mydata)-1)*sum(apply(mydata,2,var))
for (i in 2:15) wss[i] <- sum(kmeans(mydata, 
  	centers=i)$withinss)
plot(1:15, wss, type="b", xlab="Number of Clusters",
  ylab="Within groups sum of squares")
# check out the plot


# K-Means Cluster Analysis
fit <- kmeans(mydata, 5) # 5 cluster solution
# get cluster means 
aggregate(mydata,by=list(fit$cluster),FUN=mean)
# append cluster assignment
mydata <- data.frame(mydata, fit$cluster)

#visualize the clustering results
library(cluster) 
clusplot(mydata, fit$cluster, color=TRUE, shade=TRUE, labels=2, lines=0)
