

```R
options(digits=4)
```

## Correlation



A correlation coefficient is a number between -1 and 1 which measures the degree to which two variables are linearly related. If there is perfect linear relationship with positive slope between the two variables, we have a correlation coefficient of 1; if there is positive correlation, whenever one variable has a high (low) value, so does the other.

If there is a perfect linear relationship with negative slope between the two variables, we have a correlation coefficient of -1; if there is negative correlation, whenever one variable has a high (low) value, the other has a low (high) value.
A correlation coefficient of 0 means that there is no linear relationship between the variables.

We can determine the Pearson Correlation coefficient in R using the \texttt{cor()} command.
To get a more complete statistical analysis, with formal tests, we can use the command \texttt{cor.test()}
The interpretation of the output from the cor.test()procedure is very similar to procedures we have already encountered. The null hypothesis is that the correlation coefficient is equal to zero. This is equivalent to saying that there is no linear relationship between variables.





*  The strength of the relation is represented in a numeric value known at the ***correlation coefficient***. 
*  This coefficient can take a value between -1 and 1. Additionally there are no units.

$$ -1 \leq r \leq 1$$

*  We can use the following graphic to help us interpret the correlation coefficient.



```R
X <- c( 104.40, 104.14, 104.84,  99.34, 104.13, 100.93, 103.85,  97.16,  96.18, 101.42)
Y <-c(98.39, 106.05, 111.18,  97.65, 104.02,100.18, 106.20, 101.87,  92.49, 101.41)

cor(X,Y)


```


0.717167607118176



```R
\section*{Implementation with R}
The relevant \texttt{R} command to compute the correlation coefficient estimate is simply \texttt{\textbf{cor()}}.

%
%\begin{framed}
%\begin{verbatim}
%cor(immer$Y1,immer$Y2)
%
%cor(iris[,1],iris[,3])
%\end{verbatim}
%\end{framed}


%======================================================== %
%\begin{figure}
%	\centering
%	\includegraphics[width=0.7\linewidth]{Regre1}
%\end{figure}

\begin{itemize}
	\item The strength of the relation is represented in a numeric value known at the \textbf{correlation coefficient}. 
	\item This coefficient can take a value between -1 and 1. Additionally there are no units.
	
	\[ -1 \leq r \leq 1\]
	
	\item We can use the following graphic to help us interpret the correlation coefficient.
\end{itemize}
%\begin{figure}[h!]
%	\centering
%	\includegraphics[width=0.9\linewidth]{pearson-correlation-coefficient-interpretation}
%\end{figure}
{
	
	\begin{framed}
		\begin{verbatim}
		> X
		[1] 104.40 104.14 104.84  99.34 104.13
		[6] 100.93 103.85  97.16  96.18 101.42
		> 
		> Y
		[1]  98.39 106.05 111.18  97.65 104.02
		[6] 100.18 106.20 101.87  92.49 101.41
		> 
		> cor(X,Y)
		[1] 0.7171676
		> 
		
		\end{verbatim}
	\end{framed}
}
\newpage

```


```R
\subsection*{Test for Significant Correlation}
Getting a correlation coefficient is generally only half the story; you will want to know if the relationship is statistically significant. There is a more complex command called \texttt{\textbf{cor.test()}}. This command additionally provides a hypothesis test for the correlation estimate. The null and alternative hypotheses are as follows.

\begin{itemize}
	\item[Ho] : The correlation coefficient for the population of values is zero. \\(i.e. No linear relationship.)
	\item[Ha] : The coefficient is not zero. \\ (i.e. Linear relationship exists.)
\end{itemize}
{
	
	\begin{framed}
		\begin{verbatim}
		> cor.test(X,Y)
		
		Pearson's product-moment correlation
		
		data:  X and Y
		t = 2.9107, df = 8, p-value = 0.01957
		alternative hypothesis: true correlation is not equal to 0
		95 percent confidence interval:
		0.1596151 0.9278331
		sample estimates:
		cor 
		0.7171676 
		
		
		\end{verbatim}
	\end{framed}
}

\begin{itemize}
	\item A confidence interval for the coefficient is provided for in the \texttt{R} output. 
	\item If the interval includes 0 then we fail to reject the null hypothesis.
\end{itemize}

```

### Correlation with Missing Values


*  To compute the correlation coefficient, the command is simply \texttt{cor()}, specifying the name of the variables.
*  Let's compute the correlation coefficients for two numeric variables from the \textbf{\textit{mtcars}} data set : \texttt{hp} and \texttt{wt}.
*  Importantly there are no missing values in the \textbf{\textit{mtcars}} data set.



