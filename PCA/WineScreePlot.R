screeplot(wine.pca, type="lines")
#method #1: use a plot of the variances 

#method #2 use Kaiser’s criterion: 
#that we should only retain principal components for which the variance is above 1 
#(when principal component analysis was applied to standardised data). We can check 
#this by finding the variance of each of the principal components:
(wine.pca$sdev)^2
#We see that the variance is above 1 for principal components 1, 2, and 3 (which have 
#variances 4.71, 2.50, and 1.45, respectively). Therefore, using Kaiser’s criterion, 
#we would retain the first three principal components.

summary(wine.pca)
#method #3: to retain is to decide to keep the number of components required to 
#explain at least some minimum amount of the total variance. For example, if it is 
#important to explain at least 80% of the variance, we would retain the first five 
#principal components, as we can see from the output of “summary(wine.pca)” that the 
#first five principal components explain 80.2% of the variance (while the first 
#four components explain just 73.6%, so are not sufficient).
