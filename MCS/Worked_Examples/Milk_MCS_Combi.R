library(ggplot2)
library(dplyr)
library(readr)
library(gridExtra)
library(MethComp)
data(milk)


Method1 <- milk %>% filter(meth=="Trig") %>% pull(y)
Method2 <- milk %>% filter(meth=="Gerber") %>% pull(y)


Dif = Method1-Method2 
Avg = 0.5*(Method1+Method2)
BAplotDF = data.frame(Method1,Method2,Avg,Dif)


MCS_plot_1 <- ggplot(BAplotDF, aes(x = Method1, y = Method2)) +
  geom_point(alpha = 0.75,size=2.5) +
  geom_abline(intercept=0,slope=1, colour = "#CC6666", lwd=1,lty=2)+
  stat_smooth(method="lm",se=FALSE, colour = "blue", lwd=1,lty=3) + 
  ylab("Trig") +
  xlab("Gerber")  + theme_bw() + ggtitle("Milk Data: Identity Plot") +theme(
    axis.title.y = element_text(colour="grey20",size=14,face="bold"),
    axis.text.x = element_text(colour="grey20",size=14,face="bold"),
    axis.text.y = element_text(colour="grey20",size=14,face="bold"),  
    axis.title.x = element_text(colour="grey20",size=14,face="bold"))

MCS_plot_2 <-  ggplot(BAplotDF, aes(x = Avg, y = Dif)) +
  geom_point(alpha = 0.75,size=2) +
  geom_hline(yintercept = mean(BAplotDF$Dif), colour = "#9999CC", lwd=1.25) +
  geom_hline(yintercept = mean(BAplotDF$Dif) - (1.96 * sd(BAplotDF$Dif)), colour = "#CC6666", lwd=1.25, lty=2) +
  geom_hline(yintercept = mean(BAplotDF$Dif) + (1.96 * sd(BAplotDF$Dif)), colour = "#CC6666", lwd=1.25,lty=2) +
  geom_hline(yintercept = 0, colour = "black", lty=3, size = 0.5) +
  ylab("Casewise Differences") +
  xlab("Casewise Averages")  + theme_bw() + theme_bw() + ggtitle("Milk Data: Bland-Altman Plot") +theme(
    axis.title.y = element_text(colour="grey20",size=14,face="bold"),
    axis.text.x = element_text(colour="grey20",size=14,face="bold"),
    axis.text.y = element_text(colour="grey20",size=14,face="bold"),  
    axis.title.x = element_text(colour="grey20",size=14,face="bold"))

Method1 <- milk %>% filter(meth=="Trig") %>% pull(y)
Method2 <- milk %>% filter(meth=="Gerber") %>% pull(y)

Method1 <- Method1 - mean(Method1)
Method2 <- Method2 - mean(Method2)
Quant <- c(0:50/100,49:0/100)
Method1 <- quantile(Method1,0:100/100)
Method2 <- quantile(Method2,0:100/100)
method <- c(rep("Trig",length(Method1)), rep("Gerber",length(Method2))) %>% factor()
myMountainPlot <- data.frame(value=c(Method1,Method2),quant =c(Quant,Quant),Method = method)
MCS_plot_3 <- ggplot(data=myMountainPlot,aes(x=value,y=quant,col=Method)) +   ylab("Folded Quantile") +
  xlab("Mean-centred Measurements")  +
  geom_step(lwd=1.2) + theme_bw() + 
  geom_vline(xintercept=0,col="red",lty=2) + geom_hline(yintercept=0) + 
  ggtitle("Milk Data: Mountain Plot") + labs(fill = "Method") +  theme(legend.position="bottom") +theme(
    axis.title.y = element_text(colour="grey20",size=14,face="bold"),
    axis.text.x = element_text(colour="grey20",size=14,face="bold"),
    axis.text.y = element_text(colour="grey20",size=14,face="bold"),  
    axis.title.x = element_text(colour="grey20",size=14,face="bold"))


Milk_MCS <- grid.arrange( MCS_plot_1, MCS_plot_2,MCS_plot_3, ncol=1)


ggsave(filename = "Milk_MCS_Combi.png", Milk_MCS,      width = 10, height = 14, dpi = 300, units = "in", device='png')
