#dplyr

diam1 <- diamonds %>% sample_n(1000)
diam2 <- diamonds %>% sample_n(1000)
diam3 <- diamonds %>% sample_n(1000)

head(diam)

# Cut : ordinal variable

table(diam1$cut)

table(diam2$cut)

table(diam3$cut)

randomForest(cut ~. , data=diam1)

diamRF1 <- randomForest(cut ~. , data=diam1)

predict(diamRF1,diam2)

#caret
#confusionmatrix

predictions <- predict(diamRF1,diam2)

actuals <- diam2$cut

table(actuals,predictions)
