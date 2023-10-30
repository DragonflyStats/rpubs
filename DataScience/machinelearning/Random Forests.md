

```R
### RandomForest with R
library(randomForest)
# download Titanic Survivors data
data <- read.table("http://math.ucdenver.edu/RTutorial/titanic.txt", h=T, sep="\t")
# make survived into a yes/no
data$Survived <- as.factor(ifelse(data$Survived==1, "yes", "no"))
# split into a training and test set
idx <- runif(nrow(data)) <= .75
data.train <- data[idx,]
data.test <- data[-idx,]
```

    Warning message in file(file, "rt"):
    "cannot open URL 'http://math.ucdenver.edu/RTutorial/titanic.txt': HTTP status was '403 Forbidden'"


    Error in file(file, "rt"): cannot open the connection
    Traceback:


    1. read.table("http://math.ucdenver.edu/RTutorial/titanic.txt", 
     .     h = T, sep = "\t")

    2. file(file, "rt")



```R
### Train a random forest
rf <- randomForest(Survived ~ PClass + Age + Sex,
data=data.train, importance=TRUE, na.action=na.omit)
```


    Error in eval(expr, envir, enclos): object 'data.train' not found
    Traceback:


    1. randomForest(Survived ~ PClass + Age + Sex, data = data.train, 
     .     importance = TRUE, na.action = na.omit)

    2. randomForest.formula(Survived ~ PClass + Age + Sex, data = data.train, 
     .     importance = TRUE, na.action = na.omit)

    3. eval(m$data, parent.frame())

    4. eval(expr, envir, enclos)



```R
### How important is each variable in the model?
imp <- importance(rf)
o <- order(imp[,3], decreasing=T)
imp[o,]

```


    Error in UseMethod("importance"): no applicable method for 'importance' applied to an object of class "function"
    Traceback:


    1. importance(rf)



```R


### Display the confusion matrix

# confusion matrix [[True Neg, False Pos], [False Neg, True Pos]]
table(data.test$Survived, predict(rf, data.test),
dnn=list("actual", "predicted"))


```


    Error in parse(text = x, srcfile = src): <text>:3:9: unexpected symbol
    2: 
    3: Display the
               ^
    Traceback:




```R
library(caret)
mod <- train(Species ~ ., data = iris,
method = "cforest",
controls = cforest_unbiased(ntree = 10))
varImp(mod)
returns:
cforest variable importance
Overall
Petal.Width 100.0000
Petal.Length 86.6279
Sepal.Length 0.5814
Sepal.Width 0.0000
```


    Error in parse(text = x, srcfile = src): <text>:7:9: unexpected symbol
    6: returns:
    7: cforest variable
               ^
    Traceback:




```R

```
