
install.packages("ElemStatLearn")
library(ElemStatLearn)
data(SAheart)

summary(SAheart)

nrow(SAheart)

trainIndex <- sample(1:462,350)

trainIndex

library(caret)
set.seed(3456)
trainIndex <- createDataPartition(SAheart$chd, p = 0.8, 
                                  list = FALSE,      
                                  times = 1)
# trainIndex

trainSA <- SAheart[ trainIndex,]
testSA  <- SAheart[-trainIndex,]

modelfit <- glm(chd ~ age + alcohol + 
      obesity +  tobacco + typea + ldl, 
      data=trainSA, 
      family="binomial")




summary(modelfit)



install.packages("broom")
library(broom)


tidy(modelfit)

coef(modelfit)

exp(confint(modelfit))

# predict(modelfit, type="response")

train.predict <- floor(2*predict(modelfit, type="response"))

train.predict

table(train.predict,trainSA$chd)

sum(diag(table(train.predict,trainSA$chd)))

nrow(trainSA)

sum(diag(table(train.predict,trainSA$chd))) / nrow(trainSA)

test.predict <- predict(modelfit, newdata=testSA, type="response")

test.predict <- floor(2*test.predict)

sum(diag(table(test.predict, testSA$chd)))

nrow(testSA)

65/92
