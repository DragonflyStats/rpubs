

```R
library(caret)

```

### Oil
Brodnjak-Voncina et al. (2005) describe a set of data where seven fatty acid compositions were 
used to classify commercial oils as either 
1. pumpkin (labeled A), 
2. sunflower(B), 
3. peanut (C), 
4. olive (D),
5. soybean (E), 
6. rapeseed (F)
7. corn (G). 


```R
data(oil)
data()

```


```R
head(fattyAcids)
```


<table>
<thead><tr><th>Palmitic</th><th>Stearic</th><th>Oleic</th><th>Linoleic</th><th>Linolenic</th><th>Eicosanoic</th><th>Eicosenoic</th></tr></thead>
<tbody>
	<tr><td> 9.7</td><td>5.2 </td><td>31.0</td><td>52.7</td><td>0.4 </td><td>0.4 </td><td>0.1 </td></tr>
	<tr><td>11.1</td><td>5.0 </td><td>32.9</td><td>49.8</td><td>0.3 </td><td>0.4 </td><td>0.1 </td></tr>
	<tr><td>11.5</td><td>5.2 </td><td>35.0</td><td>47.2</td><td>0.2 </td><td>0.4 </td><td>0.1 </td></tr>
	<tr><td>10.0</td><td>4.8 </td><td>30.4</td><td>53.5</td><td>0.3 </td><td>0.4 </td><td>0.1 </td></tr>
	<tr><td>12.2</td><td>5.0 </td><td>31.1</td><td>50.5</td><td>0.3 </td><td>0.4 </td><td>0.1 </td></tr>
	<tr><td> 9.8</td><td>4.2 </td><td>43.0</td><td>39.2</td><td>2.4 </td><td>0.4 </td><td>0.5 </td></tr>
</tbody>
</table>




```R
dim(fattyAcids)
```


<ol class="list-inline">
	<li>96</li>
	<li>7</li>
</ol>




```R
head(oilType)
```


<ol class="list-inline">
	<li>A</li>
	<li>A</li>
	<li>A</li>
	<li>A</li>
	<li>A</li>
	<li>A</li>
	<li>A</li>
	<li>A</li>
	<li>A</li>
	<li>A</li>
	<li>A</li>
	<li>A</li>
	<li>A</li>
	<li>A</li>
	<li>A</li>
	<li>A</li>
	<li>A</li>
	<li>A</li>
	<li>B</li>
	<li>B</li>
	<li>B</li>
	<li>B</li>
	<li>B</li>
	<li>B</li>
	<li>E</li>
	<li>E</li>
	<li>G</li>
	<li>F</li>
	<li>C</li>
	<li>B</li>
	<li>B</li>
	<li>B</li>
	<li>B</li>
	<li>B</li>
	<li>B</li>
	<li>A</li>
	<li>A</li>
	<li>A</li>
	<li>A</li>
	<li>A</li>
	<li>A</li>
	<li>D</li>
	<li>D</li>
	<li>E</li>
	<li>E</li>
	<li>E</li>
	<li>E</li>
	<li>E</li>
	<li>E</li>
	<li>E</li>
	<li>E</li>
	<li>D</li>
	<li>D</li>
	<li>D</li>
	<li>D</li>
	<li>D</li>
	<li>F</li>
	<li>F</li>
	<li>F</li>
	<li>F</li>
	<li>C</li>
	<li>C</li>
	<li>A</li>
	<li>A</li>
	<li>A</li>
	<li>A</li>
	<li>A</li>
	<li>A</li>
	<li>A</li>
	<li>A</li>
	<li>A</li>
	<li>A</li>
	<li>A</li>
	<li>A</li>
	<li>A</li>
	<li>B</li>
	<li>B</li>
	<li>B</li>
	<li>B</li>
	<li>B</li>
	<li>B</li>
	<li>B</li>
	<li>B</li>
	<li>B</li>
	<li>B</li>
	<li>B</li>
	<li>B</li>
	<li>B</li>
	<li>B</li>
	<li>F</li>
	<li>F</li>
	<li>G</li>
	<li>F</li>
	<li>F</li>
	<li>F</li>
	<li>E</li>
</ol>

&lt;details&gt;
	<summary style="display: list-item; cursor: pointer;">
		<strong>Levels</strong>:
	</summary>
	<ol class="list-inline">
		<li>'A'</li>
		<li>'B'</li>
		<li>'C'</li>
		<li>'D'</li>
		<li>'E'</li>
		<li>'F'</li>
		<li>'G'</li>
	</ol>
&lt;/details&gt;



```R

```


