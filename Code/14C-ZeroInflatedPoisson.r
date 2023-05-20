
install.packages("pscl")
library(pscl)

fishing <- read.csv("https://raw.githubusercontent.com/RWorkshop/workshopdatasets/master/fishing.csv")
head(fishing)

summary(fishing)

summary(m1 <- zeroinfl(count ~ child + camper |persons, data = fishing))

newdata1 <- expand.grid(0:3, factor(0:1), 1:4)
colnames(newdata1) <- c("child", "camper", "persons")
newdata1 <- subset(newdata1, subset=(child<=persons))
newdata1$phat <- predict(m1, newdata1)



library(ggplot2)

ggplot(newdata1, aes(x = child, y = phat, colour = factor(persons))) +
  geom_point() +
  geom_line() +
  facet_wrap(~camper) +
  labs(x = "Number of Children", y = "Predicted Fish Caught")
