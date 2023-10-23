

```R
library(VGAM)
```

Zero Truncated Poisson Distribution
===================================

* The **zero-truncated Poisson (ZTP)** distribution is a certain discrete probability distribution whose support is the set of **positive integers**. 
* This distribution is also known as the conditional Poisson distribution or the positive Poisson distribution.
* It is the conditional probability distribution of a Poisson-distributed random variable, given that the value of the random variable is not zero. Thus it is impossible for a ZTP random variable to be zero. 


Since the ZTP is a truncated distribution with the truncation stipulated as k &gt; 0, one can derive the probability mass 
function g(k;λ) from a standard Poisson distribution f(k;λ) as follows: 
$$g(k;\lambda) = P(X = k \mid k &gt; 0) = 
\frac{f(k;\lambda)}{1-f(0;\lambda)} = 
\frac{\lambda ^ k e^{- \lambda} }{k ! \left ( 1 - e^{- \lambda} \right )} = \frac{\lambda^k}{(e^\lambda-1)k!}$$

#### Distribution Parameters
The mean is
$$ \operatorname{E}[X]=\frac{\lambda}{1-e^{-\lambda}}=\frac{\lambda e^\lambda}{e^\lambda-1} $$
and the variance is
$$ \operatorname{Var}[X]=\frac{\lambda}{1-e^{-\lambda}} - \frac{\lambda^2 e^{-\lambda}}{(1-e^{-\lambda})^2}$$ 
$$ = \frac{\lambda e^\lambda}{e^\lambda-1}\left[1-\frac{\lambda}{e^\lambda-1}\right] $$




```R
library(pscl)
```

#### Load the Data


```R
hospital <- read.csv("https://raw.githubusercontent.com/RWorkshop/workshopdatasets/master/hospitalstay.csv")
```


```R
head(hospital)
```


<table>
<thead><tr><th>X</th><th>stay</th><th>age</th><th>hmo</th><th>died</th></tr></thead>
<tbody>
	<tr><td>1</td><td>4</td><td>4</td><td>0</td><td>0</td></tr>
	<tr><td>2</td><td>9</td><td>4</td><td>1</td><td>0</td></tr>
	<tr><td>3</td><td>3</td><td>7</td><td>1</td><td>1</td></tr>
	<tr><td>4</td><td>9</td><td>6</td><td>0</td><td>0</td></tr>
	<tr><td>5</td><td>1</td><td>7</td><td>0</td><td>1</td></tr>
	<tr><td>6</td><td>4</td><td>5</td><td>0</td><td>1</td></tr>
</tbody>
</table>




```R
summary(hospital)
```


           X             stay             age             hmo        
     Min.   :   1   Min.   : 1.000   Min.   :1.000   Min.   :0.0000  
     1st Qu.: 374   1st Qu.: 4.000   1st Qu.:4.000   1st Qu.:0.0000  
     Median : 747   Median : 8.000   Median :5.000   Median :0.0000  
     Mean   : 747   Mean   : 9.729   Mean   :5.234   Mean   :0.1601  
     3rd Qu.:1120   3rd Qu.:13.000   3rd Qu.:6.000   3rd Qu.:0.0000  
     Max.   :1493   Max.   :74.000   Max.   :9.000   Max.   :1.0000  
          died       
     Min.   :0.0000  
     1st Qu.:0.0000  
     Median :0.0000  
     Mean   :0.3429  
     3rd Qu.:1.0000  
     Max.   :1.0000  



```R
mean(hospital$stay);var(hospital$stay)
```


9.72873409243135



66.1441939057873



```R
m1 <- vglm(stay ~ age + hmo + died,
   family = pospoisson(),
   data = hospital)
summary(m1)
```


    
    Call:
    vglm(formula = stay ~ age + hmo + died, family = pospoisson(), 
        data = hospital)
    
    Pearson residuals:
                    Min     1Q  Median     3Q   Max
    loge(lambda) -3.032 -1.727 -0.5868 0.9794 20.84
    
    Coefficients:
                 Estimate Std. Error z value Pr(>|z|)    
    (Intercept)  2.435808   0.027332  89.119  < 2e-16 ***
    age         -0.014442   0.005035  -2.869  0.00412 ** 
    hmo         -0.135903   0.023741  -5.724 1.04e-08 ***
    died        -0.203771   0.018372 -11.091  < 2e-16 ***
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    
    Number of linear predictors:  1 
    
    Name of linear predictor: loge(lambda) 
    
    Dispersion Parameter for pospoisson family:   1
    
    Log-likelihood: -6908.799 on 1489 degrees of freedom
    
    Number of iterations: 3 



```R
testData <- hospital[c(5,6,12,19),]
testData
```


<table>
<thead><tr><th></th><th>X</th><th>stay</th><th>age</th><th>hmo</th><th>died</th></tr></thead>
<tbody>
	<tr><th>5</th><td> 5</td><td>1 </td><td>7 </td><td>0 </td><td>1 </td></tr>
	<tr><th>6</th><td> 6</td><td>4 </td><td>5 </td><td>0 </td><td>1 </td></tr>
	<tr><th>12</th><td>12</td><td>9 </td><td>5 </td><td>1 </td><td>0 </td></tr>
	<tr><th>19</th><td>19</td><td>4 </td><td>4 </td><td>1 </td><td>0 </td></tr>
</tbody>
</table>




```R
predict(m1, testData)
```


<ol class="list-inline">
	<li>2.13094316211019</li>
	<li>2.15982721524316</li>
	<li>2.22769481190794</li>
	<li>2.24213683847442</li>
</ol>




```R
summary(m1)
```


    
    Call:
    vglm(formula = stay ~ age + hmo + died, family = pospoisson(), 
        data = hospital)
    
    Pearson residuals:
                    Min     1Q  Median     3Q   Max
    loge(lambda) -3.032 -1.727 -0.5868 0.9794 20.84
    
    Coefficients:
                 Estimate Std. Error z value Pr(>|z|)    
    (Intercept)  2.435808   0.027332  89.119  < 2e-16 ***
    age         -0.014442   0.005035  -2.869  0.00412 ** 
    hmo         -0.135903   0.023741  -5.724 1.04e-08 ***
    died        -0.203771   0.018372 -11.091  < 2e-16 ***
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    
    Number of linear predictors:  1 
    
    Name of linear predictor: loge(lambda) 
    
    Dispersion Parameter for pospoisson family:   1
    
    Log-likelihood: -6908.799 on 1489 degrees of freedom
    
    Number of iterations: 3 



```R

```