```R

```



*  Suppose you are trying to compute the correlation
coefficient for a data set where some values are missing - like the \textbf{\textit{airquality}} data set.
*  Running the function would result in an "NA" value.










```R
cor(airquality) # NA as answer
```


<table>
<thead><tr><th></th><th>Ozone</th><th>Solar.R</th><th>Wind</th><th>Temp</th><th>Month</th><th>Day</th></tr></thead>
<tbody>
	<tr><th>Ozone</th><td> 1       </td><td>NA       </td><td>      NA </td><td>     NA  </td><td>       NA</td><td>       NA</td></tr>
	<tr><th>Solar.R</th><td>NA       </td><td> 1       </td><td>      NA </td><td>     NA  </td><td>       NA</td><td>       NA</td></tr>
	<tr><th>Wind</th><td>NA       </td><td>NA       </td><td> 1.00000 </td><td>-0.4580  </td><td>-0.178293</td><td> 0.027181</td></tr>
	<tr><th>Temp</th><td>NA       </td><td>NA       </td><td>-0.45799 </td><td> 1.0000  </td><td> 0.420947</td><td>-0.130593</td></tr>
	<tr><th>Month</th><td>NA       </td><td>NA       </td><td>-0.17829 </td><td> 0.4209  </td><td> 1.000000</td><td>-0.007962</td></tr>
	<tr><th>Day</th><td>NA       </td><td>NA       </td><td> 0.02718 </td><td>-0.1306  </td><td>-0.007962</td><td> 1.000000</td></tr>
</tbody>
</table>




```R
cor(airquality,use = "complete.obs") 

```


<table>
<thead><tr><th></th><th>Ozone</th><th>Solar.R</th><th>Wind</th><th>Temp</th><th>Month</th><th>Day</th></tr></thead>
<tbody>
	<tr><th>Ozone</th><td> 1.00000 </td><td> 0.34834 </td><td>-0.61250 </td><td> 0.69854 </td><td> 0.142885</td><td>-0.005190</td></tr>
	<tr><th>Solar.R</th><td> 0.34834 </td><td> 1.00000 </td><td>-0.12718 </td><td> 0.29409 </td><td>-0.074067</td><td>-0.057754</td></tr>
	<tr><th>Wind</th><td>-0.61250 </td><td>-0.12718 </td><td> 1.00000 </td><td>-0.49719 </td><td>-0.194496</td><td> 0.049871</td></tr>
	<tr><th>Temp</th><td> 0.69854 </td><td> 0.29409 </td><td>-0.49719 </td><td> 1.00000 </td><td> 0.403972</td><td>-0.096546</td></tr>
	<tr><th>Month</th><td> 0.14289 </td><td>-0.07407 </td><td>-0.19450 </td><td> 0.40397 </td><td> 1.000000</td><td>-0.009001</td></tr>
	<tr><th>Day</th><td>-0.00519 </td><td>-0.05775 </td><td> 0.04987 </td><td>-0.09655 </td><td>-0.009001</td><td> 1.000000</td></tr>
</tbody>
</table>



#### Correlation Test

Assessment of tuna quality: We compare the Hunter L measure of lightness to the averages of consumer panel scores (recoded as integer values from 1 to 6 and averaged over 80 such values) in 9 lots of canned tuna.

*(Hollander &amp; Wolfe (1973), p. 187f.)*


```R
x <- c(44.4, 45.9, 41.9, 53.3, 44.7, 44.1, 50.7, 45.2, 60.1)
y <- c( 2.6,  3.1,  2.5,  5.0,  3.6,  4.0,  5.2,  2.8,  3.8)

```

* Test the hypothesis that the correlation coefficient is not zero.
* Test the hypothesis that the correlation coefficient is positive.
* What is the test statistics in both cases?
* Interpret the p-values.



The alternative hypothesis of interest is there is a correlation between the
Hunter L value and the panel score.


```R
cor.test(x, y , alternative = "two.sided")
```


    
    	Pearson's product-moment correlation
    
    data:  x and y
    t = 1.8411, df = 7, p-value = 0.1082
    alternative hypothesis: true correlation is not equal to 0
    95 percent confidence interval:
     -0.1497426  0.8955795
    sample estimates:
          cor 
    0.5711816 




The alternative hypothesis of interest is that the
Hunter L value is positively associated with the panel score.


