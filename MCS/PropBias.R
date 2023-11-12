

library(MethComp)
data(plvol)
library(dplyr)
library(magrittr)

Method1 <- plvol %>% filter(meth=="Nadler") %>% pull(y)
Method2 <- plvol %>% filter(meth=="Hurley") %>% pull(y)
Diff <- Method1 - Method2

mu1 <- mean(Method1) %>% round(2)
mu2 <- mean(Method2) %>% round(2)
sd1 <- sd(Method1) %>% round(2)
sd2 <- sd(Method2) %>% round(2)
bias <- mean(Diff) %>% round(2)
sd.d <- sd(Diff) %>% round(2)
loa1 <- (bias-1.96*sd.d) %>% round(2)
loa2 <- (bias+1.96*sd.d) %>% round(2)
EAD <- mean(abs(Diff)) %>% round(2)

Line1 <- cbind("Mean",mu1,mu2,bias)
Line2 <- cbind("Standard Deviation",sd1,sd2,sd.d)
Line3 <- cbind("LoAs"," "," ", paste( "(",loa1,",",loa2,")"))
Line4 <- cbind("EAD"," "," ", EAD)
myReport <- data.frame(rbind(Line1,Line2,Line3,Line4))
xtable(myReport)

library(MethComp)
data(milk)
library(dplyr)
library(magrittr)

Method1 <- milk %>% filter(meth=="Trig") %>% pull(y)
Method2 <- milk %>% filter(meth=="Gerber") %>% pull(y)
Diff <- Method1 - Method2

mu1 <- mean(Method1) %>% round(3)
mu2 <- mean(Method2) %>% round(3)
sd1 <- sd(Method1) %>% round(3)
sd2 <- sd(Method2) %>% round(3)
bias <- mean(Diff) %>% round(3)
sd.d <- sd(Diff) %>% round(3)
loa1 <- (bias-1.96*sd.d) %>% round(3)
loa2 <- (bias+1.96*sd.d) %>% round(3)
EAD <- mean(abs(Diff)) %>% round(3)

Line1 <- cbind("Mean",mu1,mu2,bias)
Line2 <- cbind("Standard Deviation",sd1,sd2,sd.d)
Line3 <- cbind("LoAs"," "," ", paste( "(",loa1,",",loa2,")"))
Line4 <- cbind("EAD"," "," ", EAD)
myReport <- data.frame(rbind(Line1,Line2,Line3,Line4))
xtable(myReport)

############



library(VarReg)
data(vcf)

Method1 <- vcf %>% pull(vcflong)
Method2 <- vcf %>% pull(vcfshort)
Diff <- Method1 - Method2

mu1 <- mean(Method1) %>% round(3)
mu2 <- mean(Method2) %>% round(3)
sd1 <- sd(Method1) %>% round(3)
sd2 <- sd(Method2) %>% round(3)
bias <- mean(Diff) %>% round(3)
sd.d <- sd(Diff) %>% round(3)
loa1 <- (bias-1.96*sd.d) %>% round(3)
loa2 <- (bias+1.96*sd.d) %>% round(3)
EAD <- mean(abs(Diff)) %>% round(3)

Line1 <- cbind("Mean",mu1,mu2,bias)
Line2 <- cbind("Standard Deviation",sd1,sd2,sd.d)
Line3 <- cbind("LoAs"," "," ", paste( "(",loa1,",",loa2,")"))
Line4 <- cbind("EAD"," "," ", EAD)
myReport <- data.frame(rbind(Line1,Line2,Line3,Line4))
xtable(myReport)

#############

Kidney <- read_csv("S:/KOB_data_warehouse/AdminData/Oldstuff/Kidney.csv")

Method1 <- Kidney$Urography
Method2 <- Kidney$Tomography
Diff <- Method1 - Method2

mu1 <- mean(Method1) %>% round(3)
mu2 <- mean(Method2) %>% round(3)
sd1 <- sd(Method1) %>% round(3)
sd2 <- sd(Method2) %>% round(3)
bias <- mean(Diff) %>% round(3)
sd.d <- sd(Diff) %>% round(3)
loa1 <- (bias-1.96*sd.d) %>% round(3)
loa2 <- (bias+1.96*sd.d) %>% round(3)
EAD <- mean(abs(Diff)) %>% round(3)

