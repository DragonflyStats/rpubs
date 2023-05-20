data(mtcars)
d <- dist(mtcars, method = "euclidean") # distance matrix
fit <- hclust(d, method="ward") 
plot(fit, main="hierarchical clustering for mtcars dataset") # display dendogram
groups <- cutree(fit, k=5) # cut tree into 5 clusters
# draw dendogram with red borders around the 5 clusters 
rect.hclust(fit, k=5, border="red")
