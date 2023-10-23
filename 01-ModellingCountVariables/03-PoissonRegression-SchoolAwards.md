

```R
install.packages("glm2")
library(glm2)
```

    Installing package into '/home/nbcommon/R'
    (as 'lib' is unspecified)


### Load Up the Data


```R
num_awards <- read.csv("https://raw.githubusercontent.com/RWorkshop/workshopdatasets/master/poissreg.csv")
```


```R
head(num_awards)
```


<table>
<thead><tr><th>X</th><th>id</th><th>num_awards</th><th>prog</th><th>math</th></tr></thead>
<tbody>
	<tr><td>1  </td><td> 45</td><td>0  </td><td>3  </td><td>41 </td></tr>
	<tr><td>2  </td><td>108</td><td>0  </td><td>1  </td><td>41 </td></tr>
	<tr><td>3  </td><td> 15</td><td>0  </td><td>3  </td><td>44 </td></tr>
	<tr><td>4  </td><td> 67</td><td>0  </td><td>3  </td><td>42 </td></tr>
	<tr><td>5  </td><td>153</td><td>0  </td><td>3  </td><td>40 </td></tr>
	<tr><td>6  </td><td> 51</td><td>0  </td><td>1  </td><td>42 </td></tr>
</tbody>
</table>




```R
dim(num_awards);
```


<ol class="list-inline">
	<li>200</li>
	<li>5</li>
</ol>




```R
mean(num_awards$num_awards);
var(num_awards$num_awards);
```


0.63



1.1086432160804



```R
model1 <- glm(num_awards ~ prog + math,
family="poisson", data=num_awards)

```


    
    Call:
    glm(formula = num_awards ~ prog + math, family = "poisson", data = num_awards)
    
    Deviance Residuals: 
        Min       1Q   Median       3Q      Max  
    -2.1840  -0.9003  -0.5891   0.3948   2.9539  
    
    Coefficients:
                 Estimate Std. Error z value Pr(>|z|)    
    (Intercept) -5.578057   0.676823  -8.242   <2e-16 ***
    prog         0.123273   0.163261   0.755     0.45    
    math         0.086121   0.009586   8.984   <2e-16 ***
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    
    (Dispersion parameter for poisson family taken to be 1)
    
        Null deviance: 287.67  on 199  degrees of freedom
    Residual deviance: 203.45  on 197  degrees of freedom
    AIC: 385.51
    
    Number of Fisher Scoring iterations: 6




```R
summary(model1)
```


    
    Call:
    glm(formula = num_awards ~ prog + math, family = "poisson", data = num_awards)
    
    Deviance Residuals: 
        Min       1Q   Median       3Q      Max  
    -2.1840  -0.9003  -0.5891   0.3948   2.9539  
    
    Coefficients:
                 Estimate Std. Error z value Pr(>|z|)    
    (Intercept) -5.578057   0.676823  -8.242   <2e-16 ***
    prog         0.123273   0.163261   0.755     0.45    
    math         0.086121   0.009586   8.984   <2e-16 ***
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    
    (Dispersion parameter for poisson family taken to be 1)
    
        Null deviance: 287.67  on 199  degrees of freedom
    Residual deviance: 203.45  on 197  degrees of freedom
    AIC: 385.51
    
    Number of Fisher Scoring iterations: 6




```R

```