```R
cor.test(x, y, alternative = "greater")
```


    
    	Pearson's product-moment correlation
    
    data:  x and y
    t = 1.8411, df = 7, p-value = 0.05409
    alternative hypothesis: true correlation is greater than 0
    95 percent confidence interval:
     -0.02223023  1.00000000
    sample estimates:
          cor 
    0.5711816 




```R
ct2 <- cor.test(x, y, alternative = "greater")

names(ct2)

ct2$p.value

ct2$statistic


```


<ol class="list-inline">
	<li>'statistic'</li>
	<li>'parameter'</li>
	<li>'p.value'</li>
	<li>'estimate'</li>
	<li>'null.value'</li>
	<li>'alternative'</li>
	<li>'method'</li>
	<li>'data.name'</li>
	<li>'conf.int'</li>
</ol>




0.0540865271747469



<strong>t:</strong> 1.84108263811534



```R
%--------------------------------------------------------------------------------------------%

\section{Correlation test}

Assessment of tuna quality: We compare the Hunter L measure of
lightness to the averages of consumer panel scores (recoded as
integer values from 1 to 6 and averaged over 80 such values) in
9 lots of canned tuna.
(Hollander \& Wolfe (1973), p. 187f.)

\begin{verbatim}
x <- c(44.4, 45.9, 41.9, 53.3, 44.7, 44.1, 50.7, 45.2, 60.1)
y <- c( 2.6,  3.1,  2.5,  5.0,  3.6,  4.0,  5.2,  2.8,  3.8)
\end{verbatim}

\begin{itemize}
	
	\item Test the hypothesis that the correlation coefficient is not zero.
	\item Test the hypothesis that the correlation coefficient is positive.
	\item What is the test statistics in both cases?
	\item What is the p-value in both cases?
	\item Interpret the p-values.
\end{itemize}


The alternative hypothesis of interest is there is a correlation between the
Hunter L value and the panel score.

\begin{verbatim}
> cor.test(x, y , alternative = "two.sided")

Pearson's product-moment correlation

data:  x and y
t = 1.8411, df = 7, p-value = 0.1082
alternative hypothesis: true correlation is not equal to 0
95 percent confidence interval:
-0.1497426  0.8955795
sample estimates:
cor
0.5711816

\end{verbatim}


The alternative hypothesis of interest is that the
Hunter L value is positively associated with the panel score.
\begin{verbatim}
> cor.test(x, y, alternative = "greater")

Pearson's product-moment correlation

data:  x and y
t = 1.8411, df = 7, p-value = 0.05409
alternative hypothesis: true correlation is greater than 0
95 percent confidence interval:
-0.02223023  1.00000000
sample estimates:
cor
0.5711816
\end{verbatim}

\begin{verbatim}
> ct2 <- cor.test(x, y, alternative = "greater")
> names(ct2)
[1] "statistic"   "parameter"   "p.value"   "estimate"  "null.value"  "alternative" "method"      "data.name"
[9] "conf.int"
>
> ct2$p.value
[1] 0.05408653
>
> ct2$statistic
t
1.841083
\end{verbatim}
```


```R
C=c(0,2,4,6,8,10,12) 
F=c(2.1,5.0,9.0,12.6,17.3,21.0,24.7)
cor.test(C,F)
```


    
    	Pearson's product-moment correlation
    
    data:  C and F
    t = 47.197, df = 5, p-value = 8.066e-08
    alternative hypothesis: true correlation is not equal to 0
    95 percent confidence interval:
     0.9920730 0.9998421
    sample estimates:
          cor 
    0.9988796 



#### Spearman and Kendall Correlation
* Spearman and Kendall correlations are both ***rank correlations***. 
* To implement Spearman and Kendall correlation, simply specify the type in the ``method=" "`` argument.



```R
cor(G,D)

cor(G,D,method="spearman")

cor(G,D,method="kendall")

```


```R
The interpretation is very similar, but there are no confidence intervals for the estimates.

```

#### Spearman and Kendall Correlation Coefficients

* Non-parametric statistics are statistics that do not require any special assumptions (e.g. Assumption of Normality). 
* The ***Spearman's rank-order*** and ***Kendall Tau*** correlation coefficients are the nonparametric version of the Pearson product-moment correlation. 
* Both methods measure the strength of association between two ***ranked*** (ordinal) variables.
* The coefficients are interpreted the same way as Pearson's Correlation Coefficient.



```R
### Spearman Correlation Coefficient
cor(X,Y, method="spearman")

### Kendall Correlation Coefficient
cor(X,Y, method="kendall")

```


0.624242424242424



0.511111111111111

