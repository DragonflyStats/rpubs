---
title: "Bootstrap"
output: html_document
date: '2022-10-17'
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```
# Robust Regression

require(MASS)

#####################

Fit2.rr = rlm(Taste ~ Acetic + Lactic)

summary(Fit2.rr)

Weights( Fit2.rr )

#####################
