

library(MethComp)
library(tidyr)
library(ggplot2)

data("sbp")

head(sbp)

sbp2 <- sbp

J.val = sbp2 %>% filter(meth=="J") %>% pull(y)
S.val = sbp2 %>% filter(meth=="S") %>% pull(y)
R.val = sbp2 %>% filter(meth=="R") %>% pull(y)

sbp2$y[sbp2$meth=="J"] = sbp2$y[sbp2$meth=="J"]-mean(J.val)
sbp2$y[sbp2$meth=="S"] = sbp2$y[sbp2$meth=="S"]-mean(S.val)
sbp2$y[sbp2$meth=="R"] = sbp2$y[sbp2$meth=="R"]-mean(R.val)


Quant <- c(0:50/100,49:0/100)
Method1 <- quantile(J.med,0:100/100)
Method2 <- quantile(S.med,0:100/100)
Method3 <- quantile(R.med,0:100/100)

method <- c(rep("J",length(Method1)), rep("S",length(Method2)), rep("R",length(Method2))) %>% factor()
myMountainPlot <- data.frame(value=c(Method1,Method2,Method3),quant =c(Quant,Quant,Quant),method)
ggplot(data=myMountainPlot,aes(x=value,y=quant,col=method)) + 
  geom_step(lwd=1.2) + theme_bw() + 
  geom_vline(xintercept=0,col="red",lty=2) + geom_hline(yintercept=0) + 
  ggtitle("Plasma Volume: Mountain Plot") + labs(fill = "Method")


sbp2 <- sbp %>% group_by(item,meth) %>% summarize(y.min= min(y), y.mean = mean(y), y.med = median(y), y.max = max(y) )
sbp2.j <- sbp2 %>% filter(meth=="J") %>% arrange(y.med) %>% bind_cols(rank = 1:nrow(sbp2 %>% filter(meth=="J")))
sbp2.r <- sbp2 %>% filter(meth=="R")  %>% arrange(y.med) %>% bind_cols(rank = 1:nrow(sbp2 %>% filter(meth=="R")))
sbp2.s <- sbp2 %>% filter(meth=="S")  %>% arrange(y.med) %>% bind_cols(rank = 1:nrow(sbp2 %>% filter(meth=="S")))

sbp2.j <- sbp2.j %>% mutate(y.min=y.min-y.mean, y.med=y.med-y.mean, y.max=y.max-y.mean)
sbp2.r <- sbp2.r %>% mutate(y.min=y.min-y.mean, y.med=y.med-y.mean, y.max=y.max-y.mean)

ggplot() + geom_point(data=sbp2.j,aes(x=rank,y=y.min,col="red",alpha=0.25)) + 
           geom_point(data=sbp2.j,aes(x=rank,y=y.med,col="red",alpha=0.25)) + 
           geom_point(data=sbp2.j,aes(x=rank,y=y.max,col="red",alpha=0.25))  + 
  geom_point(data=sbp2.r,aes(x=rank,y=y.min,col="blue",alpha=0.25)) + 
  geom_point(data=sbp2.r,aes(x=rank,y=y.med,col="blue",alpha=0.25)) + 
  geom_point(data=sbp2.r,aes(x=rank,y=y.max,col="blue",alpha=0.25)) + theme_bw()


sbp2 <- sbp %>% group_by(item,meth) %>% summarize(y.min= min(y), y.mean = mean(y), y.med = median(y), y.max = max(y) )
ggplot(data=sbp2,aes(x=y.med,colour=meth)) + stat_ecdf()

