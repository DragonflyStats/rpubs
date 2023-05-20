dim(iris)
iris1=iris[,1:4]
Dists = matrix(dist(iris1),ncol=1)
NVar = ncol(iris1)
Cont=numeric()
for(i in 1:NVar)
   {
   Cont = c(Cont,matrix(dist(iris1[,i]),ncol=1)/Dists)
   }
NVar
length(Cont)
Vars= rep(names(iris1),each=length(Dists))
length(Vars)
Vars=factor(Vars)
ContDF=data.frame(Cont,Vars)
boxplot(Cont~Vars,horizontal=T,data=ContDF)
######################################################
### Scaling on Petal Width
iris2=iris1
iris2$Petal.Width = scale(iris2$Petal.Width)

Dists = matrix(dist(iris2),ncol=1)
NVar = ncol(iris2)
Cont=numeric()
for(i in 1:NVar)
   {
   Cont = c(Cont,matrix(dist(iris2[,i]),ncol=1)/Dists)
   }
NVar
length(Cont)
Vars= rep(names(iris2),each=length(Dists))
length(Vars)
Vars=factor(Vars)
ContDF=data.frame(Cont,Vars)
boxplot(Cont~Vars,horizontal=T,data=ContDF)

####################################################
#Squared Euclidean Distance

Dists = matrix(dist(iris1),ncol=1)^2
NVar = ncol(iris1)
Cont=numeric()
for(i in 1:NVar)
   {
   Cont = c(Cont,matrix(dist(iris1[,i]),ncol=1)^2/Dists)
   }
NVar
length(Cont)
Vars= rep(names(iris1),each=length(Dists))
length(Vars)
Vars=factor(Vars)
ContDF=data.frame(Cont,Vars)
boxplot(Cont~Vars,horizontal=T,data=ContDF)


####################################################
#Squared Euclidean Distance - Wide Format

Dists = matrix(dist(iris1),ncol=1)^2
NVar = ncol(iris1)
Cont=numeric()
for(i in 1:NVar)
   {
   Cont = cbind(Cont,matrix(dist(iris1[,i]),ncol=1)^2/Dists)
   }
NVar
length(Cont)
Vars= rep(names(iris1),each=length(Dists))
length(Vars)
Vars=factor(Vars)
ContDF=data.frame(Cont)




####################################################
#Squared Euclidean Distance - Scaling on Petal Width

iris2=iris1
iris2$Petal.Width = scale(iris2$Petal.Width)

Dists = matrix(dist(iris2)^2,ncol=1)
NVar = ncol(iris2)
Cont=numeric()
for(i in 1:NVar)
   {
   Cont = c(Cont,matrix(dist(iris2[,i])^2,ncol=1)/Dists)
   }
NVar
length(Cont)
Vars= rep(names(iris2),each=length(Dists))
length(Vars)
Vars=factor(Vars)
ContDF=data.frame(Cont,Vars)
boxplot(Cont~Vars,horizontal=T,data=ContDF)

####################################################
#Squared Euclidean Distance - Scaling on All Variables

iris3=scale(iris1)

Dists = matrix(dist(iris3)^2,ncol=1)
NVar = ncol(iris2)
Cont=numeric()
for(i in 1:NVar)
   {
   Cont = c(Cont,matrix(dist(iris3[,i])^2,ncol=1)/Dists)
   }
NVar
length(Cont)
Vars= rep(names(iris1),each=length(Dists))
length(Vars)
Vars=factor(Vars)
ContDF=data.frame(Cont,Vars)
boxplot(Cont~Vars,horizontal=T,data=ContDF)


