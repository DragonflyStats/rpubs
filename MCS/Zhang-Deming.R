
ZhangData <- read.csv("//IXFILESVR01/Public/Common/GIS/Central_Resource/KOB_data_warehouse/08_TreeHeightModels/ZhangData.csv")

MF <- ZhangData %>% dplyr::pull("MF")
SV <- ZhangData %>% dplyr::pull("SV")

library(MethComp)

Deming(MF, SV,boot=TRUE)

> Deming(MF, SV,boot=TRUE) %>% round(3)
SV  = alpha + beta* MF 
Estimate S.e.(boot)    50%    2.5% 97.5%
Intercept   -4.122      6.508 -3.389 -16.303 9.020
Slope        1.045      0.078  1.037   0.888 1.191
sigma.MF     5.010      0.690  4.808   3.320 5.937
sigma.SV     5.010      0.690  4.808   3.320 5.937

ggplot(data =ZhangData, aes(x=MF,y=SV)) + 
  geom_point(cex=2) + 
  geom_smooth( method="lm",se= FALSE,linetype=3) + 
  theme_bw() + 
  geom_abline(intercept = -4.121610,slope=1.045132 ,col="red") + 
  xlab("MF") + 
  ylab("SV")

> Deming(MF, SV,boot=TRUE,vr=2) %>% round(3)
SV  = alpha + beta* MF 
Estimate S.e.(boot)    50%    2.5%  97.5%
Intercept   -2.362      6.540 -2.013 -14.274 12.149
Slope        1.025      0.077  1.021   0.862  1.160
sigma.MF     4.115      0.541  3.921   2.772  4.835
sigma.SV     5.819      0.765  5.545   3.920  6.838

https://mjskay.github.io/tidybayes/articles/tidy-brms.html


X= c(47,66,68,69,70,70,73,75,79,81,85,87,87,87,90,100,104,105,112,120,132)	
Y=c(43,70,72,81,60,67,72,72,92,76,85,82,90,96,82,100,94,98,108,131,131)	

myDF <- data.frame(X,Y)

fit1=lm(X~Y)
summary(fit1)

ggplot(myDF,aes(x=X,y=Y)) + geom_point(cex=2, pch =17,col="red") + 
 xlim(c(00,160)) + 
 ylim(c(00,160)) +  
 xlab("Left ventricular stroke volume (SV)") + 
 ylab("Transmitral volumetric flow (MF)") + 
 labs(title= "Comparison of Deming and Linear Regression",
      subtitle = "Zhang et al 1986")  + 
 theme_classic() + 
 geom_abline( intercept = 8.3060,slope = 0.9060,lty=1 ) + 
 geom_abline( intercept = -4.1216, slope = 1.0451,lty=2) + 
 annotate("text", "Deming",c(0,0.8))

###################

plot(X,Y, 
pch =17, 
col="red",
xlim=c(20,160),
ylim=c(20,160), ylab=expression(bold("Left ventricular stroke volume (SV) ")),
xlab=expression(bold("Transmitral volumetric flow (MF) ")),

main=c("Comparison of Deming and Linear Regression"),sub=c("Zhang et al. (1986)"),
)

abline(8.3060,0.9060,lty=1)
abline( -4.1216, 1.0451,lty=2)

temp <- legend("topleft", legend = c("Linear regression ", "Deming regression"),
               text.width = strwidth("Limits of agreement"),
               lty = 1:2, xjust = 1, yjust = 1,
              )

ggsave(device="eps","ZhangDeming_1.eps")

###################

plot(X,Y, 
pch =17, 
col="black",
xlim=c(20,160),
ylim=c(20,160), ylab=expression(bold("Left ventricular stroke volume (SV) ")),
xlab=expression(bold("Transmitral volumetric flow (MF) ")),

main=c("Comparison of Deming and Linear Regression"),sub=c("Zhang et al. (1986)"),
)

abline(8.3060,0.9060,lty=1,col="red")
abline( -4.1216, 1.0451,lty=2,col="blue")

temp <- legend("topleft", legend = c("Linear regression ", "Deming regression"), text.font = 2,
               text.width = strwidth("Limits of agreement  "),
               lty = 1:2,col=c("red","blue"), xjust = 1, yjust = 1,
              )

ggsave(device="eps","ZhangDeming_2.eps")
