

```R
install.packages("AppliedPredictiveModeling")
library(AppliedPredictiveModeling)
data(schedulingData)
library(caret)
```

    Installing package into '/home/nbcommon/R'
    (as 'lib' is unspecified)


#### Scheduling Data
These data consist of information on 4331 jobs in a high performance computing en-
vironment. Seven attributes were recorded for each job along with a discrete class
describing the execution time.

The predictors are:
1. ***Protocol*** the type of computation,
2. ***Compounds*** the number of data points for each jobs,
3. ***InputFields*** the number of characteristic being estimated,
4. ***Iterations*** maximum number of iterations for the computations,
5. ***NumPending*** the number of other jobs pending at the time of launch,
6. ***Hour*** decimal hour of day for launch time, 
7. ***Day*** day of launch time.

The classes are: VF (very fast), F (fast), M (moderate) and L (long).



```R
dim(schedulingData)
```


<ol class="list-inline">
	<li>4331</li>
	<li>8</li>
</ol>




```R
tail(schedulingData)
```


<table>
<thead><tr><th></th><th>Protocol</th><th>Compounds</th><th>InputFields</th><th>Iterations</th><th>NumPending</th><th>Hour</th><th>Day</th><th>Class</th></tr></thead>
<tbody>
	<tr><th>4326</th><td>O        </td><td>971      </td><td>615      </td><td> 20      </td><td>0        </td><td>12.633333</td><td>Mon      </td><td>L        </td></tr>
	<tr><th>4327</th><td>O        </td><td>967      </td><td>611      </td><td> 20      </td><td>0        </td><td>12.633333</td><td>Mon      </td><td>L        </td></tr>
	<tr><th>4328</th><td>O        </td><td>972      </td><td>613      </td><td> 20      </td><td>0        </td><td>12.616667</td><td>Mon      </td><td>L        </td></tr>
	<tr><th>4329</th><td>O        </td><td>963      </td><td>607      </td><td>200      </td><td>0        </td><td> 4.066667</td><td>Thu      </td><td>L        </td></tr>
	<tr><th>4330</th><td>O        </td><td>964      </td><td>607      </td><td>200      </td><td>0        </td><td> 3.616667</td><td>Fri      </td><td>L        </td></tr>
	<tr><th>4331</th><td>O        </td><td> 92      </td><td>829      </td><td> 20      </td><td>0        </td><td>22.550000</td><td>Tue      </td><td>M        </td></tr>
</tbody>
</table>




```R
summary(schedulingData)
```


        Protocol      Compounds        InputFields      Iterations    
     J      : 989   Min.   :   20.0   Min.   :   10   Min.   : 10.00  
     O      : 581   1st Qu.:   98.0   1st Qu.:  134   1st Qu.: 20.00  
     N      : 536   Median :  226.0   Median :  426   Median : 20.00  
     M      : 451   Mean   :  497.7   Mean   : 1537   Mean   : 29.24  
     I      : 381   3rd Qu.:  448.0   3rd Qu.:  991   3rd Qu.: 20.00  
     H      : 321   Max.   :14103.0   Max.   :56671   Max.   :200.00  
     (Other):1072                                                     
       NumPending           Hour           Day      Class    
     Min.   :   0.00   Min.   : 0.01667   Mon:692   VF:2211  
     1st Qu.:   0.00   1st Qu.:10.90000   Tue:900   F :1347  
     Median :   0.00   Median :14.01667   Wed:903   M : 514  
     Mean   :  53.39   Mean   :13.73376   Thu:720   L : 259  
     3rd Qu.:   0.00   3rd Qu.:16.60000   Fri:923            
     Max.   :5605.00   Max.   :23.98333   Sat: 32            
                                          Sun:161            



```R
set.seed(1234)

inTrain <- createDataPartition(schedulingData$Class, p = .75,list = FALSE)

training <- schedulingData[ inTrain,]
testing <- schedulingData[-inTrain,]

```


```R
dim(training)
```


<ol class="list-inline">
	<li>3251</li>
	<li>8</li>
</ol>




```R
dim(testing)
```


<ol class="list-inline">
	<li>1080</li>
	<li>8</li>
</ol>




```R
library(C50)
ClassTree <- C5.0(Class ~ ., data = training)
ClassTree

```


    
    Call:
    C5.0.formula(formula = Class ~ ., data = training)
    
    Classification Tree
    Number of samples: 3251 
    Number of predictors: 7 
    
    Tree size: 178 
    
    Non-standard options: attempt to group attributes




```R
ClassTreePred <- predict(ClassTree, testing)
table(ClassTreePred)
```


    ClassTreePred
     VF   F   M   L 
    549 360 124  47 



```R
addmargins(table(testing$Class,ClassTreePred))
```


