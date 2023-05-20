# Robust Regression

require(MASS)

#####################

Fit2.rr = rlm(Taste ~ Acetic + Lactic)

summary(Fit2.rr)

Weights( Fit2.rr )

#####################
