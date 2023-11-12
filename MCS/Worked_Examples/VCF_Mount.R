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
VCF_Mount <- ggplot(data=myMountainPlot,aes(x=value,y=quant,col=method)) + 
  geom_step(lwd=1.2) + theme_bw() + 
  geom_vline(xintercept=0,col="red",lty=2) + geom_hline(yintercept=0) + 
  ggtitle("VCF: Mountain Plot") + labs(fill = "Method")



ggsave(filename = "VCF_Mount.png", VCF_Mount,      width = 6, height = 4.2, dpi = 300, units = "in", device='png')
