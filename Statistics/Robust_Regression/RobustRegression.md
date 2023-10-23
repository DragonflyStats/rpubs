Robust Regression
========================================================


```r
require(foreign)
```

```
## Loading required package: foreign
```

```r
require(MASS)
```

```
## Loading required package: MASS
```

```r
cdata <- read.dta("http://www.ats.ucla.edu/stat/data/crime.dta")
summary(cdata)
```

```
##       sid          state               crime          murder     
##  Min.   : 1.0   Length:51          Min.   :  82   Min.   : 1.60  
##  1st Qu.:13.5   Class :character   1st Qu.: 326   1st Qu.: 3.90  
##  Median :26.0   Mode  :character   Median : 515   Median : 6.80  
##  Mean   :26.0                      Mean   : 613   Mean   : 8.73  
##  3rd Qu.:38.5                      3rd Qu.: 773   3rd Qu.:10.35  
##  Max.   :51.0                      Max.   :2922   Max.   :78.50  
##     pctmetro        pctwhite        pcths         poverty    
##  Min.   : 24.0   Min.   :31.8   Min.   :64.3   Min.   : 8.0  
##  1st Qu.: 49.5   1st Qu.:79.3   1st Qu.:73.5   1st Qu.:10.7  
##  Median : 69.8   Median :87.6   Median :76.7   Median :13.1  
##  Mean   : 67.4   Mean   :84.1   Mean   :76.2   Mean   :14.3  
##  3rd Qu.: 84.0   3rd Qu.:92.6   3rd Qu.:80.1   3rd Qu.:17.4  
##  Max.   :100.0   Max.   :98.5   Max.   :86.6   Max.   :26.4  
##      single    
##  Min.   : 8.4  
##  1st Qu.:10.1  
##  Median :10.9  
##  Mean   :11.3  
##  3rd Qu.:12.1  
##  Max.   :22.1
```

```r

summary(ols <- lm(crime ~ poverty + single, data = cdata))
```

```
## 
## Call:
## lm(formula = crime ~ poverty + single, data = cdata)
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -811.1 -114.3  -22.4  121.9  689.8 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -1368.19     187.21   -7.31  2.5e-09 ***
## poverty         6.79       8.99    0.76     0.45    
## single        166.37      19.42    8.57  3.1e-11 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 244 on 48 degrees of freedom
## Multiple R-squared:  0.707,	Adjusted R-squared:  0.695 
## F-statistic:   58 on 2 and 48 DF,  p-value: 1.58e-13
```

```r
opar <- par(mfrow = c(2, 2), oma = c(0, 0, 1.1, 0))
plot(ols, las = 1)
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1.png) 

```r
summary(rr.huber <- rlm(crime ~ poverty + single, data = cdata))
```

```
## 
## Call: rlm(formula = crime ~ poverty + single, data = cdata)
## Residuals:
##    Min     1Q Median     3Q    Max 
## -846.1 -125.8  -16.5  119.2  679.9 
## 
## Coefficients:
##             Value     Std. Error t value  
## (Intercept) -1423.037   167.590     -8.491
## poverty         8.868     8.047      1.102
## single        168.986    17.388      9.719
## 
## Residual standard error: 182 on 48 degrees of freedom
```

```r

hweights <- data.frame(state = cdata$state, resid = rr.huber$resid, weight = rr.huber$w)
hweights2 <- hweights[order(rr.huber$w), ]
hweights2[1:15, ]
```

```
##    state   resid weight
## 25    ms -846.09 0.2890
## 9     fl  679.94 0.3595
## 46    vt -410.48 0.5956
## 51    dc  376.34 0.6494
## 26    mt -356.14 0.6865
## 21    me -337.10 0.7252
## 31    nj  331.12 0.7384
## 14    il  319.10 0.7661
## 1     ak -313.16 0.7807
## 20    md  307.19 0.7958
## 19    ma  291.21 0.8395
## 18    la -266.96 0.9159
## 2     al  105.40 1.0000
## 3     ar   30.54 1.0000
## 4     az  -43.25 1.0000
```


