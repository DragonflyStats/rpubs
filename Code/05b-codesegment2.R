---
title: "Bootstrap"
output: html_document
date: '2022-10-17'
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

irisdata <- iris[,1:4]

#pick numeric variables only

kmeans(irisdata,3)

# 3 cluster solution

clus3 <- kmeans(irisdata,3)

# save it as an object
# clus3 : Three cluster solution

class(clus3)

names(clus3)

clus3$totss
clus3$withinss
clus3$betweenss
clus3$tot.withinss

#minimizing within SS is desirable.
#try to do this with as few cluster as possible


withinSSvalues <- numeric()
for(i in 2:10){
withinSSvalues <- c(withinSSvalues,kmeans(irisdata,i)$tot.withinss)
}


withinSSvalues

plot(withinSSvalues,type="l")
