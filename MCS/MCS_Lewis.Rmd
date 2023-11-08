library(readr)

Lewis <- read_csv("Lewis.csv")

Lewis %>% summarize(var.M1= var(M1), var.M2 = var(M2)) %>% mutate(VR = var.M1/var.M2)

Deming(Lewis$M1,Lewis$M2,vr=121,boot=TRUE) %>% round(3)

ggplot(data=Lewis,aes(M1,M2)) + geom_point(cex=1.75,colour="black") + 
  #geom_smooth(method="lm",se=FALSE) + 
  geom_abline(col="red",intercept= -79.4785,slope=0.09038,lty=2) + theme_bw()

> Deming(Lewis$M1,Lewis$M2,vr=121,boot=TRUE) %>% round(3)
Lewis$M2  = alpha + beta* Lewis$M1 

               Estimate S.e.(boot)     50%     2.5%   97.5%
Intercept       -79.479     21.647 -77.156 -117.102 -29.550
Slope             0.090      0.003   0.090    0.083   0.096
sigma.Lewis$M1   21.985      7.278  21.159    6.066  32.471
sigma.Lewis$M2  241.833     80.055 232.753   66.727 357.181
