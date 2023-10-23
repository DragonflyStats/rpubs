library(outliers)
# Author: Lukasz Komsta ( umlub.pl )

x <-  c(6.98, 8.49, 7.97, 6.64,
        8.80, 8.48, 5.94 ,6.94,
        6.89, 7.47, 7.32 ,4.01)

grubbs.test(x, two.sided=TRUE)

grubbs.test(x)

grubbs.test(x, type = 10) #Default

grubbs.test(x, type = 11) 

grubbs.test(x, type = 20) 

