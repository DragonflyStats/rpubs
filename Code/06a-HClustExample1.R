---
title: "Bootstrap"
output: html_document
date: '2022-10-17'
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

means <- sample(c(-3, 0, 3), 99, replace=TRUE)
means <- sample(c(-3, 0, 3), 99, replace=TRUE)
x <- rnorm(99, mean=means)
#to check if we simulated the data correctly, call
#tapply(x, factor(means), mean)

d <- dist(x)
hc <- hclust(d)

#plot the clustering result
plot(hc)
rect.hclust(hc, k=3, border="red")

#check identified clusters
clust <- cutree(hc, k=3)
plot(x ~ factor(means), main="Original Clusters", xlab="Cluster Mean")
plot(x ~ factor(clust), main="Identified Clusters", xlab="Cluster Number")
