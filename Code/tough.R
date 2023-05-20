

tough = read.csv("tough.csv",header=T)

plot(tough$x,tough$y,pch=18)

plot(tough$x,tough$y,pch=".")
points(tough$x[1:100],tough$y[1:100],pch=18,col="red")
points(tough$x[101:200],tough$y[101:200],pch=18,col="green")

### k-Means Clustering

tough.k = kmeans(tough,2,nstart=25)

### Hierarchical Clustering

tough.hc.comp = hclust(dist(tough[,1:2]))
tough.hc.ward = hclust(dist(tough[,1:2]),method="ward.D")
tough.hc.aver = hclust(dist(tough[,1:2]),method="average")
tough.hc.sing = hclust(dist(tough[,1:2]),method="single")
tough.hc.mcqu = hclust(dist(tough[,1:2]),method="mcquitty")
tough.hc.medi = hclust(dist(tough[,1:2]),method="median")
tough.hc.cent = hclust(dist(tough[,1:2]),method="centroid")

### using "cutree"

tough.hc.comp.2gr = cutree(tough.hc.comp,2)
tough.hc.ward.2gr = cutree(tough.hc.ward,2)
tough.hc.aver.2gr = cutree(tough.hc.aver,2)
tough.hc.sing.2gr = cutree(tough.hc.sing,2)
tough.hc.mcqu.2gr = cutree(tough.hc.mcqu,2)