Line1 <- cbind("Mean",mu1,mu2,bias)
Line2 <- cbind("Standard Deviation",sd1,sd2,sd.d)
Line3 <- cbind("LoAs"," "," ", paste( "(",loa1,",",loa2,")"))
Line4 <- cbind("EAD"," "," ", EAD)
myReport <- data.frame(rbind(Line1,Line2,Line3,Line4))
xtable(myReport)


#############

library(MethComp)

data(sbp)

J1 <- sbp %>%  filter(meth=="J") %>% filter(repl==1) %>% pull(y)
J2 <- sbp %>%  filter(meth=="J") %>% filter(repl==2) %>% pull(y)
J3 <- sbp %>%  filter(meth=="J") %>% filter(repl==3) %>% pull(y)
R1 <- sbp %>%  filter(meth=="R") %>% filter(repl==1) %>% pull(y)
R2 <- sbp %>%  filter(meth=="R") %>% filter(repl==2) %>% pull(y)
R3 <- sbp %>%  filter(meth=="R") %>% filter(repl==3) %>% pull(y)
S1 <- sbp %>%  filter(meth=="S") %>% filter(repl==1) %>% pull(y)
S2 <- sbp %>%  filter(meth=="S") %>% filter(repl==2) %>% pull(y)
S3 <- sbp %>%  filter(meth=="S") %>% filter(repl==3) %>% pull(y)

sbp2 <- data.frame(item  = 1:85,J1,J2,J3,R1,R2,R3,S1,S2,S3)

print(xtable(sbp2), include.rownames=FALSE)

###############

X <- sample(770:790,20,replace=TRUE)
Y <- sample(770:790,20,replace=TRUE)
D <- X-Y
A <- (X+Y)*0.5
myCor <- cor(D,A)

while( myCor > -0.6275){
  X <- sample(770:790,25,replace=TRUE)
  Y <- sample(770:790,25,replace=TRUE)
  D <- X-Y
  A <- (X+Y)*0.5
  myCor <- cor(D,A)
}

X <- c(777L, 776L, 781L, 779L, 774L, 783L, 780L, 779L, 781L, 778L, 776L, 777L, 781L, 776L, 774L, 774L, 777L, 775L, 779L, 774L, 779L, 
773L, 777L, 773L, 775L)

Y <- c(774L, 777L, 774L, 784L, 773L, 785L, 782L, 781L, 787L, 782L, 775L, 771L, 771L, 780L, 772L, 772L, 775L, 790L, 783L, 786L, 788L, 
770L, 784L, 780L, 789L)


  D <- X-Y
  A <- (X+Y)*0.5
 cor(D,A)

myBAdf <- data.frame(X,Y,D,A)



MCS_plot_2 <-  ggplot(myBAdf, aes(x = A, y = D)) +
  geom_point(pch=17,col="black",alpha = 0.75,size=3.2) +
  geom_hline(yintercept = mean(myBAdf$D), colour = "red", lwd=1.25,lty=2) +
  #  geom_hline(yintercept = mean(myBAdf$D) - (1.96 * sd(myBAdf$Dif)), colour = "#9999CC", lwd=0.75, lty=2) +
  #  geom_hline(yintercept = mean(myBAdf$D) + (1.96 * sd(myBAdf$Dif)), colour = "#9999CC", lwd=0.75,lty=2) +
  geom_hline(yintercept = 0, lwd=0.75,colour = "black") +
  geom_point(pch=17,col="black",alpha = 0.75,size=3.2) +
  ylab("Casewise Differences") +
  xlab("Casewise Averages")  + theme_bw() + theme_bw() + ggtitle("Simulated Data: Bland-Altman Plot",subtitle="Indication of Proportional Bias") +theme(
    axis.title.y = element_text(colour="grey20",size=14,face="bold"),
    axis.text.x = element_text(colour="grey20",size=14,face="bold"),
    axis.text.y = element_text(colour="grey20",size=14,face="bold"),  
    axis.title.x = element_text(colour="grey20",size=14,face="bold"),
    plot.title = element_text(colour="grey20",size=16, face = "bold"),
    plot.subtitle = element_text(colour="grey20",size=14, face = "bold"))

MCS_plot_2

ggsave(filename = "PropBias.png", MCS_plot_2 ,      width = 10, height = 6, dpi = 300, units = "in", device='png')
