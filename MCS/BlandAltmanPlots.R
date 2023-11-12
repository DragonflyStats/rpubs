X <- sample(770:790,20,replace=TRUE)
Y <- sample(770:790,20,replace=TRUE)
D <- X-Y
A <- (X+Y)*0.5
myCor <- cor(D,A)

while( myCor > -0.75){
X <- sample(770:790,20,replace=TRUE)
Y <- sample(770:790,20,replace=TRUE)
D <- X-Y
A <- (X+Y)*0.5
myCor <- cor(D,A)
}


myBAdf <- data.frame(X,Y,D,A)
