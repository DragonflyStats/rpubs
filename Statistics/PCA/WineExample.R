wine <- read.table("http://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data", sep=",")
#wine contains data on concentrations of 13 different chemicals (V2-V14) in wines 
#grown in the same region in Italy that are derived from three different cultivars (indicated in V1).

sapply(wine[2:14], mean) #show the average concentration of the different chemicals
sapply(wine[2:14], std) #show the concentration variations for the different chemicals
#We can see here that it would make sense to standardize the dataset in order to 
#compare the variables, which have very different standard deviations 

standardisedconcentrations <- as.data.frame(scale(wine[2:14]))
wine.pca <- prcomp(standardisedconcentrations)
