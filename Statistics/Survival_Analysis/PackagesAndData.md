###The survival, OIsurv, and KMsurv packages

The survival package is used in each example in this document. 
Most data sets used are foundin the KMsurv package, which includes data sets from Klein and Moeschberger’s book5. 
Supplemental functions utilized can be found in OIsurv3. 
These packages may be installed using the
install.packages function:
> install.packages("OIsurv")
Installing OIsurv from CRAN requires a newer version of R, and this installation will automatically
include survival and KMsurv. Loading OIsurv in R also loads all three packages:
> library(OIsurv) # the survival package depends on the splines package
Loading required package: survival
Loading required package: splines
Loading required package: KMsurv

### The aids data set
To view available data sets in the KMsurv package, use library(help=KMsurv). To load a data
set, use the function data():
> data(aids)
> aids
infect induct adult
1 0.00 5.00 1
2 0.25 6.75 1
...
295 7.25 0.25 0
The ellipsis (...) denotes output omitted for brevity in this tutorial. Occasionally the ellipsis will
itself be omitted.
The attach() function is used to make a data frame’s columns available for use as variables.
> attach(aids)
> infect
[1] 0.00 0.25 0.75 0.75 0.75 1.00 1.00 1.00 1.00 1.25 1.25 1.25 1.25 1.50
...
[295] 7.25
Good programming practices include detaching data sets no longer in use. It is common for data
sets to share column (variable) names, so failing to detach a data frame before attaching another
may produce incorrect results without any warnings or errors. While attach() and detach() are
used in this tutorial to simplify notation, students may employ the $ operator to access columns
within a data frame to avoid this danger altogether:
> detach(aids)
> aids$infect
[1] 0.00 0.25 0.75 0.75 0.75 1.00 1.00 1.00 1.00 1.25 1.25 1.25 1.25 1.50
...
[295] 7.25
2
Survival objects:
Surv(time, event), Surv(time, time2, event, type)
Many functions in the survival package apply methods to Surv objects, which are survival-type
objects created using the Surv() function. Here we discuss the construction of right-censored Surv
objects and left-truncated right-censored Surv objects. See reference 6 for descriptions of survival
data types.
For right-censored data, only two arguments are needed in the Surv() function: a vector of times
and a vector indicating which times are observed and censored.
> data(tongue)
> attach(tongue) # the following will not affect computations
The following object(s) are masked from package:stats :
time
> # create a subset for just the first group by using [type==1]
> my.surv.object <- Surv(time[type==1], delta[type==1])
> my.surv.object
[1] 1 3 3 4 10 13 13 16 16 24 26 27 28 30
...
[43] 101+ 104+ 108+ 109+ 120+ 131+ 150+ 231+ 240+ 400+
> detach(tongue)
The plus-signs identify those observations that are right-censored. The first argument in Surv()
should be input as a vector of observed and right-censored times. An indicator vector is used in
the second argument to signify whether the event was observed (1) or not (0). Boolean arguments
may be used in place of 1 and 0 in the indicator vector.
We also consider left-truncated right-censored data. The left-truncation times are entered as the
first argument, a vector of the event and censored times is input into the second argument, and an
indicator vector for right-censoring is input as the third argument.
> data(psych); attach(psych)
> my.surv.object <- Surv(age, age+time, death)
> my.surv.object
[1] (51,52 ] (58,59 ] (55,57 ] (28,50 ] (21,51+] (19,47 ] (25,57 ]
...
[22] (29,63+] (35,65+] (32,67 ] (36,76 ] (32,71+]
> detach(psych)
The left-truncated right-censored observations are described in the Surv help documentation to
be of type "counting".
Note. There are many other types of survival objects that can be created, but they are not
covered in this tutorial. Additionally, some survival functions in R only accept a few types of
survival data.
3
K
