
library(ggplot2)

fishing <- read.csv("https://raw.githubusercontent.com/RWorkshop/workshopdatasets/master/fishing.csv")

head(fishing)

## histogram with x axis 
ggplot(fishing, aes(count)) + geom_histogram()

## histogram with x axis in log10 scale
ggplot(fishing, aes(count)) + geom_histogram() + scale_x_log10()

## Run a Zero-Inflated Poisson Regression Analysis to predict number of fish caught
library(pscl)
newdata1 <- expand.grid(0:3, factor(0:1), 1:4)
colnames(newdata1) <- c("child", "camper", "persons")
newdata1 <- subset(newdata1, subset=(child<=persons))
#head(newdata1)


## Create a Model
m1 <- zeroinfl(count ~ child + camper | persons, data = fishing)

## Make Predictions
newdata1$phat <- predict(m1, newdata1)



ggplot(newdata1, aes(x = child, y = phat, colour = factor(persons))) +
  geom_point() +
  geom_line() +
  facet_wrap(~camper) +
  labs(x = "Number of Children", y = "Predicted Fish Caught")
