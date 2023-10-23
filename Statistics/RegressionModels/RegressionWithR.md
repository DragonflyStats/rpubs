
Regression example
====================================

### Multiple Linear Regression
The `lm()` function handles much more
complicated models than simple linear regression. There can be many other things besides a dependent and a descriptive variable in a model formula.

A multiple linear regression analysis (which we discuss in Chapter
11) of, for example, y on x1, x2, and x3 is specified as $y ~ x1 +
x2 + x3$.

This is an F test for the hypothesis that the regression coefficient is zero. This test is not really interesting in a simple linear regression analysis since it just duplicates information already givenit becomes more interesting when there is more than one explanatory variable.


##Example

Concentration (ng/ml) 0    5  10 15 20 25 30
Absorbance           0.003 0.127 0.251 0.390 0.498 0.625 0.763




```R

# DO A FULL LINEAR REGRESSION ANALYSIS ON THE DATA

concentration=c(0,5,10,15,20,25,30)
absorbance=c(0.03,0.127,0.251,0.390,0.498,0.625,0.763)
regr=lm(absorbance~concentration)
# READ AS; ABSORBANCE DEPENDENT ON CONCENTRATION
summary(regr)

```


    
    Call:
    lm(formula = absorbance ~ concentration)
    
    Residuals:
            1         2         3         4         5         6         7 
     0.015357 -0.010571 -0.009500  0.006571 -0.008357 -0.004286  0.010786 
    
    Coefficients:
                   Estimate Std. Error t value Pr(>|t|)    
    (Intercept)   0.0146429  0.0079787   1.835    0.126    
    concentration 0.0245857  0.0004426  55.551 3.58e-08 ***
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    
    Residual standard error: 0.01171 on 5 degrees of freedom
    Multiple R-squared:  0.9984,	Adjusted R-squared:  0.9981 
    F-statistic:  3086 on 1 and 5 DF,  p-value: 3.576e-08




*  Estimation of Slope = 0.0251643 
*   Standard error of the
estimation of the slope is 0.0002656 
*  Estimation of Intercept
= 0.0021071 *  Standard error of the estimation of the
intercept is 0.0047874 
*  Degrees-of-Freedom1 = 7-2 = 5  The
critical values for testing is are -2.57 and 2.57 since the area
under the Students t distribution
curve with 5 degrees-of-freedom outside this range is 5%
*  p-value for intercept is 67.8% implying that it is not
significantly different from zero 
*  The p-value for the
intercept is the area under the Students t-distribution curve
with 5 degrees-of-freedom outside the range of [-0.44,0.44]. * 
p-value for slope is less than 5% implying that it is
significantly different from zero 
*  The p-value for the slope
is the area under the Students t-distribution curve with 5
degrees of- freedom outside the range of [-94.76,94.76].



