

```R
library(MASS)

library(magrittr)
```

#### Negative Binomial Regression with R


Negative binomial regression is for modeling **over-dispersed** count outcome variables.

* Negative binomial regression can be used for over-dispersed count data, that is when the conditional 
variance exceeds the conditional mean. 
$$ Var(X) &gt; E(X) $$
* It can be considered as a generalization of Poisson regression since it has the same mean structure as Poisson regression and it has an extra parameter (***r***) to model the over-dispersion. 

$$\Pr(X = k) = {k+r-1 \choose k} p^k(1- p)^r \quad \mbox{for }k = 0, 1, 2, \dots $$




```R
negbin <-read.csv("https://raw.githubusercontent.com/RWorkshop/workshopdatasets/master/negbin.csv")
```


```R
head(negbin)
```


<table>
<thead><tr><th>X</th><th>id</th><th>gender</th><th>math</th><th>daysabs</th><th>prog</th></tr></thead>
<tbody>
	<tr><td>1     </td><td>1001  </td><td>male  </td><td>63    </td><td> 4    </td><td>2     </td></tr>
	<tr><td>2     </td><td>1002  </td><td>male  </td><td>27    </td><td> 4    </td><td>2     </td></tr>
	<tr><td>3     </td><td>1003  </td><td>female</td><td>20    </td><td> 2    </td><td>2     </td></tr>
	<tr><td>4     </td><td>1004  </td><td>female</td><td>16    </td><td> 3    </td><td>2     </td></tr>
	<tr><td>5     </td><td>1005  </td><td>female</td><td> 2    </td><td> 3    </td><td>2     </td></tr>
	<tr><td>6     </td><td>1006  </td><td>female</td><td>71    </td><td>13    </td><td>2     </td></tr>
</tbody>
</table>




```R
summary(negbin)
```


           X                id          gender         math          daysabs      
     Min.   :  1.00   Min.   :1001   female:160   Min.   : 1.00   Min.   : 0.000  
     1st Qu.: 79.25   1st Qu.:1079   male  :154   1st Qu.:28.00   1st Qu.: 1.000  
     Median :157.50   Median :1158                Median :48.00   Median : 4.000  
     Mean   :157.50   Mean   :1576                Mean   :48.27   Mean   : 5.955  
     3rd Qu.:235.75   3rd Qu.:2078                3rd Qu.:70.00   3rd Qu.: 8.000  
     Max.   :314.00   Max.   :2157                Max.   :99.00   Max.   :35.000  
          prog      
     Min.   :1.000  
     1st Qu.:2.000  
     Median :2.000  
     Mean   :2.213  
     3rd Qu.:3.000  
     Max.   :3.000  



```R

negbin$prog <- factor(negbin$prog)
summary(negbin)
```


           X                id          gender         math          daysabs      
     Min.   :  1.00   Min.   :1001   female:160   Min.   : 1.00   Min.   : 0.000  
     1st Qu.: 79.25   1st Qu.:1079   male  :154   1st Qu.:28.00   1st Qu.: 1.000  
     Median :157.50   Median :1158                Median :48.00   Median : 4.000  
     Mean   :157.50   Mean   :1576                Mean   :48.27   Mean   : 5.955  
     3rd Qu.:235.75   3rd Qu.:2078                3rd Qu.:70.00   3rd Qu.: 8.000  
     Max.   :314.00   Max.   :2157                Max.   :99.00   Max.   :35.000  
     prog   
     1: 40  
     2:167  
     3:107  
            
            
            



```R
mean(negbin$daysabs)%>%round(4)
var(negbin$daysabs)%>%round(4)
```


5.9554



49.5188



```R
var(negbin$daysabs)/ mean(negbin$daysabs)
```


8.31491688165246



```R
myModel <- glm.nb(daysabs ~ math + prog,data = negbin)
```


```R
summary(myModel)
```


    
    Call:
    glm.nb(formula = daysabs ~ math + prog, data = negbin, init.theta = 1.032713156, 
        link = log)
    
    Deviance Residuals: 
        Min       1Q   Median       3Q      Max  
    -2.1547  -1.0192  -0.3694   0.2285   2.5273  
    
    Coefficients:
                 Estimate Std. Error z value Pr(>|z|)    
    (Intercept)  2.615265   0.197460  13.245  < 2e-16 ***
    math        -0.005993   0.002505  -2.392   0.0167 *  
    prog2       -0.440760   0.182610  -2.414   0.0158 *  
    prog3       -1.278651   0.200720  -6.370 1.89e-10 ***
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    
    (Dispersion parameter for Negative Binomial(1.0327) family taken to be 1)
    
        Null deviance: 427.54  on 313  degrees of freedom
    Residual deviance: 358.52  on 310  degrees of freedom
    AIC: 1741.3
    
    Number of Fisher Scoring iterations: 1
    
    
                  Theta:  1.033 
              Std. Err.:  0.106 
    
     2 x log-likelihood:  -1731.258 



```R

```


```R

```


```R

```
