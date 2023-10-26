
library(caret)


data(oil)
data()


head(fattyAcids)

dim(fattyAcids)

head(oilType)



table(oilType)

As a note, the paper states on page 32 that there are 37 unknown samples while the
table on pages 33 and 34 shows that there are 34 unknowns.
Using the data from the Examples section of caret::createFolds




#Linear Kernel
set.seed(1492)                     
 
#Train and Tune the SVM
svm.oil <- train(x=fattyAcids,
                    y= oilType,
                    method = "svmLinear")
 
 
svm.oil

table(oilType , predict(svm.oil))


part <- createDataPartition(iris, 2)


fold <- createFolds(iris, 2)


length(Reduce(intersect, part))
# [1] 27
1
length(Reduce(intersect, fold))
#[1] 0
2
Looks

Looks like createDataPartition split your data into smaller pieces, but allows for
the same example to appear in dierent splits.
createFolds doesn't allow dierent examples to appear in dierent splits of the
folds.
Basically, createDataPartition is used when you need to make one or more simple
two-way splits of your data. For example, if you want to make a training and test set
and keep your classes balanced, this is what you could use. It can also make multiple
splits of this kind (or leave-group-out CV aka Monte Carlos CV aka repeated training
test splits).
createFolds is exclusively for k-fold CV. Their usage is simular when you use the
returnTrain = TRUE option in createFolds.


### createDataPartition
A series of test/training partitions are created using createDataPartition while cre-
ateResample creates one or more bootstrap samples. createFolds splits the data into k
groups while createTimeSlices creates cross-validation sample information to be used
with time series data.


data(oil)
createDataPartition(oilType, 2)
$Resample1
[1] 4 8 9 10 11 12 13 15 18 36 37 41 64 65 70 71 72 73 75
[20] 19 21 22 33 34 35 76 78 79 80 81 86 87 29 62 42 52 55 56
[39] 25 26 44 48 49 51 28 59 91 93 94 92
$Resample2




[1] 4 6 7 9 10 12 13 14 16 18 37 38 40 64 68 69 72 73 75
[20] 19 20 21 23 24 32 33 35 81 83 84 87 88 29 62 42 53 55 56
[39] 25 26 47 49 50 96 58 59 60 93 95 27
> createResample(oilType, 2)
$Resample1
[1] 2 3 5 5 6 6 6 6 7 8 9 9 9 9 10 10 10 11 12
[20] 13 14 16 16 19 20 21 21 22 22 23 27 27 27 28 28 29 30 30
[39] 31 34 34 35 35 35 35 36 37 38 39 41 41 41 43 45 46 48 51
[58] 53 54 56 57 58 58 59 65 65 65 66 69 71 73 73 73 75 79 81
[77] 81 82 83 83 84 84 84 84 85 85 85 86 88 88 89 90 90 94 96
[96] 96
4
$Resample2
[1] 4 4 6 6 8 10 11 11 11 12 14 16 16 17 17 17 19 20 20
[20] 20 21 22 22 22 24 26 27 28 30 31 33 34 34 35 37 38 41 41
[39] 43 44 45 45 47 47 54 55 56 57 57 59 59 60 60 61 63 63 65
[58] 65 65 65 66 66 67 68 68 69 69 70 74 77 77 77 77 78 78 79
[77] 80 81 82 82 82 83 83 84 85 85 86 87 87 88 89 90 91 93 94
[96] 94
5
