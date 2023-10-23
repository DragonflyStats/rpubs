
library(ggplot2)
library(dplyr)
library(magrittr)

lpp <- read.csv("https://raw.githubusercontent.com/RWorkshop/workshopdatasets/master/lpp.csv")

tail(lpp)

lpp %>% filter(write==65) 

## plot predicted probabilities across write values for each level of ses
## facetted by program type
ggplot(lpp, aes(x = write, y = probability, colour = ses)) + geom_line() + facet_grid(variable ~
    .)

## plot predicted probabilities across write values for each level of ses
## facetted by program type
ggplot(lpp, aes(x = write, y = probability, colour = ses)) + geom_line() + facet_grid(variable ~
    ., scales = "free")


