---
title: "Bootstrap"
output: html_document
date: '2022-10-17'
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# Regression Modelling



##########################################

FitA <-  lm(Taste ~ Acetic)
FitB <-  lm(Taste ~ H2S)
FitC <-  lm(Taste ~ Lactic)

summary(FitA)

AIC(FitA)

anova(FitA)

Fit1 <-  lm(Taste ~ Acetic + H2S)
Fit2 <-  lm(Taste ~ Acetic + Lactic)
Fit3 <-  lm(Taste ~ H2S + Lactic)
FitAll <-  lm(Taste ~ Acetic + H2S + Lactic)


##########################################

# Stepwise Regression (model building)

model2 <- lm(Taste ~ . , data=Cheeses)

stepAIC(model2,direction="both")

##########################################
# Model Metrics
# modelr R package
rmse(model2,Cheeses)

mae(model2,Cheeses)

rsquare(model2,Cheeses)

qae(model2,Cheeses)

# Akaike information criterion
AIC(model2)
# Bayesian information criterion
BIC(model2)

##########################################
# Broom R package
tidy(model2)

##########################################

# Broom R package
augment(model2,Cheeses)

##########################################
