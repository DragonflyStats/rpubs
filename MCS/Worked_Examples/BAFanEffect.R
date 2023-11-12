library(ggplot2)

A <- c(774.5, 779.8, 770.2, 783.3,  784.6, 776.4, 779.1, 789.9, 
       784.6, 776.8, 788.1, 775.1,  773,   780.7, 788.9, 783.7, 
       772.4, 784.3, 785.6, 775,    770.6, 781.1, 777.4, 775.4, 
       776.6, 780,   782.1, 783.5,  783.4, 785,   790.0, 779.8)

D<- c(0.2, 0.2, 0.2, 0.2, 3.2, 1.2, 3.2, 4.2, 
      0.2, 1.2, 3.2, 2.2, 2.2, 3.2, 4.2, 3.2, 
      -0.2, -3.2, -3.4, -2.2, -1.2, -2.6, -1.2, -1.4, 
      -1.2, -3.0, -2.2, -4.2, -2.2, -1.2, -4.2, -2.2)

myFunnelPlot = data.frame(A,D,Differences=c(rep("Positive",16),rep("Negative",16)))

myFunnelPlot1 <- myFunnelPlot %>% filter(Differences=="Positive")
myFunnelPlot2 <- myFunnelPlot %>% filter(Differences=="Negative")

MCS_plot_3 <-ggplot( data = myFunnelPlot,aes(x=A,y=D,colour=Differences)) + 
  geom_point(pch=17,col="black",alpha = 0.75,size=3.2) +
  geom_hline(yintercept = mean(BAplotDF$Dif), lty=2, colour = "#9999CC", lwd=1.25) +
  geom_hline(yintercept = 0, colour = "black",  lwd=0.75) + 
  theme_bw( ) + 
  stat_smooth(data = myFunnelPlot1,aes(x=A,y=D),method="lm",lty=3,se=FALSE,col="red") + 
  stat_smooth(data = myFunnelPlot2,aes(x=A,y=D),method="lm",lty=3,se=FALSE,col="red") + 
  ylab("Case-wise Differences") +
  xlab("Case-wise Averages")  + theme_bw() + 
  ggtitle("Bland-Altman Plot",subtitle = "Lack of Constant Variance") +
  theme(
    axis.title.y = element_text(colour="grey20",size=14,face="bold"),
    axis.text.x = element_text(colour="grey20",size=14,face="bold"),
    axis.text.y = element_text(colour="grey20",size=14,face="bold"),  
    axis.title.x = element_text(colour="grey20",size=14,face="bold"),
    plot.title = element_text(size = 16, face = "bold"),
    plot.subtitle = element_text(size = 14, face = "bold")) 


ggsave(filename = "BAFanEffect.png", MCS_plot_3,      width = 10, height = 8, dpi = 300, units = "in", device='png')
