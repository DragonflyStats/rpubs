library(magrittr)
library(dplyr)

Round <- 1:12
Fotobalk <- c(793.8, 793.1, 792.4, 794, 791.4, 792.4, 791.7, 792.3, 789.6,   794.4, 790.9, 793.5)
Counter <- c(794.6, 793.9, 793.2, 794, 792.2, 793.1, 792.4, 792.8, 790.2,  795, 791.6, 793.8)
Terma <- c(793.2, 793.3, 792.6, 793.8, 791.6, 791.6, 791.6, 792.4, 788.5,  794.7, 791.3, 793.5)

grubbs <- data.frame(Round, Fotobalk,Counter, Terma)


Method1 <- c(grubbs$Counter,grubbs$Counter) + sample(-30:-10/10,24,replace=T)
Method2 <- c(grubbs$Fotobalk,grubbs$Fotobalk) + sample(-30:-10/10,24,replace=T)

Dif = Method1-Method2 
Avg = 0.5*(Method1+Method2)

Avg = sample(7910:7965/10,24,replace=T)
Dif = sample(-15:3/10,24,replace=T)
BAplotDF = data.frame(Avg,Dif)


BAplotDF3 <- data.frame(  Method1 = c(782,792), Method2 =c(782,792),    Avg  =c(785,792),
                          Dif= c(-1.6,1.95))
BAplotDF2 <- BAplotDF %>% bind_rows(BAplotDF3)


MCS_plot_3 <-  ggplot(BAplotDF2, aes(x = Avg, y = Dif)) +
  geom_point(pch=17,col="black",alpha = 0.75,size=3.2) +
  geom_hline(yintercept = mean(BAplotDF$Dif), lty=2, colour = "#9999CC", lwd=1.25) +
  geom_hline(yintercept = 0, colour = "black",  lwd=0.75) +
  geom_point(pch=17,col="black",alpha = 0.75,size=3.2) +
  ylim(-2.1,2.1) + 
  ylab("Case-wise Differences") +
  xlab("Case-wise Averages")  + theme_bw() + theme_bw() + ggtitle("Detecting Outliers with the Bland-Altman Plot",subtitle = "(Artificial Data)") +theme(
    axis.title.y = element_text(colour="grey20",size=14,face="bold"),
    axis.text.x = element_text(colour="grey20",size=14,face="bold"),
    axis.text.y = element_text(colour="grey20",size=14,face="bold"),  
    axis.title.x = element_text(colour="grey20",size=14,face="bold"),
    plot.title = element_text(size = 16, face = "bold"),
    plot.subtitle = element_text(size = 14, face = "bold")) + 
  geom_point(data=BAplotDF3,aes(x = Avg, y = Dif),pch=1,col="red",alpha = 0.75,size=5.2)

ggsave(filename = "BAoutliers.png", MCS_plot_3,      width = 10, height = 8, dpi = 300, units = "in", device='png')

MCS_plot_3
