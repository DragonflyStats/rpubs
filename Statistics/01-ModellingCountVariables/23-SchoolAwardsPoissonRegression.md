
## Examples of Poisson Regression

***Example 1.*** The number of persons killed by mule or horse kicks in the Prussian army per year. Ladislaus Bortkiewicz collected data from 20 volumes of Preussischen Statistik. These data were collected on 10 corps of the Prussian army in the late 1800s over the course of 20 years.

***Example 2.*** The number of people in line in front of you at the grocery store. Predictors may include the number of items currently offered at a special discounted price and whether a special event (e.g., a holiday, a big sporting event) is three or fewer days away.

***Example 3.*** The number of awards earned by students at one high school. Predictors of the number of awards earned include the type of program in which the student was enrolled (e.g., vocational, general or academic) and the score on their final exam in math.

## Load the Data


```R
Awards <- read.csv("https://raw.githubusercontent.com/RWorkshop/workshopdatasets/master/SchoolAwards.csv")
```

* ``id`` :  Student ID
* ``num_awards`` : Number of Awards won
* ``prog`` : Study Program
* ``math`` :  Mathematics Score
* ``phat`` : Predicted Number of Awards (computed by Poisson Regression, added to data set)


```R
head(Awards)
```


<table>
<thead><tr><th>X</th><th>id</th><th>num_awards</th><th>prog</th><th>math</th><th>phat</th></tr></thead>
<tbody>
	<tr><td>105       </td><td>167       </td><td>0         </td><td>General   </td><td>35        </td><td>0.06131134</td></tr>
	<tr><td> 16       </td><td>134       </td><td>0         </td><td>General   </td><td>39        </td><td>0.08117233</td></tr>
	<tr><td> 48       </td><td>111       </td><td>0         </td><td>General   </td><td>39        </td><td>0.08117233</td></tr>
	<tr><td>  2       </td><td>108       </td><td>0         </td><td>General   </td><td>41        </td><td>0.09339886</td></tr>
	<tr><td> 74       </td><td> 70       </td><td>0         </td><td>General   </td><td>41        </td><td>0.09339886</td></tr>
	<tr><td>  6       </td><td> 51       </td><td>0         </td><td>General   </td><td>42        </td><td>0.10018631</td></tr>
</tbody>
</table>




```R
library(ggplot2)
```


```R
ggplot(data = Awards, aes(num_awards)) +
  geom_histogram(binwidth=.5)
```




![png](output_6_1.png)


### Position Types
* ``identity``
* ``dodge``


```R
ggplot(data = Awards, aes(num_awards,fill=prog)) +
  geom_histogram(binwidth=.5, position="dodge")
```




![png](output_8_1.png)



```R

## create the plot
ggplot(Awards, aes(x = math, y = phat, colour = prog)) +
  geom_point(aes(y = num_awards), alpha=.5, position=position_jitter(h=.2)) +
  geom_line(size = 1) +
  labs(x = "Math Score", y = "Expected number of awards")
```




![png](output_9_1.png)



```R

```
