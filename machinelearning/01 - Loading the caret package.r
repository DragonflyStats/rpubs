
system("mkdir -p ~/.R", intern = TRUE)
system("cp ~/library/MakeVars ~/.R/Makevars", intern = TRUE)


T1 <- Sys.time()
install.packages("caret",verbose=TRUE)
library(caret)
cat(Sys.time()-T1)

SAhearts <- read.csv("https://raw.githubusercontent.com/RWorkshop/workshopdatasets/master/SAheart.csv")

dim(SAhearts)


