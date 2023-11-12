
library(ggplot2)

logLikPlot <- ggplot(thisLogLik,aes(x=item, y=logLik)) + 
    geom_point() + 
    geom_linerange(data=thisLogLik, aes(x=item, ymin=logLik, ymax=0)) + 
    theme_bw() + 
    ggtitle("Log-likelihood Plot", subtitle="Systolic Blood Pressure data: Log-likelihood contributions per item") +
    ylab("Log-likelihood") + 
    xlab("Item") + 
    geom_hline(yintercept=0,col="black",lwd=0.75) +  
    ylim(c(-7.0,0.165)) + 
    geom_hline(yintercept=-5,col="red",lwd=0.75,lty=2) +theme(
                                              axis.title.y = element_text(colour="grey20",size=14,face="bold"),
                                              axis.text.x = element_text(colour="grey20",size=14,face="bold"),
                                              axis.text.y = element_text(colour="grey20",size=14,face="bold"),  
                                              axis.title.x = element_text(colour="grey20",size=14,face="bold"),
                                              plot.title = element_text(size = 16, face = "bold"),
                                              plot.subtitle = element_text(size = 14, face = "bold")) + 
                                              geom_text(aes(label=ifelse(logLik < -5.19,as.character(item),'')),hjust=1.15,vjust=0.65,size=5, colour="blue")

ggsave(filename = "LogLikeihoodPlot.png",logLikPlot,      width = 10, height = 8, dpi = 300, units = "in", device='png')

logLikPlot 


