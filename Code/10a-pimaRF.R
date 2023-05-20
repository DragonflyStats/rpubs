# Pima

library(caret)
library(readr)

pima <- read.csv("https://raw.githubusercontent.com/RWorkshop/workshopdatasets/master/pima.csv")
glimpse(pima)
dim(pima)
Outcome <- pima$diab_1

pimaRF <- train(pima[,1:8],pima[,9],method="rf")