```R
table(oilType)
```


    oilType
     A  B  C  D  E  F  G 
    37 26  3  7 11 10  2 



```R
As a note, the paper states on page 32 that there are 37 unknown samples while the
table on pages 33 and 34 shows that there are 34 unknowns.
Using the data from the Examples section of caret::createFolds

```


```R

```


```R
#Linear Kernel
set.seed(1492)                     
 
#Train and Tune the SVM
svm.oil <- train(x=fattyAcids,
                    y= oilType,
                    method = "svmLinear")
 
 
svm.oil
```


    Support Vector Machines with Linear Kernel 
    
    96 samples
     7 predictor
     7 classes: 'A', 'B', 'C', 'D', 'E', 'F', 'G' 
    
    No pre-processing
    Resampling: Bootstrapped (25 reps) 
    Summary of sample sizes: 96, 96, 96, 96, 96, 96, ... 
    Resampling results:
    
      Accuracy   Kappa    
      0.9565851  0.9413195
    
    Tuning parameter 'C' was held constant at a value of 1
     



```R
table(oilType , predict(svm.oil))
```


           
    oilType  A  B  C  D  E  F  G
          A 36  1  0  0  0  0  0
          B  0 26  0  0  0  0  0
          C  0  0  3  0  0  0  0
          D  0  0  0  7  0  0  0
          E  0  0  0  0 11  0  0
          F  0  0  0  0  0 10  0
          G  0  0  0  0  0  0  2



```R

part <- createDataPartition(iris, 2)

```

    Warning message in createDataPartition(iris, 2):
    "Some classes have no records (  ) and these will be ignored"Warning message in createDataPartition(iris, 2):
    "Some classes have a single record (  ) and these will be selected for the sample"


```R
fold <- createFolds(iris, 2)

```


```R
length(Reduce(intersect, part))
# [1] 27
1
length(Reduce(intersect, fold))
#[1] 0
2
Looks
```


```R
Looks like createDataPartition split your data into smaller pieces, but allows for
the same example to appear in dierent splits.
createFolds doesn't allow dierent examples to appear in dierent splits of the
folds.
Basically, createDataPartition is used when you need to make one or more simple
two-way splits of your data. For example, if you want to make a training and test set
and keep your classes balanced, this is what you could use. It can also make multiple
splits of this kind (or leave-group-out CV aka Monte Carlos CV aka repeated training
test splits).
createFolds is exclusively for k-fold CV. Their usage is simular when you use the
returnTrain = TRUE option in createFolds.

```


```R
### createDataPartition
A series of test/training partitions are created using createDataPartition while cre-
ateResample creates one or more bootstrap samples. createFolds splits the data into k
groups while createTimeSlices creates cross-validation sample information to be used
with time series data.

```


```R
data(oil)
createDataPartition(oilType, 2)
$Resample1
[1] 4 8 9 10 11 12 13 15 18 36 37 41 64 65 70 71 72 73 75
[20] 19 21 22 33 34 35 76 78 79 80 81 86 87 29 62 42 52 55 56
[39] 25 26 44 48 49 51 28 59 91 93 94 92
$Resample2
```


```R



[1] 4 6 7 9 10 12 13 14 16 18 37 38 40 64 68 69 72 73 75
[20] 19 20 21 23 24 32 33 35 81 83 84 87 88 29 62 42 53 55 56
[39] 25 26 47 49 50 96 58 59 60 93 95 27
> createResample(oilType, 2)
$Resample1
[1] 2 3 5 5 6 6 6 6 7 8 9 9 9 9 10 10 10 11 12
[20] 13 14 16 16 19 20 21 21 22 22 23 27 27 27 28 28 29 30 30
[39] 31 34 34 35 35 35 35 36 37 38 39 41 41 41 43 45 46 48 51
[58] 53 54 56 57 58 58 59 65 65 65 66 69 71 73 73 73 75 79 81
[77] 81 82 83 83 84 84 84 84 85 85 85 86 88 88 89 90 90 94 96
[96] 96
4
$Resample2
[1] 4 4 6 6 8 10 11 11 11 12 14 16 16 17 17 17 19 20 20
[20] 20 21 22 22 22 24 26 27 28 30 31 33 34 34 35 37 38 41 41
[39] 43 44 45 45 47 47 54 55 56 57 57 59 59 60 60 61 63 63 65
[58] 65 65 65 66 66 67 68 68 69 69 70 74 77 77 77 77 78 78 79
[77] 80 81 82 82 82 83 83 84 85 85 86 87 87 88 89 90 91 93 94
[96] 94
5
```
