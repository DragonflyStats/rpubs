#### Problem
By use of the logistic regression equation of vehicle transmission in the data set mtcars, estimate the probability of a vehicle being fitted with a manual transmission if it has a 120hp engine and weights 2800 lbs.

#### Solution
We apply the function glm to a formula that describes the transmission type (am) by the horsepower (hp) and weight (wt). This creates a generalized linear model (GLM) in the binomial family.

<pre><code>
> am.glm = glm(formula=am ~ hp + wt, 
+              data=mtcars, 
+              family=binomial)
</code></pre>
We then wrap the test parameters inside a data frame newdata.

<pre><code>
> newdata = data.frame(hp=120, wt=2.8)
</code></pre>
Now we apply the function predict to the generalized linear model am.glm along with newdata. We will have to select response prediction type in order to obtain the predicted probability.
<pre><code>
> predict(am.glm, newdata, type="response") 
      1 
0.64181
</code></pre>

#### Answer
For an automobile with 120hp engine and 2800 lbs weight, the probability of it being fitted with a manual transmission is about 64%.

#### Significance Test for Logistic Regression

We can decide whether there is any significant relationship between the dependent variable y and the independent variables xk (k = 1, 2, ..., p) in the logistic regression equation. In particular, if any of the null hypothesis that βk = 0 (k = 1, 2, ..., p) is valid, then xk is statistically insignificant in the logistic regression model.

#### Problem
At .05 significance level, decide if any of the independent variables in the logistic regression model of vehicle transmission in data set mtcars is statistically insignificant.

#### Solution
We apply the function glm to a formula that describes the transmission type (am) by the horsepower (hp) and weight (wt). This creates a generalized linear model (GLM) in the binomial family.
<pre><code>
> am.glm = glm(formula=am ~ hp + wt, 
+              data=mtcars, 
+              family=binomial)
</code></pre>
We then print out the summary of the generalized linear model and check for the p-values of the hp and wt variables.
<pre><code>
> summary(am.glm) 
 
Call: 
glm(formula = am ~ hp + wt, family = binomial, data = mtcars) 
 
Deviance Residuals: 
    Min       1Q   Median       3Q      Max 
-2.2537  -0.1568  -0.0168   0.1543   1.3449 
 
Coefficients: 
            Estimate Std. Error z value Pr(>|z|) 
(Intercept)  18.8663     7.4436    2.53   0.0113 * 
hp            0.0363     0.0177    2.04   0.0409 * 
wt           -8.0835     3.0687   -2.63   0.0084 ** 
--- 
Signif. codes:  0 *** 0.001 ** 0.01 * 0.05 . 0.1   1 
 
(Dispersion parameter for binomial family taken to be 1) 
 
    Null deviance: 43.230  on 31  degrees of freedom 
Residual deviance: 10.059  on 29  degrees of freedom 
AIC: 16.06 
 
Number of Fisher Scoring iterations: 8
</code></pre>
#### Answer
As the p-values of the hp and wt variables are both less than 0.05, neither hp or wt is insignificant in the logistic regression model.



#### Note
Further detail of the function predict for generalized linear model can be found in the R documentation.
<pre><code>
> help(predict.glm)
</code></pre>
