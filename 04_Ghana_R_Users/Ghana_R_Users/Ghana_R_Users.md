Ghana R Users (January 2022)
========================================================
author: Kevin O'Brien
date: 14-January-2022
width: 960
height: 800
transition: linear
css: rpres.css

About Me
========================================================

### Kevin O'Brien

- Why R? - Community Team lead & Webinars co-ordinator
- Python Ireland - Director
- JuliaCon 2021 - Social Media Chair


Introduction to Model Validation Procedures with R
===========================================


* Model validation is a vital part of the statistical modelling process, but is often overlooked in statistical courses.
* This process allows the analyst to properly validate the assumptions underlying the model, once applied to the data.
* 
In this presentation, we will look at residual analysis and influence measures for linear models, with some associated topics.


Audience 
===========================================

* The talk is aimed at students and early career data professionals who have already encountered conventional regression analyses, and
are familiar with the model fitting process in R (i.e. the ``lm()`` function). 
* The talke will introduce a mixture of graphical procedures,
statistical measures and hypothesis tests, which the attendees are invited to learn more about beyond the talk.

* The talk will feature the {CAR} R package [1], but all of the other functionality is available in Base R or Tidyverse.


[1] Fox, John, et al. "The car package." R Foundation for Statistical Computing (2007).


R Packages
================================


```r
library(tidyverse)

# Graphics & Data Inspection
library(inspectdf)
library(WVPlots)


# Statistics & Modelling
library(MASS)   # installed with Base R
library(car)
library(gvlma)
```



Domain Knowledge 
================================


https://www.linkedin.com/feed/update/urn:li:activity:6765853465861267456/



 * Agriculture and Food
 * Health & Life Sciences
 * Natural Sciences & GIS


Machine Learning - types of analysis
========================================================
Many Types of ML Problems
* Clustering 
* Classification
* Regression


#### Focus on Regression

* Predicting a numberic value based on predictors

Linear Models
=======================

#### Linear Models
 - `lm()`
 - `aov()`
 - ancova()

#### Random Forest



Key Motivations 
=============================

* All statistical models and tests have underlying mathematical assumptions on the types of conditions upon we can generate reliable results (Hoekstra et al., 2012). 

* What this means is that before we go off and generate predictions, p-values and correlation coefficients, we need to understand whether our data fits certain assumption criteria in order to avoid Type I or II errors given the technique at hand.




Feature Engineering
========================================================

Not Covering This - but it is important

* Feature Engineering
* Normalisation
* Scaling
* One-hot Encoding

* {caret} package



Exploratory Data Analysis
================================

BE THOROUGH

* Domain Knowledge
* Summary Statistics
* Data Visualization
* Outlier Detection
* Missing Data Analysis


#### Remark: 

Cluster Analysis (e.g. K-means) can be a very useful EDA procedure.



Exploratory Data Analysis
========================================================

#### Data Inspection

* {inspectdf}
* {janitor}

#### Data Visualization

* {WVPlots}
* {ggally}

#### tidyverse

* {broom} and {modelr} (succeeded by {tidymodels})
* `dplyr::tally()`
* `dplyr::distinct()`

Useful Packages (a selection)
========================================================

* {A3}
* {arsenal}
* {analytics}
* {gdata}
* {descriptr}
* {furniture}
* {rockchalk}
* {yardstick}



InspectDF
==============================
#### InspectDF

inspectdf: Inspection, Comparison and Visualisation of Data Frames

inspectdf is collection of utilities for columnwise summary, comparison and visualisation of data frames. Functions are provided to summarise missingness, categorical levels, numeric distribution, correlation, column types and memory usage. 
The package has three aims: to speed up repetitive checking and exploratory tasks for data frames

InspectDF
================================
Key functions
* ``inspect_types()``: summary of column types
* ``inspect_mem()``: summary of memory usage of columns
* ``inspect_na()``: columnwise prevalence of missing values
* ``inspect_cor()``: correlation coefficients of numeric columns
* ``inspect_imb()``: feature imbalance of categorical columns
* ``inspect_num()``: summaries of numeric columns
* ``inspect_cat()``: summaries of categorical columns

InspectDF
================================
class:smaller-75


```r
# Load dplyr for starwars data & pipe
library(dplyr)
# Single dataframe summary
inspect_cat(starwars)
```

