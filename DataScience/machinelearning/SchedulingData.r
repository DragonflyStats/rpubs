
install.packages("AppliedPredictiveModeling")
library(AppliedPredictiveModeling)
data(schedulingData)
library(caret)

dim(schedulingData)

tail(schedulingData)

summary(schedulingData)

set.seed(1234)

inTrain <- createDataPartition(schedulingData$Class, p = .75,list = FALSE)

training <- schedulingData[ inTrain,]
testing <- schedulingData[-inTrain,]


dim(training)

dim(testing)

library(C50)
ClassTree <- C5.0(Class ~ ., data = training)
ClassTree


ClassTreePred <- predict(ClassTree, testing)
table(ClassTreePred)

addmargins(table(testing$Class,ClassTreePred))

ClassTreeProbs <- predict(ClassTree, testing, type ="prob")
head(ClassTreeProbs)


postResample(ClassTreePred, testing$Class)


C5imp(ClassTree)

schedulingData$NumPending <- schedulingData$NumPending + 1

# Cant have log(0)


set.seed(1234)

inTrain <- createDataPartition(schedulingData$Class, p = .75,list = FALSE)

training <- schedulingData[ inTrain,]
testing <- schedulingData[-inTrain,]



newformula <- as.formula(Class ~ Protocol + log10(Compounds) +
                      log10(InputFields)+ log10(Iterations) +
                      log10(NumPending) + Hour + Day)

ClassTree2 <- C5.0(newformula, data = training)
ClassTree2


C5imp(ClassTree2)

ClassTreePred2 <- predict(ClassTree2, testing)
table(ClassTreePred2)

postResample(ClassTreePred2, testing$Class)


C5.0Fit <- train(newformula, data = training,
 data = training,
 method = "C5.0")
 ## Center and scale the predictors for the training
 ## set and all future samples.
 ## preProc = c("center", "scale"))