<table>
<thead><tr><th></th><th>VF</th><th>F</th><th>M</th><th>L</th><th>Sum</th></tr></thead>
<tbody>
	<tr><th>VF</th><td>490 </td><td> 57 </td><td>  5 </td><td> 0  </td><td> 552</td></tr>
	<tr><th>F</th><td> 52 </td><td>250 </td><td> 30 </td><td> 4  </td><td> 336</td></tr>
	<tr><th>M</th><td>  6 </td><td> 44 </td><td> 77 </td><td> 1  </td><td> 128</td></tr>
	<tr><th>L</th><td>  1 </td><td>  9 </td><td> 12 </td><td>42  </td><td>  64</td></tr>
	<tr><th>Sum</th><td>549 </td><td>360 </td><td>124 </td><td>47  </td><td>1080</td></tr>
</tbody>
</table>




```R
ClassTreeProbs <- predict(ClassTree, testing, type ="prob")
head(ClassTreeProbs)

```


<table>
<thead><tr><th></th><th>VF</th><th>F</th><th>M</th><th>L</th></tr></thead>
<tbody>
	<tr><th>11</th><td>0.9753207   </td><td>0.024159830 </td><td>0.0003451532</td><td>0.0001743649</td></tr>
	<tr><th>13</th><td>0.9753207   </td><td>0.024159830 </td><td>0.0003451532</td><td>0.0001743649</td></tr>
	<tr><th>27</th><td>0.9918384   </td><td>0.005183021 </td><td>0.0019788783</td><td>0.0009996924</td></tr>
	<tr><th>33</th><td>0.9918384   </td><td>0.005183021 </td><td>0.0019788783</td><td>0.0009996924</td></tr>
	<tr><th>38</th><td>0.9918384   </td><td>0.005183021 </td><td>0.0019788783</td><td>0.0009996924</td></tr>
	<tr><th>43</th><td>0.9896549   </td><td>0.009104036 </td><td>0.0008245326</td><td>0.0004165385</td></tr>
</tbody>
</table>



#### postResample

This function calculates performance across resamples.
    
Given two numeric vectors of data, the mean squared error and R-squared are calculated. 
For two factors, the overall agreement rate and Kappa are determined.


```R
postResample(ClassTreePred, testing$Class)

```


<dl class="dl-horizontal">
	<dt>Accuracy</dt>
		<dd>0.79537037037037</dd>
	<dt>Kappa</dt>
		<dd>0.670109134333639</dd>
</dl>




```R
C5imp(ClassTree)
```


<table>
<thead><tr><th></th><th>Overall</th></tr></thead>
<tbody>
	<tr><th>Protocol</th><td>100.00</td></tr>
	<tr><th>Iterations</th><td>100.00</td></tr>
	<tr><th>Compounds</th><td> 96.86</td></tr>
	<tr><th>NumPending</th><td> 82.74</td></tr>
	<tr><th>InputFields</th><td> 71.64</td></tr>
	<tr><th>Day</th><td> 27.07</td></tr>
	<tr><th>Hour</th><td> 17.59</td></tr>
</tbody>
</table>




```R
schedulingData$NumPending <- schedulingData$NumPending + 1

# Cant have log(0)
```


```R

set.seed(1234)

inTrain <- createDataPartition(schedulingData$Class, p = .75,list = FALSE)

training <- schedulingData[ inTrain,]
testing <- schedulingData[-inTrain,]
```


```R


newformula <- as.formula(Class ~ Protocol + log10(Compounds) +
                      log10(InputFields)+ log10(Iterations) +
                      log10(NumPending) + Hour + Day)
```


```R
ClassTree2 <- C5.0(newformula, data = training)
ClassTree2

```


    
    Call:
    C5.0.formula(formula = newformula, data = training)
    
    Classification Tree
    Number of samples: 3251 
    Number of predictors: 7 
    
    Tree size: 185 
    
    Non-standard options: attempt to group attributes




```R
C5imp(ClassTree2)
```


<table>
<thead><tr><th></th><th>Overall</th></tr></thead>
<tbody>
	<tr><th>Protocol</th><td>100.00</td></tr>
	<tr><th>log10(Iterations)</th><td>100.00</td></tr>
	<tr><th>log10(Compounds)</th><td> 96.86</td></tr>
	<tr><th>log10(NumPending)</th><td> 83.54</td></tr>
	<tr><th>log10(InputFields)</th><td> 71.12</td></tr>
	<tr><th>Day</th><td> 28.30</td></tr>
	<tr><th>Hour</th><td> 15.60</td></tr>
</tbody>
</table>




```R
ClassTreePred2 <- predict(ClassTree2, testing)
table(ClassTreePred2)
```


    ClassTreePred2
     VF   F   M   L 
    541 364 128  47 



```R
postResample(ClassTreePred2, testing$Class)

```


<dl class="dl-horizontal">
	<dt>Accuracy</dt>
		<dd>0.796296296296296</dd>
	<dt>Kappa</dt>
		<dd>0.672759726308135</dd>
</dl>




```R
C5.0Fit <- train(newformula, data = training,
 data = training,
 method = "C5.0")
 ## Center and scale the predictors for the training
 ## set and all future samples.
 ## preProc = c("center", "scale"))
```


```R

```