```
# A tibble: 8 x 5
  col_name     cnt common    common_pcnt levels           
  <chr>      <int> <chr>           <dbl> <named list>     
1 eye_color     15 brown           24.1  <tibble [15 x 3]>
2 gender         3 masculine       75.9  <tibble [3 x 3]> 
3 hair_color    13 none            42.5  <tibble [13 x 3]>
4 homeworld     49 Naboo           12.6  <tibble [49 x 3]>
5 name          87 Ackbar           1.15 <tibble [87 x 3]>
6 sex            5 male            69.0  <tibble [5 x 3]> 
7 skin_color    31 fair            19.5  <tibble [31 x 3]>
8 species       38 Human           40.2  <tibble [38 x 3]>
```

InspectDF
================================
class:smaller-75


```r
# Paired dataframe comparison
inspect_cat(starwars, starwars[1:20, ])
```

```
# A tibble: 8 x 5
  col_name      jsd     pval lvls_1            lvls_2           
  <chr>       <dbl>    <dbl> <named list>      <named list>     
1 eye_color  0.0936 7.08e- 1 <tibble [15 x 3]> <tibble [8 x 3]> 
2 gender     0.0387 3.38e- 1 <tibble [3 x 3]>  <tibble [2 x 3]> 
3 hair_color 0.261  9.04e- 4 <tibble [13 x 3]> <tibble [10 x 3]>
4 homeworld  0.394  2.21e- 2 <tibble [49 x 3]> <tibble [11 x 3]>
5 name       0.573  9.35e-11 <tibble [87 x 3]> <tibble [20 x 3]>
6 sex        0.0526 5.19e- 1 <tibble [5 x 3]>  <tibble [4 x 3]> 
7 skin_color 0.288  1.58e- 1 <tibble [31 x 3]> <tibble [10 x 3]>
8 species    0.300  7.86e- 2 <tibble [38 x 3]> <tibble [6 x 3]> 
```

InspectDF
================================
class:smaller-65


```r
# Grouped dataframe summary
starwars %>% group_by(species) %>% inspect_cat()
```

```
# A tibble: 266 x 6
# Groups:   species [38]
   species  col_name     cnt common        common_pcnt levels          
   <chr>    <chr>      <int> <chr>               <dbl> <named list>    
 1 Aleena   eye_color      1 unknown               100 <tibble [1 x 3]>
 2 Aleena   gender         1 masculine             100 <tibble [1 x 3]>
 3 Aleena   hair_color     1 none                  100 <tibble [1 x 3]>
 4 Aleena   homeworld      1 Aleen Minor           100 <tibble [1 x 3]>
 5 Aleena   name           1 Ratts Tyerell         100 <tibble [1 x 3]>
 6 Aleena   sex            1 male                  100 <tibble [1 x 3]>
 7 Aleena   skin_color     1 grey, blue            100 <tibble [1 x 3]>
 8 Besalisk eye_color      1 yellow                100 <tibble [1 x 3]>
 9 Besalisk gender         1 masculine             100 <tibble [1 x 3]>
10 Besalisk hair_color     1 none                  100 <tibble [1 x 3]>
# ... with 256 more rows
```





WVPlots: Common Plots for Analysis
==============================
Select data analysis plots, under a standardized calling interface implemented on top of 'ggplot2' and 'plotly'. Plots of interest include: 'ROC', gain curve, scatter plot with marginal distributions, conditioned scatter plot with marginal densities, box and stem with matching theoretical distribution, and density with matching theoretical distribution.




```r
set.seed(34903490)
x = rnorm(50)
y = 0.5*x^2 + 2*x + rnorm(length(x))
frm = data.frame(
  x = x,
  y = y,
  yC = y>=as.numeric(quantile(y,probs=0.8)),
  stringsAsFactors = FALSE)
frm$absY <- abs(frm$y)
frm$posY = frm$y > 0
```

Scatterplot
=============

Scatterplot with smoothing line through points.


```r
WVPlots::ScatterHist(frm, "x", "y", title="Example Fit")
```

<img src="Ghana_R_Users-figure/unnamed-chunk-20-1.png" title="plot of chunk unnamed-chunk-20" alt="plot of chunk unnamed-chunk-20" width="100%" />






Mahalanobis Distance
===============================



* Mahalanobis Distance 
* multivariate distance

How to Calculate Mahalanobis Distance in R
The Mahalanobis distance is the distance between a data point and the origin (mean) in a multivariate space. 
It's often used to identify outliers in multivariate statistical analyses.


