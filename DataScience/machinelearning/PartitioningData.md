

```R
library(caret)
```

    Loading required package: lattice
    Loading required package: ggplot2


### Partitioning Data
First, we split the data into two groups: a ***training set*** and a ***test set***. 

To do this, the `createDataPartition()` function is used.
% http://caret.r-forge.r-project.org/

#### Data Splitting

* Simple Splitting Based on the Outcome
* Splitting Based on the Predictors
* Data Splitting for Time Series



```R
# Data splitting with createDataPartition()
inTrain <- createDataPartition(y=iris$Species, p=0.75, list=FALSE)

training <- iris[inTrain, ]
testing <- iris[-inTrain, ]

```


<ol class="list-inline">
	<li>114</li>
	<li>5</li>
</ol>




```R
dim(training)
```


```R
dim(testing)
```

*
