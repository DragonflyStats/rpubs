library(gridExtra)
library(MethComp)
library(ggplot2)
library(dplyr)
library(readr)

data(plvol)

plvol3 <- plvol
Method1 <- plvol3$y[plvol3$meth=="Nadler"] 
Method2 <- plvol3$y[plvol3$meth=="Hurley"] 
Diff <- abs(Method1-Method2)
EAD = median(Diff)
Quant= numeric()

myseq=seq(0,17.6,by=0.1)
for(i in 1:length(myseq)){
  Quant = c(Quant,mean(Diff>myseq[i]))
  
}

myKMplot = data.frame(Diff=myseq,Quant=Quant)

PlasmaVol = ggplot(data=myKMplot,aes(x=Diff,y=Quant)) + geom_vline(xintercept=EAD,lwd=1.2,lty=2,colour="#9999CC") + 
  geom_step(lwd=1.2,col="red") + theme_bw() + 
  geom_vline(xintercept=0,lwd=1.2) +  geom_hline(yintercept=0,lwd=1.2) + 
  ggtitle("Plasma Volume: Survival-Agreement Plot") + theme(
    axis.title.y = element_text(colour="grey20",size=14,face="bold"),
    axis.text.x = element_text(colour="grey20",size=14,face="bold"),
    axis.text.y = element_text(colour="grey20",size=14,face="bold"),  
    axis.title.x = element_text(colour="grey20",size=14,face="bold"),
    plot.title = element_text(size = 16, face = "bold"),
    plot.subtitle = element_text(size = 14, face = "bold")) + xlab("Absolute difference between measurements") + ylab("Discordance proportion")

ggsave(filename = "PlasmaVol_KMplot.png", PlasmaVol,      width = 12, height = 6, dpi = 300, units = "in", device='png')

