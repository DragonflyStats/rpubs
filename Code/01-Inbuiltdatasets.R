---
title: "Bootstrap"
output: html_document
date: '2022-10-17'
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# Code Segment 1 : Looking at some inbuilt Data Sets

# 1. iris
# 2. mtcars
# 3. airquality

############

head(iris)

tail(iris)

#Just numeric variables of iris data set.

iris.num <- iris[,1:4]

var(iris.num)
cor(iris.num)

#############

summary(mtcars)


# What do the variables mean?

help(mtcars)

glimpse(mtcars)

#############

mpgmodel <- lm(mpg ~ cyl + wt, data =mtcars)

summary(mpgmodel)

class(mpgmodel)

#############

summary(airquality)

# notice the NAs.
