
Testing for Normality
============================================         

### Shapiro-Wilk Test}
The first test we will look at is the Shapiro-Wilk test.
\begin{verbatim}
&gt; shapiro.test(Vec)

        Shapiro-Wilk normality test

data:  Vec
W = 0.9888, p-value = 0.5727
\end{verbatim}
As the p-value is very high, we fail to reject the null hypothesis that the data set ``Vec" is normally distributed.






```R
\section{Normal Probability Plots}

\begin{verbatim}
qqnorm(Vec)  #draws a QQ plot that is used to check for normality.
qqline(Vec)  #adds trend line to QQplot.
\end{verbatim}

\begin{figure}
  % Requires \usepackage{graphicx}
  \includegraphics[scale=0.35]{QQplot.png}\\
  \caption{Normal Probability Plot}\label{QQplot}
\end{figure}
```


```R
Checking Normality

Graphical methods are often used to check that the data being

analysed are normally distributed. Can use
•
Histogram

•
Boxplot

•
Normal probability (Q-Q) plot


Read the le dat.txt into a data frame called data:

data <- read.table("C:/.../das.txt", header=TRUE)

There is only one column of data, y. Can create a summary of y:

```


```R

 

 

Checking Normality

Create a boxplot, histogram and Q-Q plot of y:

 

boxplots

boxplot(data$y, ylab="data values")

```


```R



 

The median line is approximately in the center of the boxplot and the whiskers are approximately the same length. This indicates that

the data are normally distributed. There are no obvious outliers.

 

histograms 

histogram(data$y, xlab="y", main="Histogram of y")

The histogram is approximately symmetric and bell-shaped indicating a normal distribution.

 




 

```


```R
qq plots 


> qqnorm(data$y)

> qqline(data$y, lty=2)

All of the points lie in an approximate straight line along the diagonal of the plot indicating a normal distribution. There are no

obvious outliers.

 

```


```R
Formal tests

A formal test, e.g. the Anderson-Darling test, Kolmogorov-Smirnov test etc. can also be carried out in R.

This requires you to download the 'nortest' package from CRAN.

 

Go to http://cran.r-project.org/ > Packages > nortest.

Click on the nortest_1.0.zip link and click Save. Save the zip file to a suitable location.

The package must be loaded into R by clicking

Packages > Install packages from local zip files and locating nortest.

Once the package has been loaded, we can then use library(nortest) to access the functions.

 

```


```R

The Anderson-Darling test is carried out using:

 

ad.test(data$y)

Anderson-Darling normality test

data: data$y

A = 0.1634, p-value = 0.9421

 

Remember what this test is doing!!

H0 : The data are normally distributed.

H1 : The data are not normally distributed.

Since the p-value is 0.9421 > 0.05 ) not enough evidence to reject H0 ) the data are normally distributed.

 

The Kolmogorov-Smirnov test is carried out using:
```
