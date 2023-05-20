
mydata <- read.csv("binary.csv")
## view the first few rows of the data
head(mydata)
## admit gre gpa rank
## 1 0 380 3.61 3
## 2 1 660 3.67 3
## 3 1 800 4.00 1
## 4 1 640 3.19 4
## 5 0 520 2.93 4
## 6 1 760 3.00 2

summary(mydata)




table(mydata$admit)
#
# 0 1
#273 127


xtabs(~admit + rank, data = mydata)
## rank
## admit 1 2 3 4
## 0 28 97 93 55
## 1 33 54 28 12
27

mydata$rank <- factor(mydata$rank)
model1 <- glm(admit ~ gre + gpa + rank,
                data = mydata,
                family = "binomial")

### Using the **``summary()``** function
* Since we gave our model a name ("model1"), R will not produce any output from our
regression.
* In order to get the results we use the **``summary()``** command:

summary(model1)
# tidy(model1)
# glance(model1)


## CIs using profiled log-likelihood
confint(model1)
## Waiting for profiling to be done...
## 2.5 % 97.5 %
## (Intercept) -6.271620 -1.79255
## gre 0.000138 0.00444
## gpa 0.160296 1.46414
## rank2 -1.300889 -0.05675
## rank3 -2.027671 -0.67037
## rank4 -2.400027 -0.75354
## CIs using standard errors


confint.default(model1)


wald.test(b = coef(model1), Sigma = vcov(model1), Terms = 4:6)
## Wald test:
## ----------
##
## Chi-squared test:
## X2 = 20.9, df = 3, P(> X2) = 0.00011


 The chi-squared test statistic of 20.9, with three degrees of freedom is associated with a
p-value of 0.00011 indicating that the overall eect of rank is statistically signicant.
32

### Odds and Odds Ratio
 You can also exponentiate the coecients and interpret them as odds-ratios.
## odds ratios only
exp(coef(model1))
## (Intercept) gre gpa rank2 rank3 rank4
## 0.0185 1.0023 2.2345 0.5089 0.2618 0.2119
 We can use the same idea to get odds ratios and their condence intervals, by exponen-
tiating the condence intervals from before. To put it all in one table, we use cbind to
bind the coecients and condence intervals column-wise.


## odds ratios and 95% CI
exp(cbind(OR = coef(model1), confint(myodel1)))
## Waiting for profiling to be done...
## OR 2.5 % 97.5 %
## (Intercept) 0.0185 0.00189 0.167
## gre 1.0023 1.00014 1.004
## gpa 2.2345 1.17386 4.324
## rank2 0.5089 0.27229 0.945
## rank3 0.2618 0.13164 0.512
## rank4 0.2119 0.09072 0.471




 Now we can say that for a one unit increase in gpa, the odds of being admitted to
graduate school (versus not being admitted) increase by a factor of 2.23. Note that
while R produces it, the odds ratio for the intercept is not generally interpreted.
33

### Using the Model to make predictions
 You can also use predicted probabilities to help you understand the model.
 Predicted probabilities can be computed for both categorical and continuous predictor
variables.
 In order to create predicted probabilities we rst need to create a new data frame with
the values we want the independent variables to take on to create our predictions.
 We will start by calculating the predicted probability of admission at each value of
rank, holding gre and gpa at their means.
 First we create and view the data frame.


newdata1 <- with(mydata, data.frame(gre = mean(gre),
gpa = mean(gpa),
rank = factor(1:4)))
## view data frame
newdata1
## gre gpa rank
## 1 588 3.39 1
## 2 588 3.39 2
## 3 588 3.39 3
## 4 588 3.39 4


 The second line of the code lists the values in the data frame newdata1.


newdata1$rankP <- predict(model1, newdata = newdata1, type = "response")
newdata1
## gre gpa rank rankP
## 1 588 3.39 1 0.517
## 2 588 3.39 2 0.352
## 3 588 3.39 3 0.219
## 4 588 3.39 4 0.185


### Interpretation
In this output we see that the predicted probability of being accepted into a gradu-
ate program is 0.52 for students from the highest prestige undergraduate institutions
(rank=1), and 0.18 for students from the lowest ranked institutions (rank=4), holding
gre and gpa at their means.

