---
title: "Bootstrap"
output: html_document
date: '2022-10-17'
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

library(VGAM)

library(pscl)

hospital <- read.csv("https://raw.githubusercontent.com/RWorkshop/workshopdatasets/master/hospitalstay.csv")

head(hospital)

summary(hospital)

mean(hospital$stay);var(hospital$stay)

m1 <- vglm(stay ~ age + hmo + died,
   family = pospoisson(),
   data = hospital)
summary(m1)

testData <- hospital[c(5,6,12,19),]
testData

predict(m1, testData)

summary(m1)
