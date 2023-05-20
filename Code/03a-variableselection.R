
head(mtcars)

FitAll <- lm(mpg ~ . ,data=mtcars)

#summary(FitAll)

FitAll = lm(mpg ~ .,data=mtcars)
formula(FitAll)

step(FitAll, direction = "backward")

FitStart = lm(mpg ~ 1,data=mtcars)
head(mtcars)

summary(FitStart)

step(FitStart, direction = "both" ,scope=formula(FitAll))
