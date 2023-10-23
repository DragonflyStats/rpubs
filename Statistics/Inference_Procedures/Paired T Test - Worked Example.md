

\subsection{The paired t-test (a)


*  Previously we have seen the paired t-test. It is used to determine whether or
not there is a significant difference between paired measurements. Equivalently whether or not
the case-wise differences are zero.
*  The mean and standard deviation of the case-wise differences are used to determine the test statistic.
*  Under the null hypothesis, the expected value of the case-wise differences is zero (i.e $H_0 : \mu_d = 0$).
*  The test statistic is computed as
$$ TS = \frac{\bar{d} - \mu_d} {\frac{s_d}{\sqrt{n}}}$$





### The Paired t-test (b)

*  The calculation is dependent on the case-wise differences.
*  Here the case-wise differences between paired measurements (e.g. ``before" and ``after").
*  Under the null hypothesis, the mean of case-wise differences is zero.
*  As a quick example, the mean, standard deviation and sample size are presented in the next slide.




```R
* An automobile manufacturer collects mileage data for a sample of $n = 10$ cars in various weight categories
using a standard grade of gasoline with and without a particular additive. 
* Of course, the engines were tuned to the same
specifications before each run, and the same drivers were used for the two gasoline conditions (with the driver in fact being
unaware of which gasoline was being used on a particular run). 
* Given the mileage data on the next slide,  test the hypothesis
that there is no difference between the mean mileage obtained with and without the additive, using the 5 percent level of
significance 


```

---
#### data


car  |  with additive  |  without additive  |  $d_i$  |  $d^2_i$ | 
1 | 36.7 | 36.2 | 0.5 | 0.25 | 
2 | 35.8 | 35.7 | 0.1 | 0.01 | 
3 | 31.9 | 32.3 | -0.4 | 0.16 | 
4 | 29.3 | 29.6 | -0.3 | 0.09 | 
5 | 28.4 | 28.1 | 0.3 | 0.09 | 
6 | 25.7 | 25.8 | -0.1 | 0.01 | 
7 | 24.2 | 23.9 | 0.3 | 0.09 | 
8 | 22.6 | 22.0 | 0.6 | 0.36 | 
9 | 21.9 | 21.5 | 0.4 | 0.16 | 
10 | 20.3 | 20.0 | 0.3 | 0.09 | 


---
### The paired t-test (c)

*  Observed Mean of Case-wise differences $\bar{d}$ = 8.21,
*  Expected Mean of Case-wise differences under $H_0$ : $ \mu_d = 0$,
*  Standard Deviation of Case-wise differences $S_d$ = 7.90,
*  Sample Size $n=14$.



\[ TS = \frac{\bar{d - \mu_d{\frac{s_d{\sqrt{n = \frac{8.21 - 0{\frac{7.90{\sqrt{14 = 3.881 \]


### The paired t-test (e)


*  Procedure is two-tailed, and you can assume a significance level of 5\%.
*  It is also a small sample procedure (n=14, hence df = 13).
*  The Critical value is determined from statistical tables (2.1603).
*  Decision Rule: Reject Null Hypothesis ($|TS|&gt;CV$). Significant difference in measurements before and after.




### The paired t-test (f)
Alternative Approach : using p-values.

*  The p-values are determined from computer code. (We will use a software called \texttt{R. Other types of software inlcude \texttt{SAS and \texttt{SPSS.)
*  The null and alternative are as before.
*  The computer software automatically generates the appropriate test statistic, and hence the corresponding p-value.
*  The user then interprets the p-values. If p-value is small, reject the null hypothesis. If the p-value is large, the appropriate conclusion is a failure to reject $H_0$.
*  The threshold for being considered small is less than $\alpha/k$, (usually 0.0250). (This is a very arbitrary choice of threshold, suitable for some subject areas, not for others)

---





### The paired t-test (g)
Implementing the paired t-test using \texttt{R for the example previously discussed.
<pre><code>
&gt; t.test(Before,After,paired=TRUE)

Paired t-test

data:  Before and After
t = 3.8881, df = 13, p-value = 0.001868
alternative hypothesis: true difference in means is not 0
95 percent confidence interval:
3.650075 12.778496
sample estimates:
mean of the differences
8.214286

</code></pre>

---


### The paired t-test (h)

*  The p-value ($0.001868$) is less than the threshold is less than the threshold $0.0250$.
*  We reject the null hypothesis (mean of case-wise differences being zero, i.e. expect no difference between ``before" and ``after").
*  We conclude that there is a difference between `before' and `after'.
*  That is to say, we can expected a difference between two paired measurements.


---

### The paired t-test (i)

*  We could also consider the confidence interval. We are $95\%$ confident that the expected value of the case-wise difference is at least 3.65.
*  Here the null value (i.e. 0) is not within the range of the confidence limits.
*  Therefore we reject the null hypothesis.


---

<pre><code>
&gt; t.test(Before,After,paired=TRUE)
...
...
95 percent confidence interval:
3.650075 12.778496
...
</code></pre>




### The Decision Rule

Is the Asbolute value of the test statistic greater than the critical value?

*  If the answer is yes then we reject the null hypothesis
*  If the answer is no, the we fail to reject the null hypothesis.



```R

```


```R

```
