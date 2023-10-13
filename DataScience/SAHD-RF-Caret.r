
## install randomForest Package

install.packages("randomForest")

library(randomForest)

install.packages("ElemStatLearn")

library(ElemStatLearn)
data(SAheart )

help(SAheart)

head(SAheart)

SAglm <- glm(chd~.,data=SAheart,family=binomial)
summary(SAglm)

SAHD <- glm(chd~age+ldl+typea+tobacco,data=SAheart,family=binomial)
summary(SAHD)

prediction <- floor(2*predict(SAHD,SAheart,type="response"))

coef(SAHD)

case1 <- c(1,50,02,1,1)

exp(sum(coef(SAHD)*case1))

table(prediction,SAheart$chd)

summary(SAheart)

SARF <- randomForest(chd~.,data=SAheart)

library(dplyr)
glimpse(SAheart)

SARF <- randomForest(factor(chd)~.,data=SAheart)

predict(SARF)

table(SAheart$chd,predict(SARF))

install.packages("caret")

library(caret)
data(SAheart)
Train <- createDataPartition(SAheart$chd, p=0.6, list=FALSE)
training <- SAheart[ Train, ]
testing <- SAheart[ -Train, ]




mod_fit <- train(factor(chd) ~ . ,  data=training, method="rf")



str(SAheart)

mod_fit

importance(mod_fit)


