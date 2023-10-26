

```R
library(dplyr)
```

    
    Attaching package: ‘dplyr’
    
    The following objects are masked from ‘package:stats’:
    
        filter, lag
    
    The following objects are masked from ‘package:base’:
    
        intersect, setdiff, setequal, union
    



```R
library(purrr)
library(magrittr)
```

    
    Attaching package: ‘purrr’
    
    The following object is masked from ‘package:magrittr’:
    
        set_names
    



```R
iris %>% group_by(Species) %>%select(1:4) %>% summarize(meanSL=mean(Sepal.Length),meanSW=mean(Sepal.Width),meanPW=mean(Petal.Width),meanPL=mean(Petal.Length))
```

    Adding missing grouping variables: `Species`



<table>
<thead><tr><th>Species</th><th>meanSL</th><th>meanSW</th><th>meanPW</th><th>meanPL</th></tr></thead>
<tbody>
	<tr><td>setosa    </td><td>5.006     </td><td>3.428     </td><td>0.246     </td><td>1.462     </td></tr>
	<tr><td>versicolor</td><td>5.936     </td><td>2.770     </td><td>1.326     </td><td>4.260     </td></tr>
	<tr><td>virginica </td><td>6.588     </td><td>2.974     </td><td>2.026     </td><td>5.552     </td></tr>
</tbody>
</table>




```R

```
