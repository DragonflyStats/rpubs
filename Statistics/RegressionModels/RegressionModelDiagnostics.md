

```R
#### Diagnosing a Linear Regression
The ease of implementation fosters the impression that linear regression is easy: just use the \texttt{\textbf{lm()}} function. Yet fitting
this is only the beginning.

After a linear regression analysis has been performed. It is good practice to verify the model’s quality
by running diagnostic checks.

The approach we will take is to create diagnostic plots, by plotting the model object. Rather than producing a scatterplot, this method will produce several diagnostic plots:

```


```R

attach(iris)
Fit1 <- lm(Sepal.length ~ Sepal.Width)
plot(Fit1)


```





```R
####Influence Measures
Finally, identify any overly influential observations by using the \texttt{\textbf{influence.measures()}} 
function.
If an observation is considered influential, it will be indicated with an asterisk on the right hand side. Interpretation of the individual statistics, such as \textit{DFFITS} and \textit{DFBETA} are beyond the scope of this course.

```


```R



\begin{framed}
\begin{verbatim}
influence.measures(Fit1)
\end{verbatim} 
\end{framed}

\end{document}
```
