
library(caret)

# Data splitting with createDataPartition()
inTrain <- createDataPartition(y=iris$Species, p=0.75, list=FALSE)

training <- iris[inTrain, ]
testing <- iris[-inTrain, ]


dim(training)

dim(testing)