Step 1: Create the dataset.
===================================
First, we'll create a dataset that displays the exam score of 20 students along with the number of hours they spent studying, the number of prep exams they took, and their current grade in the course:



```r
#create data
df = data.frame(score = c(91, 93, 72, 87, 86, 73, 68, 87, 78, 99, 95, 76, 84, 96, 76, 80, 83, 84, 73, 74),
        hours = c(16, 6, 3, 1, 2, 3, 2, 5, 2, 5, 2, 3, 4, 3, 3, 3, 4, 3, 4, 4),
        prep = c(3, 4, 0, 3, 4, 0, 1, 2, 1, 2, 3, 3, 3, 2, 2, 2, 3, 3, 2, 2),
        grade = c(70, 88, 80, 83, 88, 84, 78, 94, 90, 93, 89, 82, 95, 94, 81, 93, 93, 90, 89, 89))
```

Step 1: Create the dataset.
===================================


```r
#view first six rows of data
head(df) %>%
  kable(format="markdown")
```



| score| hours| prep| grade|
|-----:|-----:|----:|-----:|
|    91|    16|    3|    70|
|    93|     6|    4|    88|
|    72|     3|    0|    80|
|    87|     1|    3|    83|
|    86|     2|    4|    88|
|    73|     3|    0|    84|


Step 2: Calculate the Mahalanobis distance for each observation.
========================================
Next, we'll use the built-in ``mahalanobis()`` function in R to calculate the Mahalanobis distance for each observation, which uses the following syntax:

<pre><code>
mahalanobis(x, center, cov)
</code></pre>

where:

* x: matrix of data
* center: mean vector of the distribution
* cov: covariance matrix of the distribution

Implementation
===========================
class:smaller-90

The following code shows how to implement this function for our dataset:


```r
#calculate Mahalanobis distance for each observation
mahalanobis(df, colMeans(df), cov(df)) %>% 
  head() %>%
  t()
```

```
         [,1]     [,2]     [,3]     [,4]     [,5]     [,6]
[1,] 16.50196 2.639286 4.850797 5.201261 3.828734 4.090563
```

Step 3: Calculate the p-value for each Mahalanobis distance.
=================================
We can see that some of the Mahalanobis distances are much larger than others. To determine if any of the distances are statistically significant, we need to calculate their p-values.

The p-value for each distance is calculated as the p-value that corresponds to the Chi-Square statistic of the Mahalanobis distance with k-1 degrees of freedom, where k = number of variables. So, in this case we'll use a degrees of freedom of 4-1 = 3.

Step 3: Calculate the p-value for each Mahalanobis distance.
=================================
class:smaller-code

```r
#create new column in data frame to hold Mahalanobis distances
df$mahal <- mahalanobis(df, colMeans(df), cov(df))

#create new column in data frame to hold p-value for each Mahalanobis distance
df$p <- pchisq(df$mahal, df=3, lower.tail=FALSE)
```

Step 3: Calculate the p-value for each Mahalanobis distance.
=================================
class:smaller-code

```r
#view data frame
df %>%
  head() %>%
  kable(format="markdown")
```



| score| hours| prep| grade|     mahal|         p|
|-----:|-----:|----:|-----:|---------:|---------:|
|    91|    16|    3|    70| 16.501963| 0.0008946|
|    93|     6|    4|    88|  2.639286| 0.4506437|
|    72|     3|    0|    80|  4.850797| 0.1830542|
|    87|     1|    3|    83|  5.201261| 0.1576393|
|    86|     2|    4|    88|  3.828734| 0.2805615|
|    73|     3|    0|    84|  4.090563| 0.2518495|

Intrepretating the output
=====================================
* Typically a p-value that is less than some threshold (e.g. 0.001) is considered to be an outlier. 
* Here the first observation is an outlier in the dataset because it has a p-value less than 0.001.
* Depending on the context of the problem, you may *omit* this observation from the dataset since it's an outlier and could affect the results of the analysis. (Domain knowledge is vital).





Simple Linear Regression
==============================================

* In simple linear regression, we predict values on one variable from the values of a second variable. 


* The variable we are predicting is called the ***dependent variable*** (or response variable) and is referred to as Y. 

* The variable we are basing our predictions on is called the ***independent variable*** (or predictor variable) and is referred to as X.

