require(foreign)
require(ggplot2)
require(MASS)
require(Hmisc)
require(reshape2)

ologit <- read.csv("https://raw.githubusercontent.com/RWorkshop/workshopdatasets/master/ologit.csv")

head(ologit,2)

Please note: The purpose of this page is to show how to use various data analysis commands. It does not cover all aspects of the research process which researchers are expected to do. In particular, it does not cover data cleaning and checking, verification of assumptions, model diagnostics or potential follow-up analyses.



## one at a time, table apply, pared, and public
lapply(dat[, c("apply", "pared", "public")], table)
## $apply
## 
##        unlikely somewhat likely     very likely 
##             220             140              40 
## 
## $pared
## 
##   0   1 
## 337  63 
## 
## $public
## 
##   0   1 
## 343  57
## three way cross tabs (xtabs) and flatten the table
ftable(xtabs(~ public + apply + pared, data = dat))
##                        pared   0   1
## public apply                        
## 0      unlikely              175  14
##        somewhat likely        98  26
##        very likely            20  10
## 1      unlikely               25   6
##        somewhat likely        12   4
##        very likely             7   3
summary(dat$gpa)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##    1.90    2.72    2.99    3.00    3.27    4.00
sd(dat$gpa)
## [1] 0.3979
We can also examine the distribution of gpa at every level of apply and broken down by public and pared. This creates a 2 x 2 grid with a boxplot of gpa for every level of apply, for particular values of pared and public. To better see the data, we also add the raw data points on top of the box plots, with a small amount of noise (often called “jitter”) and 50% transparency so they do not overwhelm the boxplots. Finally, in addition to the cells, we plot all of the marginal relationships. The margins make the final plot a 3 x 3 grid. In the lower right hand corner, is the overall relationship between apply and gpa which appears slightly positive. To do this, we use the ggplot2 package.

ggplot(dat, aes(x = apply, y = gpa)) +
  geom_boxplot(size = .75) +
  geom_jitter(alpha = .5) +
  facet_grid(pared ~ public, margins = TRUE) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1))

## fit ordered logit model and store results 'm'
m <- polr(apply ~ pared + public + gpa, data = dat, Hess=TRUE)

## view a summary of the model
summary(m)
## Call:
## polr(formula = apply ~ pared + public + gpa, data = dat, Hess = TRUE)
## 
## Coefficients:
##          Value Std. Error t value
## pared   1.0477      0.266   3.942
## public -0.0588      0.298  -0.197
## gpa     0.6159      0.261   2.363
## 
## Intercepts:
##                             Value  Std. Error t value
## unlikely|somewhat likely     2.204  0.780      2.827 
## somewhat likely|very likely  4.299  0.804      5.345 
## 
## Residual Deviance: 717.02 
## AIC: 727.02
## store table
(ctable <- coef(summary(m)))
##                                Value Std. Error t value
## pared                        1.04769     0.2658  3.9418
## public                      -0.05879     0.2979 -0.1974
## gpa                          0.61594     0.2606  2.3632
## unlikely|somewhat likely     2.20391     0.7795  2.8272
## somewhat likely|very likely  4.29936     0.8043  5.3453
## calculate and store p values
p <- pnorm(abs(ctable[, "t value"]), lower.tail = FALSE) * 2

## combined table
(ctable <- cbind(ctable, "p value" = p))
##                                Value Std. Error t value   p value
## pared                        1.04769     0.2658  3.9418 8.087e-05
## public                      -0.05879     0.2979 -0.1974 8.435e-01
## gpa                          0.61594     0.2606  2.3632 1.812e-02
## unlikely|somewhat likely     2.20391     0.7795  2.8272 4.696e-03
## somewhat likely|very likely  4.29936     0.8043  5.3453 9.027e-08
We can also get confidence intervals for the parameter estimates. These can be obtained either by profiling the likelihood function or by using the standard errors and assuming a normal distribution. Note that profiled CIs are not symmetric (although they are usually close to symmetric). If the 95% CI does not cross 0, the parameter estimate is statistically significant.

(ci <- confint(m)) # default method gives profiled CIs
## Waiting for profiling to be done...
##          2.5 % 97.5 %
## pared   0.5282 1.5722
## public -0.6522 0.5191
## gpa     0.1076 1.1309
confint.default(m) # CIs assuming normality
##          2.5 % 97.5 %
## pared   0.5268  1.569
## public -0.6426  0.525
## gpa     0.1051  1.127
The CIs for both pared and gpa do not include 0; public does. The estimates in the output are given in units of ordered logits, or ordered log odds. So for pared, we would say that for a one unit increase in pared (i.e., going from 0 to 1), we expect a 1.05 increase in the expect value of apply on the log odds scale, given all of the other variables in the model are held constant. For gpa, we would say that for a one unit increase in gpa, we would expect a 0.62 increase in the expected value of apply in the log odds scale, given that all of the other variables in the model are held constant.

The coefficients from the model can be somewhat difficult to interpret because they are scaled in terms of logs. Another way to interpret logistic regression models is to convert the coefficients into odds ratios. To get the OR and confidence intervals, we just exponentiate the estimates and confidence intervals.

## odds ratios
exp(coef(m))
##  pared public    gpa 
## 2.8511 0.9429 1.8514
## OR and CI
exp(cbind(OR = coef(m), ci))
##            OR  2.5 % 97.5 %
## pared  2.8511 1.6958  4.817
## public 0.9429 0.5209  1.681
## gpa    1.8514 1.1136  3.098
