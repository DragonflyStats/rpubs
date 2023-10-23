

```R
## quasipoisson. compare with example(glm)
counts <- c(18,17,15,20,10,20,25,13,12)
outcome <- gl(3,1,9)
treatment <- gl(3,3)
d.AD <- data.frame(treatment, outcome, counts)
```


```R
d.AD
```


<table>
<thead><tr><th>treatment</th><th>outcome</th><th>counts</th></tr></thead>
<tbody>
	<tr><td>1 </td><td>1 </td><td>18</td></tr>
	<tr><td>1 </td><td>2 </td><td>17</td></tr>
	<tr><td>1 </td><td>3 </td><td>15</td></tr>
	<tr><td>2 </td><td>1 </td><td>20</td></tr>
	<tr><td>2 </td><td>2 </td><td>10</td></tr>
	<tr><td>2 </td><td>3 </td><td>20</td></tr>
	<tr><td>3 </td><td>1 </td><td>25</td></tr>
	<tr><td>3 </td><td>2 </td><td>13</td></tr>
	<tr><td>3 </td><td>3 </td><td>12</td></tr>
</tbody>
</table>




```R
var(counts)/mean(counts)
```


1.32



```R
glm.pois <- glm(counts ~ outcome + treatment, family = poisson())
summary(glm.pois)
```


    
    Call:
    glm(formula = counts ~ outcome + treatment, family = poisson())
    
    Deviance Residuals: 
           1         2         3         4         5         6         7         8  
    -0.67125   0.96272  -0.16965  -0.21999  -0.95552   1.04939   0.84715  -0.09167  
           9  
    -0.96656  
    
    Coefficients:
                  Estimate Std. Error z value Pr(>|z|)    
    (Intercept)  3.045e+00  1.709e-01  17.815   <2e-16 ***
    outcome2    -4.543e-01  2.022e-01  -2.247   0.0246 *  
    outcome3    -2.930e-01  1.927e-01  -1.520   0.1285    
    treatment2   1.380e-16  2.000e-01   0.000   1.0000    
    treatment3   2.781e-16  2.000e-01   0.000   1.0000    
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    
    (Dispersion parameter for poisson family taken to be 1)
    
        Null deviance: 10.5814  on 8  degrees of freedom
    Residual deviance:  5.1291  on 4  degrees of freedom
    AIC: 56.761
    
    Number of Fisher Scoring iterations: 4




```R
glm.qpois <- glm(counts ~ outcome + treatment, family = quasipoisson())
summary(glm.qpois)
```


    
    Call:
    glm(formula = counts ~ outcome + treatment, family = quasipoisson())
    
    Deviance Residuals: 
           1         2         3         4         5         6         7         8  
    -0.67125   0.96272  -0.16965  -0.21999  -0.95552   1.04939   0.84715  -0.09167  
           9  
    -0.96656  
    
    Coefficients:
                  Estimate Std. Error t value Pr(>|t|)    
    (Intercept)  3.045e+00  1.944e-01  15.665  9.7e-05 ***
    outcome2    -4.543e-01  2.299e-01  -1.976    0.119    
    outcome3    -2.930e-01  2.192e-01  -1.337    0.252    
    treatment2   1.380e-16  2.274e-01   0.000    1.000    
    treatment3   2.781e-16  2.274e-01   0.000    1.000    
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    
    (Dispersion parameter for quasipoisson family taken to be 1.2933)
    
        Null deviance: 10.5814  on 8  degrees of freedom
    Residual deviance:  5.1291  on 4  degrees of freedom
    AIC: NA
    
    Number of Fisher Scoring iterations: 4




```R

```


```R
anova(glm.qpois, test = "F")
```


<table>
<thead><tr><th></th><th>Df</th><th>Deviance</th><th>Resid. Df</th><th>Resid. Dev</th><th>F</th><th>Pr(&gt;F)</th></tr></thead>
<tbody>
	<tr><th>NULL</th><td>NA       </td><td>      NA </td><td>8        </td><td>10.581446</td><td>      NA </td><td>       NA</td></tr>
	<tr><th>outcome</th><td> 2       </td><td>5.452305 </td><td>6        </td><td> 5.129141</td><td>2.107903 </td><td>0.2370389</td></tr>
	<tr><th>treatment</th><td> 2       </td><td>0.000000 </td><td>4        </td><td> 5.129141</td><td>0.000000 </td><td>1.0000000</td></tr>
</tbody>
</table>




```R
## for Poisson results use
anova(glm.qpois, dispersion = 1, test = "Chisq")

```


<table>
<thead><tr><th></th><th>Df</th><th>Deviance</th><th>Resid. Df</th><th>Resid. Dev</th><th>Pr(&gt;Chi)</th></tr></thead>
<tbody>
	<tr><th>NULL</th><td>NA        </td><td>      NA  </td><td>8         </td><td>10.581446 </td><td>        NA</td></tr>
	<tr><th>outcome</th><td> 2        </td><td>5.452305  </td><td>6         </td><td> 5.129141 </td><td>0.06547071</td></tr>
	<tr><th>treatment</th><td> 2        </td><td>0.000000  </td><td>4         </td><td> 5.129141 </td><td>1.00000000</td></tr>
</tbody>
</table>




```R
summary(glm.qpois, dispersion = 1)
```


    
    Call:
    glm(formula = counts ~ outcome + treatment, family = quasipoisson())
    
    Deviance Residuals: 
           1         2         3         4         5         6         7         8  
    -0.67125   0.96272  -0.16965  -0.21999  -0.95552   1.04939   0.84715  -0.09167  
           9  
    -0.96656  
    
    Coefficients:
                  Estimate Std. Error z value Pr(>|z|)    
    (Intercept)  3.045e+00  1.709e-01  17.815   <2e-16 ***
    outcome2    -4.543e-01  2.022e-01  -2.247   0.0246 *  
    outcome3    -2.930e-01  1.927e-01  -1.520   0.1285    
    treatment2   1.380e-16  2.000e-01   0.000   1.0000    
    treatment3   2.781e-16  2.000e-01   0.000   1.0000    
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    
    (Dispersion parameter for quasipoisson family taken to be 1)
    
        Null deviance: 10.5814  on 8  degrees of freedom
    Residual deviance:  5.1291  on 4  degrees of freedom
    AIC: NA
    
    Number of Fisher Scoring iterations: 4




```R

```


```R

```
