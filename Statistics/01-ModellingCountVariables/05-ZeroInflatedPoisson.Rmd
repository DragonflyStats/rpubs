

```R
install.packages("pscl")
library(pscl)
```

    Installing package into '/home/nbcommon/R'
    (as 'lib' is unspecified)



```R
fishing <- read.csv("https://raw.githubusercontent.com/RWorkshop/workshopdatasets/master/fishing.csv")

head(fishing)
```


<table>
<thead><tr><th>X</th><th>nofish</th><th>livebait</th><th>camper</th><th>persons</th><th>child</th><th>xb</th><th>zg</th><th>count</th></tr></thead>
<tbody>
	<tr><td>1         </td><td>1         </td><td>0         </td><td>0         </td><td>1         </td><td>0         </td><td>-0.8963146</td><td> 3.0504048</td><td>0         </td></tr>
	<tr><td>2         </td><td>0         </td><td>1         </td><td>1         </td><td>1         </td><td>0         </td><td>-0.5583450</td><td> 1.7461489</td><td>0         </td></tr>
	<tr><td>3         </td><td>0         </td><td>1         </td><td>0         </td><td>1         </td><td>0         </td><td>-0.4017310</td><td> 0.2799389</td><td>0         </td></tr>
	<tr><td>4         </td><td>0         </td><td>1         </td><td>1         </td><td>2         </td><td>1         </td><td>-0.9562981</td><td>-0.6015257</td><td>0         </td></tr>
	<tr><td>5         </td><td>0         </td><td>1         </td><td>0         </td><td>1         </td><td>0         </td><td> 0.4368910</td><td> 0.5277091</td><td>1         </td></tr>
	<tr><td>6         </td><td>0         </td><td>1         </td><td>1         </td><td>4         </td><td>2         </td><td> 1.3944855</td><td>-0.7075348</td><td>0         </td></tr>
</tbody>
</table>




```R
summary(fishing)
```


           X              nofish         livebait         camper     
     Min.   :  1.00   Min.   :0.000   Min.   :0.000   Min.   :0.000  
     1st Qu.: 63.25   1st Qu.:0.000   1st Qu.:1.000   1st Qu.:0.000  
     Median :125.50   Median :0.000   Median :1.000   Median :1.000  
     Mean   :125.50   Mean   :0.296   Mean   :0.864   Mean   :0.588  
     3rd Qu.:187.75   3rd Qu.:1.000   3rd Qu.:1.000   3rd Qu.:1.000  
     Max.   :250.00   Max.   :1.000   Max.   :1.000   Max.   :1.000  
        persons          child             xb                  zg         
     Min.   :1.000   Min.   :0.000   Min.   :-3.275050   Min.   :-5.6259  
     1st Qu.:2.000   1st Qu.:0.000   1st Qu.: 0.008267   1st Qu.:-1.2527  
     Median :2.000   Median :0.000   Median : 0.954550   Median : 0.6051  
     Mean   :2.528   Mean   :0.684   Mean   : 0.973796   Mean   : 0.2523  
     3rd Qu.:4.000   3rd Qu.:1.000   3rd Qu.: 1.963855   3rd Qu.: 1.9932  
     Max.   :4.000   Max.   :3.000   Max.   : 5.352674   Max.   : 4.2632  
         count        
     Min.   :  0.000  
     1st Qu.:  0.000  
     Median :  0.000  
     Mean   :  3.296  
     3rd Qu.:  2.000  
     Max.   :149.000  



```R
summary(m1 <- zeroinfl(count ~ child + camper |persons, data = fishing))
```


    
    Call:
    zeroinfl(formula = count ~ child + camper | persons, data = fishing)
    
    Pearson residuals:
        Min      1Q  Median      3Q     Max 
    -1.2369 -0.7540 -0.6080 -0.1921 24.0847 
    
    Count model coefficients (poisson with log link):
                Estimate Std. Error z value Pr(>|z|)    
    (Intercept)  1.59789    0.08554  18.680   <2e-16 ***
    child       -1.04284    0.09999 -10.430   <2e-16 ***
    camper       0.83402    0.09363   8.908   <2e-16 ***
    
    Zero-inflation model coefficients (binomial with logit link):
                Estimate Std. Error z value Pr(>|z|)    
    (Intercept)   1.2974     0.3739   3.470 0.000520 ***
    persons      -0.5643     0.1630  -3.463 0.000534 ***
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
    
    Number of iterations in BFGS optimization: 12 
    Log-likelihood: -1032 on 5 Df



```R
newdata1 <- expand.grid(0:3, factor(0:1), 1:4)
colnames(newdata1) <- c("child", "camper", "persons")
newdata1 <- subset(newdata1, subset=(child<=persons))
newdata1$phat <- predict(m1, newdata1)


```


```R
library(ggplot2)
```


```R
ggplot(newdata1, aes(x = child, y = phat, colour = factor(persons))) +
  geom_point() +
  geom_line() +
  facet_wrap(~camper) +
  labs(x = "Number of Children", y = "Predicted Fish Caught")
```




![png](output_6_1.png)



```R

```
