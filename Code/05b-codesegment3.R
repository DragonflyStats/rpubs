---
title: "Bootstrap"
output: html_document
date: '2022-10-17'
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```
# Load data
data("USArrests")
my_data <- USArrests
# Remove any missing value (i.e, NA values for not available)
my_data <- na.omit(my_data)
# Scale variables
my_data <- scale(my_data)
# View the firt 3 rows
head(my_data, n = 3)


####################################

##         Murder Assault UrbanPop     Rape
## Alabama 1.2426   0.783   -0.521 -0.00342
## Alaska  0.5079   1.107   -1.212  2.48420
## Arizona 0.0716   1.479    0.999  1.04288


####################################

# Determine the optimal number of clusters for k-means clustering:

library("factoextra")
fviz_nbclust(my_data, kmeans,
             method = "gap_stat")

####################################

# Compute and visualize k-means clustering:

set.seed(123)
km.res <- kmeans(my_data, 3, nstart = 25)

# Visualize
library("factoextra")
fviz_cluster(km.res, data = my_data, 
             ellipse.type = "convex",
             palette = "jco",
             repel = TRUE,
             ggtheme = theme_minimal())

####################################

set.seed(123) 
irisdata <- iris[,1:4]
km.res1 <- kmeans(, 3, nstart = 25)

# Visualize
library("factoextra")
fviz_cluster(km.res1, data = irisdata, 
             ellipse.type = "convex",
             palette = "jco",
             repel = TRUE,
             ggtheme = theme_minimal())


####################################

# Similarly, you can compute and visualize PAM clustering as follow:

# Compute PAM
library("cluster")
pam.res <- pam(my_data, 4)
# Visualize
fviz_cluster(pam.res)

####################################
