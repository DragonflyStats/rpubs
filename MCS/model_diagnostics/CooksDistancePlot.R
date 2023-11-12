
library(ggplot2)

CookDPlot <- ggplot(thisCook,aes(x=item, y=CookD)) + 
    geom_point() + 
    geom_linerange(data=thisCook, aes(x=item, ymax=CookD, ymin=0)) + 
    theme_bw() + 
    ggtitle("Cook's Distance Plot", subtitle="Systolic Blood Pressure data: Cook's Distance per item") +
    ylab("Cook's Distance") + 
    xlab("Item") + 
    ylim(c(0.0,0.165)) + 
    geom_hline(yintercept=0.05,col="red",lwd=0.75,lty=2) +theme(
                                              axis.title.y = element_text(colour="grey20",size=14,face="bold"),
                                              axis.text.x = element_text(colour="grey20",size=14,face="bold"),
                                              axis.text.y = element_text(colour="grey20",size=14,face="bold"),  
                                              axis.title.x = element_text(colour="grey20",size=14,face="bold"),
                                              plot.title = element_text(size = 16, face = "bold"),
                                              plot.subtitle = element_text(size = 14, face = "bold")) + 
                                              geom_text(aes(label=ifelse(CookD>0.05,as.character(item),'')),hjust=-0.35,vjust=-0.35,size=5, colour="blue")

ggsave(filename = "CooksDistancePlot.png",CookDPlot,      width = 10, height = 8, dpi = 300, units = "in", device='png')

