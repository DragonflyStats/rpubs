
female <- c(0,0,0,0,1,1,1,1)

apcalc <-c(0,0,1,1,0,0,1,1)    

admit  <-c(0,1,0,1,0,1,0,1)      

num    <-c(7,1,3,7,5,1,0,6) 

dat <- data.frame(female,apcalc,admit,num)

## expand dataset by repeating each row num times and drop the num
## variable
dat <- dat[rep(1:nrow(dat), dat$num), -4]

## look at various tables

xtabs(~female + apcalc, data = dat)
##       apcalc
## female  0  1
##      0  8 10
##      1  6  6

xtabs(~female + admit, data = dat)
##       admit
## female  0  1
##      0 10  8
##      1  5  7

xtabs(~apcalc + admit, data = dat)
##       admit
## apcalc  0  1
##      0 12  2
##      1  3 13





xtabs(~female + apcalc + admit, data = dat)
## , , admit = 0
## 
##       apcalc
## female 0 1
##      0 7 3
##      1 5 0
## 
## , , admit = 1
## 
##       apcalc
## female 0 1
##      0 1 7
##      1 1 6



x <- xtabs(~admit + interaction(female, apcalc), data = dat)
x  # view cross tabs
##      interaction(female, apcalc)
## admit 0.0 1.0 0.1 1.1
##     0   7   5   3   0
##     1   1   1   7   6
cdat <- cdat <- data.frame(female = rep(0:1, 2), apcalc = rep(0:1, each = 2), 
    admit = x[2, ], ntrials = colSums(x))
cdat  # view collapsed data set
##     female apcalc admit ntrials
## 0.0      0      0     1       8
## 1.0      1      0     1       6
## 0.1      0      1     7      10
## 1.1      1      1     6       6

Now we can estimate the approximate logistic regression using elrm and MCMC sampling. 
We will do 22,000 iterations with a 2,000 burnin for a final chain of 20,000. 
Note that for the combined model of female and apcalc, we use a chain of 5 million. 
This is because for inference, each effect needs at least 1,000, but because the conditional 
joint distribution is degenerate, for the female effect the ratio of useable trials is low, 
meaning that to achieve over 1,000, the total iterations must be extremely high.






## model with female predictor only
m.female <- elrm(formula = admit/ntrials ~ female, interest = ~female, iter = 22000, 
    dataset = cdat, burnIn = 2000)
## summary of model including estimates and CIs
summary(m.female)
## 
## Call:
## [[1]]
## elrm(formula = admit/ntrials ~ female, interest = ~female, iter = 22000, 
##     dataset = cdat, burnIn = 2000)
## 
## 
## Results:
##        estimate p-value p-value_se mc_size
## female    0.522   0.486    0.00428   20000
## 
## 95% Confidence Intervals for Parameters
## 
##        lower upper
## female -1.13  2.31
## trace plot and histogram of sampled values from the sufficient
## statistic
plot(m.female)


Trace plot and histogram of sampled values for female
## model with apcalc predictor only
m.apcalc <- elrm(formula = admit/ntrials ~ apcalc, interest = ~apcalc, iter = 22000, 
    dataset = cdat, burnIn = 2000)
## Progress:   0%  Progress:   5%  Progress:  10%  Progress:  15%  Progress:  20%  Progress:  25%  Progress:  30%  Progress:  35%  Progress:  40%  Progress:  45%  Progress:  50%  Progress:  55%  Progress:  60%  Progress:  65%  Progress:  70%  Progress:  75%  Progress:  80%  Progress:  85%  Progress:  90%  Progress:  95%  Progress: 100%
## summary of model including estimates and CIs
summary(m.apcalc)
## 
## Call:
## [[1]]
## elrm(formula = admit/ntrials ~ apcalc, interest = ~apcalc, iter = 22000, 
##     dataset = cdat, burnIn = 2000)
## 
## 
## Results:
##        estimate p-value p-value_se mc_size
## apcalc     2.86 0.00035    0.00013   20000
## 
## 95% Confidence Intervals for Parameters
## 
##        lower upper
## apcalc  1.08   Inf
## trace plot and histogram of sampled values from the sufficient
## statistic
plot(m.apcalc)
Trace plot and histogram of sampled values for apcalc
## run not automated for time purposes
## results


Trace plot of parameters for female Trace plot of parameters for apcalc

Note that this approximate technique with sufficient burnin and iterations is quite similar with the exact logistic estimates from Stata.

The first part of the output echoes the call used to create the model. The results has three rows, one for the joint distribution, and one for each parameter.
The estimate column has the parameter estimates (joint is NA). The next column gives the p-values. For the joint row, the p-value is that both effects are simultaneously zero. For female and apcalc, it is the p-value for testing that the individual parameter estimate is zero. Next is the Monte Carlo standard errors for the p-value. Finally, mc_size is the length of the Markov chain of sampled values of sufficient statistics used for each parameter estimate. Note that all the length of the chain for the joint test was 5 million, a mere 1,739 for the female parameter. Because each Markov chain needs to be sufficiently long for stable inference, we needed to increase the total chain size to stably estimate female. For apcalc, the chain length is larger than necessary (over 1 million).
below the main results are the confidence intervals for each parameter estimate.
We can also plot each model, to obtain trace plots of the Markov chains.


### Things to consider

* Firth logit may be helpful if you have separation in your data. This can be done in R using the logistf package.
* Exact logistic regression is an alternative to conditional logistic regression if you have stratification, since both condition on the number of positive outcomes within each stratum. The estimates from these two analyses will be different because a conditional logistic conditions only on the intercept term, exact logistic conditions on the sufficient statistics of the other regression parameters as well as the intercept term.

### References
* Zamar, D., McNeney, B., and Graham, J. (2007). elrm: Software Implementing Exact-like Inference for Logistic Regression Models. http://www.jstatsoft.org/v21/i03/paper
* Collett, D. Modeling Binary Data, Second Edition. Boca Raton: Chapman and Hall.
* Cox, D. R. and Snell, E. J. (1989). Analysis of Binary Data, Second Edition. Boca Raton: Chapman and Hall.
* Hirji, K. F. (2005). Exact Analysis of Discrete Data. Boca Raton: Chapman and Hall.

