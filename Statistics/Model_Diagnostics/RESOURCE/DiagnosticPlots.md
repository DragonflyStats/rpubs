Diagnostics Plots For Regression Analysis
========================================================




```r
attach(mtcars)
FIT1 <- lm(mpg ~ cyl + wt)
summary(FIT1)
```

```
## 
## Call:
## lm(formula = mpg ~ cyl + wt)
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -4.289 -1.551 -0.468  1.574  6.100 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)   39.686      1.715   23.14  < 2e-16 ***
## cyl           -1.508      0.415   -3.64  0.00106 ** 
## wt            -3.191      0.757   -4.22  0.00022 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 2.57 on 29 degrees of freedom
## Multiple R-squared:  0.83,	Adjusted R-squared:  0.819 
## F-statistic: 70.9 on 2 and 29 DF,  p-value: 6.81e-12
```

```r

# What are the regression coefficients?
coef(FIT1)
```

```
## (Intercept)         cyl          wt 
##      39.686      -1.508      -3.191
```

```r

# What are the p-values for the regression coefficients?
summary(FIT1)$coefficients
```

```
##             Estimate Std. Error t value  Pr(>|t|)
## (Intercept)   39.686     1.7150  23.141 3.043e-20
## cyl           -1.508     0.4147  -3.636 1.064e-03
## wt            -3.191     0.7569  -4.216 2.220e-04
```

```r



# What are the 95% confidence intervals for this coefficients?
confint(FIT1)
```

```
##              2.5 %  97.5 %
## (Intercept) 36.179 43.1938
## cyl         -2.356 -0.6597
## wt          -4.739 -1.6429
```

```r

# What is the AIC value for this fitted model?
AIC(FIT1)
```

```
## [1] 156
```

```r

```


### Test Residuals for Normality

- compute the residuals of the fitted model using the `resid()` command.
- Test the hypothesis of normality using `shapiro.test`.

```r
Residuals = resid(FIT1)

shapiro.test(Residuals)
```

```
## 
## 	Shapiro-Wilk normality test
## 
## data:  Residuals
## W = 0.9375, p-value = 0.06341
```

The p-value is 0.06341. We fail to reject the null hypothesis that the residuals are normally distributed.

#### Use `mfrow` argument to create grid of plots

`mfrow` is used to create a grid of plots. Simply specify the number of rows and columns of the grid. 

On each of the plots, which points are identified as being influential?
Which points, if any, are influential according to all four plots.

```r
par(mfrow = c(2, 2))
plot(FIT1, pch = 18, col = "red", cex = 2)
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 

```r
# Put it back to Normal Mode
par(mfrow = c(1, 1))
```


