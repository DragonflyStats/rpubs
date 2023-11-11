---
title: "Kaplan Meier Survival Models"
subtitle: Survival Models with R
author: DragonflyStats.github.io
output:
prettydoc::html_pretty:
theme: cayman
highlight: github
---


### Problem 9: Special Pythagorean triplet

A Pythagorean triplet is a set of three natural numbers, $a < b < c$, for which,

\[a2 + b2 = c2\]
For example, $3^2 + 4^2 = 9 + 16 = 25 = 5^2$.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.


---

```{r warning=FALSE, echo=FALSE, include=FALSE}
library(tidyverse)
library(magrittr)
```
<pre><code>
library(tidyverse)

library(magrittr)
</code></pre>

---

### expand.grid()


```{r}

X <- c(1,2,3)
Y <- c("A","B","C")

expand.grid(X,Y)
```


---


### Structure


```{r}
thisDF <- expand.grid(X,Y)
glimpse(thisDF)
```




```{r}
class(thisDF)
```

---

```{r}

A <- c(100:999)
B <- c(100:999)

thisDF <- expand.grid(A,B) %>% set_colnames(c("A","B"))

thisDF <- thisDF %>% mutate(C = sqrt(A^2 + B^2))

head(thisDF)
```


---

```{r}
thisDF <- thisDF %>% filter( C == floor(C) )

thisDF <- thisDF %>% arrange(desc(C))

head(thisDF)
```

