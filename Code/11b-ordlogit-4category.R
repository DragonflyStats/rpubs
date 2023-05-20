
set.seed(459)
N     <- 1800
X1    <- rnorm(N, 175, 7)
X2    <- rnorm(N,  30, 8)
Ycont <- 0.5*X1 - 0.3*X2 + 10 + rnorm(N, 0, 6)
Yord  <- cut(Ycont, breaks=quantile(Ycont), include.lowest=TRUE,
             labels=c("--", "-", "+", "++"), ordered=TRUE)
dfOrd <- data.frame(X1, X2, Yord)

set.seed(459)
N     <- 1800
X1    <- rnorm(N, 175, 7)
X2    <- rnorm(N,  30, 8)
Ycont <- 0.5*X1 - 0.3*X2 + 10 + rnorm(N, 0, 6)
Yord  <- cut(Ycont, breaks=quantile(Ycont), include.lowest=TRUE,
             labels=c("--", "-", "+", "++"), ordered=TRUE)
OlogData <- data.frame(X1, X2, Yord)

OlogData.train <- OlogData[1:1000,]
OlogData.test  <- OlogData[1001:1800,]

vglmFit <- vglm(Yord ~ X1 + X2, family=propodds, data=OlogData.train)

predict(vglmFit,OlogData.test)

predict(vglmFit,OlogData.test,type="response") %>% max.col()

Predicted <- predict(vglmFit,OlogData.test,type="response") %>% max.col()
Actual <- OlogData.test[,3]

#############


table(prediction,OlogData.test[,3])


data = data.frame(Actual,Predicted)
names(data) = c("Actual", "Predicted") 
 
#compute frequency of actual categories
actual = as.data.frame(table(data$Actual))
names(actual) = c("Actual","ActualFreq")
 
#build confusion matrix
confusion = as.data.frame(table(data$Actual, data$Predicted))
names(confusion) = c("Actual","Predicted","Freq")
 
#calculate percentage of test cases based on actual frequency
confusion = merge(confusion, actual, by=c("Actual"))
confusion$Percent = confusion$Freq/confusion$ActualFreq*100
 
#render plot
# we use three different layers
# first we draw tiles and fill color based on percentage of test cases

tile <- ggplot() +
geom_tile(aes(x=Actual, y=Predicted,fill=Freq),data=confusion, color="black",size=0.1) +
labs(x="Actual",y="Predicted")

tile = tile + 
geom_text(aes(x=Actual,y=Predicted, label=sprintf("%.1f", Freq)),data=confusion, size=3, colour="black") +
scale_fill_gradient(low="grey",high="red")
 
# lastly we draw diagonal tiles. We use alpha = 0 so as not to hide previous layers but use size=0.3 to highlight border
tile = tile + 
geom_tile(aes(x=Actual,y=Predicted),data=subset(confusion, as.character(Actual)==as.character(Predicted)), color="black",size=0.3, fill="black", alpha=0) 
 
#render
tile

dfOrd.train <- dfOrd[1:1000,]
dfOrd.test  <- dfOrd[1001:1800,]

vglmFit <- vglm(Yord ~ X1 + X2, family=propodds, data=dfOrd.train)

predict(vglmFit,dfOrd.test)

predict(vglmFit,dfOrd.test,type="response") %>% max.col()

Predicted <- predict(vglmFit,dfOrd.test,type="response") %>% max.col()
Actual <- dfOrd.test[,3]

#############


table(prediction,dfOrd.test[,3])


data = data.frame(Actual,Predicted)
names(data) = c("Actual", "Predicted") 
 
#compute frequency of actual categories
actual = as.data.frame(table(data$Actual))
names(actual) = c("Actual","ActualFreq")
 
#build confusion matrix
confusion = as.data.frame(table(data$Actual, data$Predicted))
names(confusion) = c("Actual","Predicted","Freq")
 
#calculate percentage of test cases based on actual frequency
confusion = merge(confusion, actual, by=c("Actual"))
confusion$Percent = confusion$Freq/confusion$ActualFreq*100
 
#render plot
# we use three different layers
# first we draw tiles and fill color based on percentage of test cases

tile <- ggplot() +
geom_tile(aes(x=Actual, y=Predicted,fill=Freq),data=confusion, color="black",size=0.1) +
labs(x="Actual",y="Predicted")

tile = tile + 
geom_text(aes(x=Actual,y=Predicted, label=sprintf("%.1f", Freq)),data=confusion, size=3, colour="black") +
scale_fill_gradient(low="grey",high="red")
 
# lastly we draw diagonal tiles. We use alpha = 0 so as not to hide previous layers but use size=0.3 to highlight border
tile = tile + 
geom_tile(aes(x=Actual,y=Predicted),data=subset(confusion, as.character(Actual)==as.character(Predicted)), color="black",size=0.3, fill="black", alpha=0) 
 
#render
tile
