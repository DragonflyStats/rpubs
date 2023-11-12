library(nlme)
library(broom)
library(MethComp)
source("loadFunctions.R")

ox.roy = lme(y ~ meth-1, data = ox,
  random = list(item=pdSymm(~ meth-1)), 
  weights=varIdent(form=~1|meth),
  correlation = corSymm(form=~1 | item/repl), 
  method="ML")

tidy(ox.roy) # conditional Residuals

getLOA(ox.roy)

#######################################