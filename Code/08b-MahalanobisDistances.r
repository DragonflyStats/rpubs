
library(ggplot2)
library(dplyr)

data(diamonds)
df <- sample_frac(diamonds,0.3)
head(df)

# Calculate Mahalanobis Distance with height and weight distributions
MD <- mahalanobis(df[, c(1,5,7)], colMeans(df[,c(1,5,7)]), cov(df[, c(1,5,7)]))



cov(df[,c(1,5,7)])

df$MD <- round(MD, 3)


MD[1:300] %>% round(2)

head(df)

# Mahalanobis Outliers - Threshold set to 12
df$outlier_maha <- FALSE
df$outlier_maha[df$MD > 10] <- TRUE

head(df)
