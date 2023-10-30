library(ggplot2)
df <- data.frame(cond = factor( rep(c("A","B"), each=200) ), rating = c(rnorm(200),rnorm(200, mean=.8)))
ggplot(df, aes(x=rating, fill=cond)) + geom_density(alpha=.3)+xlab("NEW RATING TITLE")+ylab("NEW DENSITY TITLE")
