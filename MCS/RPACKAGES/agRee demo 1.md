The `agRee` package
========================================================



```r
# install.packages('agRee')
library(agRee)
```

```
## Warning: package 'agRee' was built under R version 3.0.3
```

```
## Loading required package: miscF
```

```
## Warning: package 'miscF' was built under R version 3.0.3
```

```
## Loading required package: MCMCpack
```

```
## Warning: package 'MCMCpack' was built under R version 3.0.3
```

```
## Loading required package: coda
```

```
## Warning: package 'coda' was built under R version 3.0.3
```

```
## Loading required package: lattice
## Loading required package: MASS
## ##
## ## Markov Chain Monte Carlo Package (MCMCpack)
## ## Copyright (C) 2003-2014 Andrew D. Martin, Kevin M. Quinn, and Jong Hee Park
## ##
## ## Support provided by the U.S. National Science Foundation
## ## (Grants SES-0350646 and SES-0350613)
## ##
## Loading required package: mvtnorm
```

```
## Warning: package 'mvtnorm' was built under R version 3.0.3
```

```
## Loading required package: Rcpp
```

```
## Error: package 'RcppArmadillo' required by 'miscF' could not be found
```

```r
set.seed(1234)
X <- rnorm(20, mean = 10, sd = 1.2)
Y <- rnorm(20, mean = 9.8, sd = 1.4)
```


Basic Bland Altman Plot Configuration


```r

DF = data.frame(X, Y)
DF = as.matrix(DF)
agree.plot(DF)
```

```
## Error: could not find function "agree.plot"
```


