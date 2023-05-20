
# Cheeses Data Set : Residuals

Fit2 <-  lm(Taste ~ Acetic + Lactic)

Fit2res <-  resid(Fit2)

plot(Fit2)

# Hit Return after inspecting each screen


plot(Fit2, which=c(1))
plot(Fit2, which=c(2))
plot(Fit2, which=c(3))
plot(Fit2, which=c(4))
plot(Fit2, which=c(5))
plot(Fit2, which=c(6)) 

######################

cooks.distance(Fit2)
# Make it easier to read the output
# specify 6 decimal places only.
round( cooks.distance(Fit2) ,6)
