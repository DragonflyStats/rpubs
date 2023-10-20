summary(m1 <- glm(num_awards ~ prog + math, family="poisson", data=p))
## 
## Call:
## glm(formula = num_awards ~ prog + math, family = "poisson", data = p)
## 
## Deviance Residuals: 
##    Min      1Q  Median      3Q     Max  
## -2.204  -0.844  -0.511   0.256   2.680  
## 
## Coefficients:
##                Estimate Std. Error z value Pr(>|z|)    
## (Intercept)     -5.2471     0.6585   -7.97  1.6e-15 ***
## progAcademic     1.0839     0.3583    3.03   0.0025 ** 
## progVocational   0.3698     0.4411    0.84   0.4018    
## math             0.0702     0.0106    6.62  3.6e-11 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for poisson family taken to be 1)
## 
##     Null deviance: 287.67  on 199  degrees of freedom
## Residual deviance: 189.45  on 196  degrees of freedom
## AIC: 373.5
## 
## Number of Fisher Scoring iterations: 6
Cameron and Trivedi (2009) recommended using robust standard errors for the parameter estimates to control for mild violation of the distribution assumption that the variance equals the mean. We use R package sandwich below to obtain the robust standard errors and calculated the p-values accordingly. Together with the p-values, we have also calculated the 95% confidence interval using the parameter estimates and their robust standard errors.

cov.m1 <- vcovHC(m1, type="HC0")
std.err <- sqrt(diag(cov.m1))
r.est <- cbind(Estimate= coef(m1), "Robust SE" = std.err,
"Pr(>|z|)" = 2 * pnorm(abs(coef(m1)/std.err), lower.tail=FALSE),
LL = coef(m1) - 1.96 * std.err,
UL = coef(m1) + 1.96 * std.err)

r.est
##                Estimate Robust SE  Pr(>|z|)      LL       UL
## (Intercept)    -5.24712   0.64600 4.567e-16 -6.5133 -3.98097
## progAcademic    1.08386   0.32105 7.355e-04  0.4546  1.71311
## progVocational  0.36981   0.40042 3.557e-01 -0.4150  1.15463
## math            0.07015   0.01044 1.784e-11  0.0497  0.09061
Now let’s look at the output of function glm more closely.

The output begins with echoing the function call. The information on deviance residuals is displayed next. Deviance residuals are approximately normally distributed if the model is specified correctly.In our example, it shows a little bit of skeweness since median is not quite zero.
Next come the Poisson regression coefficients for each of the variables along with the standard errors, z-scores, p-values and 95% confidence intervals for the coefficients. The coefficient for math is .07. This means that the expected log count for a one-unit increase in math is .07. The indicator variable progAcademic compares between prog = “Academic” and prog = “General”, the expected log count for prog = “Academic” increases by about 1.1. The indicator variable prog.Vocational is the expected difference in log count ((approx .37)) between prog = “Vocational” and the reference group (prog = “General”).
The information on deviance is also provided. We can use the residual deviance to perform a goodness of fit test for the overall model. The residual deviance is the difference between the deviance of the current model and the maximum deviance of the ideal model where the predicted values are identical to the observed. Therefore, if the residual difference is small enough, the goodness of fit test will not be significant, indicating that the model fits the data. We conclude that the model fits reasonably well because the goodness-of-fit chi-squared test is not statistically significant. If the test had been statistically significant, it would indicate that the data do not fit the model well. In that situation, we may try to determine if there are omitted predictor variables, if our linearity assumption holds and/or if there is an issue of over-dispersion.
with(m1, cbind(res.deviance = deviance, df = df.residual,
  p = pchisq(deviance, df.residual, lower.tail=FALSE)))
##      res.deviance  df      p
## [1,]        189.4 196 0.6182
We can also test the overall effect of prog by comparing the deviance of the full model with the deviance of the model excluding prog. The two degree-of-freedom chi-square test indicates that prog, taken together, is a statistically significant predictor of num_awards.

## update m1 model dropping prog
m2 <- update(m1, . ~ . - prog)
## test model differences with chi square test
anova(m2, m1, test="Chisq")
## Analysis of Deviance Table
## 
## Model 1: num_awards ~ math
## Model 2: num_awards ~ prog + math
##   Resid. Df Resid. Dev Df Deviance Pr(>Chi)    
## 1       198        204                         
## 2       196        189  2     14.6  0.00069 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
Sometimes, we might want to present the regression results as incident rate ratios and their standard errors, together with the confidence interval. To compute the standard error for the incident rate ratios, we will use the Delta method. To this end, we make use the function deltamethod implemented in R package msm.

s <- deltamethod(list(~ exp(x1), ~ exp(x2), ~ exp(x3), ~ exp(x4)), 
                                                coef(m1), cov.m1)

## exponentiate old estimates dropping the p values
rexp.est <- exp(r.est[, -3])
## replace SEs with estimates for exponentiated coefficients
rexp.est[, "Robust SE"] <- s

rexp.est
##                Estimate Robust SE       LL      UL
## (Intercept)    0.005263   0.00340 0.001484 0.01867
## progAcademic   2.956065   0.94904 1.575551 5.54620
## progVocational 1.447458   0.57959 0.660335 3.17284
## math           1.072672   0.01119 1.050955 1.09484
The output above indicates that the incident rate for prog = “Academic” is 2.96 times the incident rate for the reference group (prog = “General”). Likewise, the incident rate for prog = “Vocational” is 1.45 times the incident rate for the reference group holding the other variables at constant. The percent change in the incident rate of num_awards is by 7% for every unit increase in math. For additional information on the various metrics in which the results can be presented, and the interpretation of such, please see Regression Models for Categorical Dependent Variables Using Stata, Second Edition by J. Scott Long and Jeremy Freese (2006).

Sometimes, we might want to look at the expected marginal means. For example, what are the expected counts for each program type holding math score at its overall mean? To answer this question, we can make use of the predict function. First off, we will make a small data set to apply the predict function to it.

(s1 <- data.frame(math = mean(p$math),
  prog = factor(1:3, levels = 1:3, labels = levels(p$prog))))
##    math       prog
## 1 52.65    General
## 2 52.65   Academic
## 3 52.65 Vocational
predict(m1, s1, type="response", se.fit=TRUE)
## $fit
##      1      2      3 
## 0.2114 0.6249 0.3060 
## 
## $se.fit
##       1       2       3 
## 0.07050 0.08628 0.08834 
## 
## $residual.scale
## [1] 1
In the output above, we see that the predicted number of events for level 1 of prog is about .21, holding math at its mean. The predicted number of events for level 2 of prog is higher at .62, and the predicted number of events for level 3 of prog is about .31. The ratios of these predicted counts ((frac{.625}{.211} = 2.96), (frac{.306}{.211} = 1.45)) match what we saw looking at the IRR.

We can also graph the predicted number of events with the commands below. The graph indicates that the most awards are predicted for those in the academic program (prog = 2), especially if the student has a high math score. The lowest number of predicted awards is for those students in the general program (prog = 1). The graph overlays the lines of expected values onto the actual points, although a small amount of random noise was added vertically to lessen overplotting.

## calculate and store predicted values
p$phat <- predict(m1, type="response")

## order by program and then by math
p <- p[with(p, order(prog, math)), ]

## create the plot
ggplot(p, aes(x = math, y = phat, colour = prog)) +
  geom_point(aes(y = num_awards), alpha=.5, position=position_jitter(h=.2)) +
  geom_line(size = 1) +
  labs(x = "Math Score", y = "Expected number of awards")
Line plots of predicted number of awards by program type
