
## Paired T test
The mean and standard deviation of the sample d values are obtained by use of the basic formulas, except
that d is substituted for X.

The mean difference for a set of differences between paired observations is $\bar{d} = \frac{\sum d_{i}}{n}$.

The deviations formula and the computational formula for the standard deviation of the differences between paired observations are, respectively,

$$
S_{d} = \sqrt{\frac{\sum (d_{i}-\bar{d})^2}{n-1}}\\
S_{d} = \sqrt{\frac{ \sum (d^2)- n(\bar{d}^2)}{n-1}}\\
$$

The standard error of the mean difference between paired
observations is obtained for the standard error of the mean.

### Hypotheses

$$
H_{0}: \mu_{d} = 0\\
H_{1}: \mu_{d} \neq 0\\
$$



```R

UVSA <- c(84.63,84.38,84.08,84.41,83.82,83.55,83.92,83.69,84.06,84.03)
NIRS <- c(83.15,83.72,83.84,84.20,83.92,84.16,84.02,83.60,84.13,84.25)
```


```R

```
