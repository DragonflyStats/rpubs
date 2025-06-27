# Load required libraries
library(caret)    # For machine learning and data preprocessing functions
library(kernlab)  # For accessing the 'spam' dataset

# Load the dataset
data(spam)

# ----------------------------------------------
# Data Partitioning using createDataPartition
# ----------------------------------------------

# Split the data into training (75%) and testing (25%) sets
inTrain <- createDataPartition(y = spam$type, p = 0.75, list = FALSE)

# Create training and testing subsets
training <- spam[inTrain, ]
testing <- spam[-inTrain, ]

# Check the dimensions of the training set
dim(training)

# ----------------------------------------------
# K-Fold Cross-Validation (Training indices)
# ----------------------------------------------

# Create 10 equally sized folds with training indices
set.seed(32343)
folds <- createFolds(y = spam$type, k = 10, list = TRUE, returnTrain = TRUE)

# Show the size of each fold
sapply(folds, length)

# Preview the first 10 indices in the first training fold
folds[[1]][1:10]

# ----------------------------------------------
# K-Fold Cross-Validation (Test indices)
# ----------------------------------------------

# Create 10 folds and return testing indices instead
set.seed(32323)
folds <- createFolds(y = spam$type, k = 10, list = TRUE, returnTrain = FALSE)

# Display the number of elements in each test fold
sapply(folds, length)

# Preview the first 10 indices in the first test fold
folds[[1]][1:10]

# ----------------------------------------------
# Resampling (Bootstrap sampling)
# ----------------------------------------------

# Generate 10 bootstrap samples from the response variable
set.seed(32323)
folds <- createResample(y = spam$type, times = 10, list = TRUE)

# Show the size of each resample
sapply(folds, length)

# ----------------------------------------------
# Time Series Partitioning using createTimeSlices
# ----------------------------------------------

# Create a time series vector
set.seed(32323)
tme <- 1:1000

# Generate training and testing time slices
folds <- createTimeSlices(y = tme, initialWindow = 20, horizon = 10)

# Display structure of time slices
names(folds)

# View indices of the first training slice
folds$train[[1]]

# View indices of the first testing slice
folds$test[[1]]

# ----------------------------------------------
# Helpful Resources
# ----------------------------------------------
# caret tutorial slides (useR 2013):
# http://www.edii.uclm.es/~useR-2013/Tutorials/kuhn/user_caret_2up.pdf

# caret vignette:
# http://cran.r-project.org/web/packages/caret/vignettes/caret.pdf

# JSS paper introducing caret:
# http://www.jstatsoft.org/v28/i05/paper
