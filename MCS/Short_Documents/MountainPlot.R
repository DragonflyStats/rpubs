
library(mountainplot)

dmice <- data.frame(
  albumen=c(156,282,197,297,116,127,119,29,253,122,349,110,143,64,26,86,122,455,655,14,
            391,46,469,86,174,133,13,499,168,62,127,276,176,146,108,276,50,73,
            82,100,98,150,243,68,228,131,73,18,20,100,72,133,465,40,46,34, 44),
  group=c(rep('normal',20), rep('alloxan', 18), rep('insulin', 19))
)

mountainplot(~albumen, data=dmice, group=group, auto.key=list(columns=3),
             main="Diabetic mice", xlab="Nitrogen-bound bovine serum albumen")

Round <- 1:12
Fotobalk <- c(793.8, 793.1, 792.4, 794, 791.4, 792.4, 791.7, 792.3, 789.6,   794.4, 790.9, 793.5)
Counter <- c(794.6, 793.9, 793.2, 794, 792.2, 793.1, 792.4, 792.8, 790.2,  795, 791.6, 793.8)
Terma <- c(793.2, 793.3, 792.6, 793.8, 791.6, 791.6, 791.6, 792.4, 788.5,  794.7, 791.3, 793.5)

myData <- data.frame(Round, Fotobalk,Counter, Terma)

Grubbs <- data.frame( Round = rep(Round,3))


mountainplot(~Speed, data=Grubbs, lty=c(1,2,3), group=Method, auto.key=list(columns=3),
main="Grubbs's Artillery Data", xlab="Mountain Plot")

library(tidyr)

Grubbs <- myData %>% gather("Method","Speed",Fotobalk:Terma)

mountainplot(~y, data=sbp, group=meth,auto.key=list(columns=3),
             main="Systolic Blood Pressure", xlab="Mountain Plot")

plvol3 <- plvol
plvol3$y[plvol3$meth=="Nadler"] = plvol3$y[plvol3$meth=="Nadler"]-98.5
plvol3$y[plvol3$meth=="Hurley"] = plvol3$y[plvol3$meth=="Hurley"]-89.2

mountainplot(~y, data=plvol, group=meth,auto.key=list(columns=2),
             main="Plasma Volume Data ", xlab="Plasma Volume (%) ")


mountainplot(~y, data=plvol2, group=meth,auto.key=list(columns=2),
             main="Plasma Volume Data (Adjusted for Bias)", xlab="Plasma Volume (%) ")

mountainplot(~y, data=PEFR, group=meth,auto.key=list(columns=2),
             main="Plasma Volume Data (Mean Centred)", xlab="Plasma Volume (%) ") 
vline(x=0)



library(MethComp)
library(dplyr)
library(magrittr)
library(mountainplot)

data(milk)
milk3 <- milk
milk3$y[milk3$meth=="Trig"] = milk3$y[milk3$meth=="Trig"]-mean(milk3$y[milk3$meth=="Trig"])
milk3$y[milk3$meth=="Gerber"] = milk3$y[milk3$meth=="Gerber"]-mean(milk3$y[milk3$meth=="Gerber"])

mountainplot(~y, data=milk3, group=meth,auto.key=list(columns=2),
             main="Milk data", xlab="Trig vs. Gerber ")



Trig <- milk %>% filter(meth=="Trig") %>% pull(y)
Gerber <- milk %>% filter(meth=="Gerber") %>% pull(y)
Diffs <- Trig - Gerber
Trig <- Trig - mean(Trig)

Gerber <- Gerber - mean(Gerber)
Quant <- c(0:50/100,49:0/100)
Trig <- quantile(Trig,0:100/100)
Gerber <- quantile(Gerber,0:100/100)
method <- c(rep("Trig",length(Trig)), rep("Gerber",length(Gerber))) %>% factor()
myMountainPlot <- data.frame(value=c(Trig,Gerber),quant =c(Quant,Quant),method)

ggplot(data=myMountainPlot,aes(x=value,y=quant,col=method)) + geom_step() + theme_bw() + geom_vline(xintercept=0,col="red",lty=2) + geom_hline(yintercept=0)

differences = quantile(Diffs,0:100/100)
Diffs <- data.frame(Diffs)

myKMplot <- data.frame(differences = differences, quantiles = c(0:50/100,49:0/100))

ggplot(data=myKMplot,aes(x=differences,y=quantiles)) + 
  geom_step() + 
  theme_bw() + 
  geom_vline(xintercept=0,col="red",lty=2) + 
  geom_hline(yintercept=0)


p <- ggplot(myKMplot) +
    geom_histogram(aes(x = differences, y = ..density..), bins=15, fill = "grey", color = "black") + 
    geom_density(aes(x = differences))
p

library(tidyverse)
vcf %>% mutate(diff = vcflong - vcfshort) %>% summarize(mean(diff))
sd(diff)
vcf %>% mutate(diff = vcflong - vcfshort) %>% summarize(sd(diff))
vcf %>% mutate(diff = vcflong - vcfshort) %>% summarize(sd(vcflong),sd(vcfshort),sd(diff))


ggplot(data=vcf) +stat_ecdf(data=vcf,aes(x=vcflong,col="red")) + 
stat_ecdf(data=vcf,aes(x=vcfshort,col="blue"))

#### VCF

Method1 <- vcf$vcfshort
Method2 <- vcf$vcflong
Method1 <- Method1 - mean(Method1)
Method2 <- Method2 - mean(Method2)
Quant <- c(0:50/100,49:0/100)
Method1 <- quantile(Method1,0:100/100)
Method2 <- quantile(Method2,0:100/100)
method <- c(rep("Method1",length(Method1)), rep("Method2",length(Method2))) %>% factor()
myMountainPlot <- data.frame(value=c(Method1,Method2),quant =c(Quant,Quant),method)
ggplot(data=myMountainPlot,aes(x=value,y=quant,col=method)) + geom_step(lwd=1.2) + theme_bw() + geom_vline(xintercept=0,col="red",lty=2) + geom_hline(yintercept=0)
