---
title: "Poisson Regression - Crabs Data Set"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
library(knitr)
library(magrittr)
```

Examples of Zero-Inflated Poisson regression
=============================================

Example 1. School administrators study the attendance behavior of high school juniors at two schools. Predictors of the number of days of absence include gender of the student and standardized test scores in math and language arts.

Example 2. The state wildlife biologists want to model how many fish are being caught by fishermen at a state park. Visitors are asked how long they stayed, how many people were in the group, were there children in the group and how many fish were caught. Some visitors do not fish, but there is no data on whether a person fished or not. Some visitors who did fish did not catch any fish so there are excess zeros in the data because of the people that did not fish.

### import data


```{r}

library(ggplot2)

fishing <- read.csv("https://raw.githubusercontent.com/RWorkshop/workshopdatasets/master/fishing.csv")

```


```{r}
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




```{r}
## histogram with x axis 
ggplot(fishing, aes(count)) + geom_histogram()
```

    `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.





![png](output_5_2.png)



```{r}
## histogram with x axis in log10 scale
ggplot(fishing, aes(count)) + geom_histogram() + scale_x_log10()
```

    `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
    Warning message:
    "Removed 142 rows containing non-finite values (stat_bin)."




![png](output_6_2.png)



```{r}
## Run a Zero-Inflated Poisson Regression Analysis to predict number of fish caught
library(pscl)
newdata1 <- expand.grid(0:3, factor(0:1), 1:4)
colnames(newdata1) <- c("child", "camper", "persons")
newdata1 <- subset(newdata1, subset=(child<=persons))
#head(newdata1)
```


```{r}

## Create a Model
m1 <- zeroinfl(count ~ child + camper | persons, data = fishing)

## Make Predictions
newdata1$phat <- predict(m1, newdata1)

```


```{r}

ggplot(newdata1, aes(x = child, y = phat, colour = factor(persons))) +
  geom_point() +
  geom_line() +
  facet_wrap(~camper) +
  labs(x = "Number of Children", y = "Predicted Fish Caught")
```




![png](output_9_1.png)


### Key
 - People without camper vans on the left ( 0 )
 - People with camper vans on the right (1)
