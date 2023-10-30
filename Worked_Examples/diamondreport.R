library(dplyr)
library(magrittr)
library(ggplot2)

data(diamonds)


diamonds2 <- diamonds %>% filter(color %in% c("D","E","F"))

diamonds.report <- diamonds2 %>% group_by(cut,color)  %>% summarize(mean.depth = mean(depth)) 

p <- ggplot(data=diamonds.report, 
       aes(x = cut,
           y = mean.depth, 
           fill = color)) 

p+ geom_bar(stat="identity",position = "dodge") + 
         scale_fill_brewer(palette = "Greens" , direction = -1) +
         ggtitle("Volume by Species and BAU") + 
         ylab("Total volume (1000s) ") + 
         theme_bw() +
         theme(axis.title.x = element_text(color="black", size=14, face="bold"),
               axis.title.y = element_text(color="black", size=14, face="bold"))
              
 p+ geom_bar(stat="identity",position = "stack") + 
         scale_fill_brewer(palette = "Greens" , direction = -1) +
         ggtitle("Volume by Species and BAU") + 
         ylab("Total volume (1000s) ") + 
         theme_bw() +
         theme(axis.title.x = element_text(color="black", size=14, face="bold"),
               axis.title.y = element_text(color="black", size=14, face="bold"))
       
