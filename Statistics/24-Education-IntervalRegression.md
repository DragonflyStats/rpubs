
Description of the data

Let’s pursue Example 3 from above. We have a hypothetical data file, intreg_data.dta with 30 observations. The GPA score is represented by two values, the lower interval score (lgpa) and the upper interval score (ugpa). 

The writing test scores, the teacher rating and the type of program (a nominal variable which has three levels) are write, rating and type, respectively. 

Let’s look at the data. It is always a good idea to start with descriptive statistics.


```R
Edudata <- read.csv("https://raw.githubusercontent.com/RWorkshop/workshopdatasets/master/ggplot2/Education.csv")

```


```R

# summary of the variables
summary(Edudata)
               

```


        x          
     Mode:logical  
     NA's:0        



```R
## 
# bivariate plots
ggpairs(Edudata [, -1], lower = list(combo = "box"), upper = list(combo = "blank"))
```


    Error in eval(expr, envir, enclos): could not find function "ggpairs"
    Traceback:




```R
# for the regression surface
f <- function(x, y, type = "vocational") {
    newdat <- data.frame(write = x, rating = y, type = factor(type, levels = levels(dat$type)))
    predict(m, newdata = newdat)
}

# Create X, Y, and Z grids
X <- with(Edudata , seq(from = min(write), to = max(write), length.out = 10))
Y <- with(Edudata , seq(from = min(rating), to = max(rating), length.out = 10))
Z <- outer(X, Y, f)


```


```R
# Create 3d scatter plot and add the regression surface
open3d(windowRect = c(100, 100, 700, 700))
## [1] 1
with(Edudata , plot3d(x = write, y = rating, z = ugpa, xlab = "write", ylab = "rating", 
    zlab = "ugpa", xlim = range(write), ylim = range(rating), zlim = range(ugpa)))
par3d(ignoreExtent = TRUE)


```


```R
# add regression surface for each type of program in a different colour
# with 50 percent transparency (alpha = .5)
surface3d(X, Y, outer(X, Y, f, type = "vocational"), col = "blue", alpha = 0.5)
surface3d(X, Y, outer(X, Y, f, type = "general"), col = "red", alpha = 0.5)
surface3d(X, Y, outer(X, Y, f, type = "academic"), col = "green", alpha = 0.5)

# create an animated movie movie3d(spin3d(axis=c(.5,.5,.5), rpm=5),
# duration=6, dir = 'intreg_fig')
```