* Remark: When there is only one predictor variable, the prediction method is called simple regression. Linear regression can have more than one predictor variable, i.e. Multiple Linear Regression.

Simple Linear Regression
==============================================

* Suppose we construct our model using $n$ observed values of the response variable: $\{y_1, y_2, \ldots y_i \ldots y_n$\}.

* For the original data set, there is a predicted value of each case of $Y$ that corresponds to an observed value of $Y$. 

* The difference between an observed value of the dependent variable ($y_i$) and the corresponding predicted value ($\hat{y}$) is called the residual ($e_i$). Each data point from the data set has one residual.

Residuals
==============================================

Simply put, the values of the residuals are derived as follows: 

\[\mbox{Residual = Observed value - Predicted value}\]

\[e_i = y_i - \hat{y_i} \]

* Important theoretical assumption underlying the OLS model: the sum of the residuals should equal to zero. 

\[\sum e_i = 0\]

* An extension of this is that the expected value of the residuals is 0: $\mathrm{E}(e) = 0$.
* Another Important Theoretical Assumption - The residuals are normally distributed. (more on that later)


Residual Plots
===================================
* A residual plot is a graph that shows the residuals on the vertical axis and the independent variable on the horizontal axis. 
* If the points in a residual plot are randomly dispersed around the horizontal axis, a linear regression model is appropriate for the data; otherwise, a non-linear model is more appropriate.

Summary of Important Terms
==============================
Some important terms in model diagnostics, essentially a plan for this talk.

*  ***Residual:*** The difference between the predicted value (based on the regression equation) and the actual, observed value.
*  ***Outlier:***  In linear regression, an outlier is an observation with large residual.  In other words, it is an observation whose dependent-variable value is unusual given its value on the predictor variables.  An outlier may indicate a sample peculiarity or may indicate a data entry error or other problem. 

Summary of Important Terms
==============================
*  ***Leverage:***  An observation with an extreme value on a predictor variable is a point with high leverage.  Leverage is a measure of how far an independent variable deviates from its mean.  High leverage points can have a great amount of effect on the estimate of regression coefficients. 
*  ***Influence:***  An observation is said to be influential if removing the observation substantially changes the estimate of the regression coefficients.  Influence can be thought of as the product of leverage and outlierness.  

Summary of Important Terms
==============================
*  ***Cook's distance (or Cook's D):*** A measure that combines the information of leverage and residual of the observation.  

MultiCollinearity
==============================
* An important aspect in model diagnostics is checking for multicollinearity. We are not going to cover this in this talk - but rather include in a talk about variable selection procedure.






















```
Warning message:
package 'knitr' was built under R version 4.0.5 


processing file: Ghana_R_Users.Rpres
-- Attaching packages --------------------------------------- tidyverse 1.3.1 --
v ggplot2 3.3.5     v purrr   0.3.4
v tibble  3.1.6     v dplyr   1.0.7
v tidyr   1.1.4     v stringr 1.4.0
v readr   2.1.0     v forcats 0.5.1
-- Conflicts ------------------------------------------ tidyverse_conflicts() --
x dplyr::filter() masks stats::filter()
x dplyr::lag()    masks stats::lag()
Loading required package: wrapr

Attaching package: 'wrapr'

The following object is masked from 'package:dplyr':

    coalesce

The following objects are masked from 'package:tidyr':

    pack, unpack

The following object is masked from 'package:tibble':

    view


Attaching package: 'MASS'

The following object is masked from 'package:dplyr':

    select

Loading required package: carData

Attaching package: 'car'

The following object is masked from 'package:wrapr':

    bc

The following object is masked from 'package:dplyr':

    recode

The following object is masked from 'package:purrr':

    some



processing file: ./parts/inspectdf.Rmd


processing file: ./parts/WVplots.Rmd


processing file: ./parts/Mahalanobis_distance.Rmd

Attaching package: 'magrittr'

The following object is masked from 'package:purrr':

    set_names

The following object is masked from 'package:tidyr':

    extract



processing file: ./segments/00-LinearRegression.Rmd


processing file: ./cheeses-linear-models-1.Rmd
Quitting from lines 38-41 (./cheeses-linear-models-1.Rmd) 
Quitting from lines 123-124 (./cheeses-linear-models-1.Rmd) 
Error: 'C:/Users/Kevin/Documents/Ghana_R_Users/Cheeses.csv' does not exist.
In addition: There were 11 warnings (use warnings() to see them)
Execution halted
```
