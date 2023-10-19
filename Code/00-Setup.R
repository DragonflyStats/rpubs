---
title: "Bootstrap"
output: html_document
date: '2022-10-17'
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```
#Install some R packages
install.packages(c("modelr","broom","VGAM","magrittr","WVPlots","MethComp"))
install.packages(c("pscl","nnet"))
install.packages(c("glm2","faraway","boot"))
install.packages(c("outliers","nortest"))
# install.packages("tidyverse")
install.packages("randomForest")
install.packages("mlbench")
install.packages("ElemStatLearn")

# Regression Packages
install.packages("truncreg")   #Truncated Regression
install.packages("car")        #Model Diagnostics
#######################################################

# tidyverse packages
library(dplyr)
library(tidyr)       # Spread and Gather commands
library(magrittr)    # %>% Pipe operator
library(purrr)       # Map Function
library(readr)       # importing Data Sets
library(ggplot2)     # Graphs + diamonds data set 

library(broom)       # tidy stats output
library(modelr)      # RMSE, Rsquare etc

library(foreign)     # Importing Data (stata files)

library(outliers)    # Testing Outliers (Grubbs Test for outliers)
library(nortest)     # Testing Normality (Anderson Darling Test)

library(MethComp)    # Deming Regression. Also we are going to use a dataset from these package.
library(MASS)        # important functions for modelling contained here
library(randomForest)   # Random Forest Command
library(ElemStatLearn)  # Data Sets
library(mlbench)        # Sonar data set 

library(truncreg)       # Truncated Regression
library(glm2)           # Poisson Regression + crabs data
library(faraway)        # Pima diabetes data set

library(boot)


####### Data Sets ####

# These are hosted on github. (notice the "raw" URL)

Cheeses <- read.csv("https://raw.githubusercontent.com/RWorkshop/workshopdatasets/master/Cheeses.csv")
fishing <- read.csv("https://raw.githubusercontent.com/RWorkshop/workshopdatasets/master/fishing.csv")
logit2 <- read.csv("https://raw.githubusercontent.com/RWorkshop/workshopdatasets/master/logit2.csv")
multilog <- read.csv("https://raw.githubusercontent.com/RWorkshop/workshopdatasets/master/multilog.csv")
negbin <- read.csv("https://raw.githubusercontent.com/RWorkshop/workshopdatasets/master/negbin.csv")
poisreg <- read.csv("https://raw.githubusercontent.com/RWorkshop/workshopdatasets/master/poisreg.csv")
SAheart <- read.csv("https://raw.githubusercontent.com/RWorkshop/workshopdatasets/master/SAheart.csv")
Schooling <- read.csv("https://raw.githubusercontent.com/RWorkshop/workshopdatasets/master/Schooling.csv")
ztpoisreg <- read.csv("https://raw.githubusercontent.com/RWorkshop/workshopdatasets/master/ztpoisreg.csv")

# Modellng count variables

