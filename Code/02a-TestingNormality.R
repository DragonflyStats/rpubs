########################

# Testing for Normality.

# In statistics, a Q-Q plot ("Q" stands for quantile) is a probability plot, which is a
# graphical method for comparing two probability distributions by plotting their quantiles
# against each other. If the two distributions being compared are similar, the points in the
# Q-Q plot will approximately lie on the line y = x. A norm Q-Q plot compares the sample
# distribution against a normal distribution.

qqnorm(iris$Sepal.Width)
qqline(iris$Sepal.Width)

#############################################################

# Shapiro Wilk Test for Normality

shapiro.test( iris$Sepal.Width )
shapiro.test( iris$Petal.Width )
shapiro.test( iris$Sepal.Length )
shapiro.test( iris$Petal.Length )



#############################################################

iris %>% select(1:4) %>% map(shapiro.test)
