


VRplot <- ggplot(VRdata,aes(x=WSVR,y=BSVR)) + 
  geom_point(cex=2,alpha=0.75) + 
  stat_ellipse(type="norm",col="red") +
  stat_ellipse(level=0.50,lty=2,type="norm",col="red") +
  theme_bw() + 
  xlab("Within-subject Variance Ratios") + 
  ylab("Between-subject Variance Ratios") + 
  geom_hline(yintercept = 1) + 
  geom_hline(yintercept = 1.0512094,lty=2,lwd=1.05,colour="blue") + 
  geom_vline(xintercept = 2.222503,lty=2,lwd=1.05,colour="blue") + 
  geom_point(cex=2,alpha=0.75) +
  geom_text(aes(label=ifelse(MD>3,as.character(ID),'')),hjust=-0.3,vjust=-0.3) + 
  ggtitle("Systolic Blood Pressure: Variance Ratios Plot",subtitle="Leave-item-out case deletion") +theme(
    axis.title.y = element_text(colour="grey20",size=14,face="bold"),
    axis.text.x = element_text(colour="grey20",size=14,face="bold"),
    axis.text.y = element_text(colour="grey20",size=14,face="bold"),  
    axis.title.x = element_text(colour="grey20",size=14,face="bold"),
    plot.title = element_text(colour="grey20",size=16, face = "bold"),
    text=element_text(size=14,face="bold"),
    plot.subtitle = element_text(colour="grey20",size=14, face = "bold"))

ggsave(filename = "VRplot.png", VRplot ,      width = 12, height = 6, dpi = 300, units = "in", device='png')
