---
title: "Bootstrap"
output: html_document
date: '2022-10-17'
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```
data(SAheart )

help(SAheart)

head(SAheart)

SARF <- randomForest(chd ~ . , data=SAheart)

glimpse(SAheart)

SARF <- randomForest(factor(chd)~.,data=SAheart)

summary(SARF)

predict(SARF)

table(SAheart$chd,predict(SARF))

# 321/462
