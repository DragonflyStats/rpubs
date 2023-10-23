
Awards <- read.csv("https://raw.githubusercontent.com/RWorkshop/workshopdatasets/master/SchoolAwards.csv")

head(Awards)

library(ggplot2)

ggplot(data = Awards, aes(num_awards)) +
  geom_histogram(binwidth=.5)

ggplot(data = Awards, aes(num_awards,fill=prog)) +
  geom_histogram(binwidth=.5, position="dodge")


## create the plot
ggplot(Awards, aes(x = math, y = phat, colour = prog)) +
  geom_point(aes(y = num_awards), alpha=.5, position=position_jitter(h=.2)) +
  geom_line(size = 1) +
  labs(x = "Math Score", y = "Expected number of awards")


