The tables reveal that 30 students applied for the Engineering program. Of those, 15 were admitted and 15 were denied admission. There were 18 male and 12 female applicants. Sixteen of the applicants had taken AP calculus and 14 had not. Note that all of the females who took AP calculus were admitted, versus only 70% the males.

Analysis methods you might consider
Below is a list of some analysis methods you may have encountered. Some of the methods listed are quite reasonable, while others have either fallen out of favor or have limitations.

Exact logistic regression – This technique is appropriate because the outcome variable is binary, the sample size is small, and some cells are empty.
Regular logistic regression – Due to the small sample size and the presence of cells with no subjects, regular logistic regression is not advisable, and it might not even be estimable.
Two-way contingency tables – with Fisher’s exact test due to small expected values.
(Approximate) Exact logistic regression
Let’s run an (approximate) exact logistic analysis using the elrm command in the elrm package. This is based on MCMC sampling. It requires a collapsed data set with number of trials and number of successes, so we make that first.
