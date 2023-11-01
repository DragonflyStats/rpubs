library(ggplot2)
library(dplyr)
library(readr)
Luiz <- read_csv("https://raw.githubusercontent.com/DragonflyStats/MCS-code/master/ArchiveData/Luiz.csv")

LuizTemp <- cbind(Luiz[1:17,],Luiz[19:35,],Luiz[36:52,])
xtable(LuizTemp)
```



```{r}
Method1 <- luiz$Urography 
Method2 <- luiz$Tomography 
Diff = Method1-Method2 
mean(Diff)
```



```{r}
Method1 <- Method1 - mean(Method1)
Method2 <- Method2 - mean(Method2)
Quant <- c(0:50/100,49:0/100)
Method1 <- quantile(Method1,0:100/100)
Method2 <- quantile(Method2,0:100/100)
method <- c(rep("Method1",length(Method1)), rep("Method2",length(Method2))) %>% factor()
myMountainPlot <- data.frame(value=c(Method1,Method2),quant =c(Quant,Quant),method)
```



```{r}
ggplot(data=myMountainPlot,aes(x=value,y=quant,col=method)) + geom_step() + theme_bw() + geom_vline(xintercept=0,col="red",lty=2) + geom_hline(yintercept=0)
ggplot(data=myMountainPlot,aes(x=value,y=quant,col=method)) + geom_step(lwd=1.2) + theme_bw() + geom_vline(xintercept=0,col="red",lty=2) + geom_hline(yintercept=0)+ scale_color_manual(values=c("#CC6666", "#9999CC"))
```



```{r}
  library(ggplot2)
  library(dplyr)
  library(readr)
  Luiz <- read_csv("https://raw.githubusercontent.com/DragonflyStats/MCS-code/master/ArchiveData/Luiz.csv")
  
  Method1 <- Luiz$Urography 
  Method2 <- Luiz$Tomography
  ```
  
  
  
  ```{r} 
  Dif = Method1-Method2 
  Avg = 0.5*(Method1+Method2)
  BAplotDF = data.frame(Method1,Method2,Avg,Dif)
  mean(Dif)
  ```
  
  
  
  ```{r}  
  ggplot(BAplotDF, aes(x = Avg, y = Dif)) +
    geom_point(alpha = 0.75,size=2) +
    geom_hline(yintercept = mean(BAplotDF$Dif), colour = "#9999CC", lwd=1.25) +
    geom_hline(yintercept = mean(BAplotDF$Dif) - (1.96 * sd(BAplotDF$Dif)), colour = "#CC6666", lwd=1.25, lty=2) +
    geom_hline(yintercept = mean(BAplotDF$Dif) + (1.96 * sd(BAplotDF$Dif)), colour = "#CC6666", lwd=1.25,lty=2) +
    geom_hline(yintercept = 0, colour = "black", lty=3, size = 0.5) +
    ylab("Casewise Differences") +
    xlab("Casewise Averages")  + theme_bw()
  
  ```
  
  
  
  ```{r}
  ggplot(BAplotDF, aes(x = Method1, y = Method2)) +
    geom_point(alpha = 0.75,size=2) +
    geom_abline(intercept=0,slope=1, colour = "#CC6666", lwd=1,lty=3)+
    ylab("Method 2") +
    xlab("Method 1")  + theme_bw()
  
