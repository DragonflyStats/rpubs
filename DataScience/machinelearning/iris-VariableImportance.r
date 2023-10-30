
library(dplyr)

library(purrr)
library(magrittr)

iris %>% group_by(Species) %>%select(1:4) %>% summarize(meanSL=mean(Sepal.Length),meanSW=mean(Sepal.Width),meanPW=mean(Petal.Width),meanPL=mean(Petal.Length))


