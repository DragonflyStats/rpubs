---
title: "Bootstrap"
output: html_document
date: '2022-10-17'
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```
Dist = c(1.4,3.8,7.5,10.2,11.7,15.0)
Merc = c(2.4,2.5,1.3,1.3,0.7,1.2)

# compute the correlation coefficient
cor(Dist, Merc)
cor.test(Dist,Merc)

# create a scatterplot
plot(Dist, Merc)

# create a linear model
myModel = lm(Merc~Dist)
summary(myModel)
coef(myModel)

# enhanced scatterplot
plot(Dist, Merc, pch=16, col=”red”, cex=1.5)
title(“Scatterplot”)

abline(coef(myModel))
#This adds a line to the scatterplot
