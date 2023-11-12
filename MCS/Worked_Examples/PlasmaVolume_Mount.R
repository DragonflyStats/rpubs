library(gridExtra)
library(MethComp)
library(ggplot2)
library(dplyr)
library(readr)

data(plvol)

plvol3 <- plvol
  Method1 <- plvol3$y[plvol3$meth=="Nadler"] 
  Method2 <- plvol3$y[plvol3$meth=="Hurley"] 

Method1 <- Method1 - mean(Method1)
Method2 <- Method2 - mean(Method2)
Quant <- c(0:50/100,49:0/100)
Method1 <- quantile(Method1,0:100/100)
Method2 <- quantile(Method2,0:100/100)
method <- c(rep("Method1",length(Method1)), rep("Method2",length(Method2))) %>% factor()
myMountainPlot <- data.frame(value=c(Method1,Method2),quant =c(Quant,Quant),method)
NH_Mount <- ggplot(data=myMountainPlot,aes(x=value,y=quant,col=method)) + 
  geom_step(lwd=1.2) + theme_bw() + 
  geom_vline(xintercept=0,col="red",lty=2) + geom_hline(yintercept=0) + 
  ggtitle("Plasma Volume: Mountain Plot") + labs(fill = "Method")



ggsave(filename = "NH_Mount.png", NH_Mount,      width = 6, height = 4.2, dpi = 300, units = "in", device='png')
