

###############################################

library(nnet)
library(ggplot2)
library(reshape2)

schooldata <- read.csv("https://raw.githubusercontent.com/RWorkshop/workshopdatasets/master/multilog.csv")
  
###############################################

with(schooldata, table(ses, prog))
 

with(schooldata, do.call(rbind, tapply(write, prog, function(x) c(M = mean(x), SD = sd(x)))))

schooldata$prog2 <- relevel(schooldata$prog, ref = "academic")
mlogmodel <- multinom(prog2 ~ ses + write, data = schooldata)

summary(mlogmodel)

############################################### 

z <- summary(mlogmodel)$coefficients/summary(mlogmodel)$standard.errors
z

p <- (1 - pnorm(abs(z), 0, 1)) * 2
p

################################################

## extract the coefficients from the model and exponentiate
exp(coef(mlogmodel))

head(pp <- fitted(mlogmodel))

dses <- data.frame(ses = c("low", "middle", "high"), write = mean(schooldata$write))
predict(test, newdata = dses, "probs")

dwrite <- data.frame(ses = rep(c("low", "middle", "high"), each = 41), write = rep(c(30:70), 3))

## store the predicted probabilities for each value of ses and write
pp.write <- cbind(dwrite, predict(test, newdata = dwrite, type = "probs", se = TRUE))

## calculate the mean probabilities within each level of ses
by(pp.write[, 3:5], pp.write$ses, colMeans)

## melt data set to long for ggplot2
lpp <- melt(pp.write, id.vars = c("ses", "write"), value.name = "probability")

head(lpp)  # view first few rows

## plot predicted probabilities across write values for each level of ses
## facetted by program type
ggplot(lpp, aes(x = write, y = probability, colour = ses)) + geom_line() + facet_grid(variable ~
    ., scales = "free")
