
library(readxl)
library(tidyr)
library(ggplot2)
library(dplyr)

# myData <- read_excel("C:/Users/Obrien_K/Desktop/Grubbs.xlsx")

Round <- 1:12
Fotobalk <- c(793.8, 793.1, 792.4, 794, 791.4, 792.4, 791.7, 792.3, 789.6,   794.4, 790.9, 793.5)
Counter <- c(794.6, 793.9, 793.2, 794, 792.2, 793.1, 792.4, 792.8, 790.2,  795, 791.6, 793.8)
Terma <- c(793.2, 793.3, 792.6, 793.8, 791.6, 791.6, 791.6, 792.4, 788.5,  794.7, 791.3, 793.5)

myData <- data.frame(Round, Fotobalk,Counter, Terma)


#myData <- myData %>% gather("Device","Velocity",Fotobalk:Terma)


myData %>% ggplot( aes(Fotobalk,Counter)) + geom_point(size=2.7) + theme_bw() + geom_abline(intercept=0,slope=1,lty=2)

P2 <- myData %>% ggplot( aes(Fotobalk,Terma)) + geom_point(size=2.7,colour="red") + theme_bw() + geom_abline(intercept=0,slope=1,lty=2) + ggtitle("Identity Plot")

ggsave("C:/Users/Obrien_K/Desktop/IdentityPlot_2.eps")


FvC <- myData %>% dplyr::select(Round:Counter) %>%
  mutate(Average = 0.5*(Fotobalk + Counter),
         Difference = Fotobalk - Counter)


MyMean =mean(FvC$Difference, na.rm = TRUE)
MySD  = sd(FvC$Difference, na.rm = TRUE)
      


p <- ggplot(FvC, aes(Average, Difference)) + 
  geom_point(size=2.2,pch=17,na.rm=TRUE) + 
  ggtitle("Fotobalk vs. Counter: Bland-Altman Plot") + 
  theme_bw() + 
  geom_hline(yintercept=0,color='grey',lty=1,lwd=1) + 
  geom_hline(yintercept=round(MyMean,3),color='red',lty=2,lwd=1) + 
  geom_hline(yintercept=round(MyMean+2*MySD,3),color='blue',lty=3,lwd=1) + 
  geom_hline(yintercept=round(MyMean-2*MySD,3),color='blue',lty=3,lwd=1) +
  geom_point(size=2.2,pch=17,na.rm=TRUE) + 
  xlab("Average of Measurements ([F+C]/2)")+
  ylab("Difference of Measurements (F-C)") + ylim( c(-1.2,0.2))
             
           
