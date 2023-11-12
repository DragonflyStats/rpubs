library(ggplot2)
library(dplyr)
library(readr)
library(MethComp)
data(milk)


Method1 <- milk %>% filter(meth=="Trig") %>% pull(y)
Method2 <- milk %>% filter(meth=="Gerber") %>% pull(y)

Method1 <- Method1 - mean(Method1)
Method2 <- Method2 - mean(Method2)
Quant <- c(0:50/100,49:0/100)
Method1 <- quantile(Method1,0:100/100)
Method2 <- quantile(Method2,0:100/100)
method <- c(rep("Trig",length(Method1)), rep("Gerber",length(Method2))) %>% factor()
myMountainPlot <- data.frame(value=c(Method1,Method2),quant =c(Quant,Quant),Method = method)
Milk_Mount <- ggplot(data=myMountainPlot,aes(x=value,y=quant,col=Method)) + 
  geom_step(lwd=1.2) + theme_bw() + 
  geom_vline(xintercept=0,col="red",lty=2) + geom_hline(yintercept=0) + 
  ggtitle("Milk Data: Mountain Plot") + labs(fill = "Method") +  theme(legend.position="bottom")





ggsave(filename = "Milk_Mount.png", Milk_Mount,      width = 6, height = 4.2, dpi = 300, units = "in", device='png')
