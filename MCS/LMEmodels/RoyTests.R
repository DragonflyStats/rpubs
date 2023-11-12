# Roy's MCS Procedures.

library(nlme)

#------------------------------------------------------#

#Roy's Candidate Models

dat.roy1 = lme(y ~ meth-1, data = dat,
random = list(item=pdSymm(~ meth-1)), weights=varIdent(form=~1|meth),
correlation = corSymm(form=~1 | item/repl), method="ML")

dat.roy2 = lme(y ~ meth-1, data = dat,
random = list(item=pdCompSymm(~ meth-1)), 
correlation = corSymm(form=~1 | item/repl), method="ML")

dat.roy3 = lme(y ~ meth-1, data = dat,
random = list(item=pdSymm(~ meth-1)),weights=varIdent(form=~1|meth), 
correlation = corCompSymm(form=~1 | item/repl), method="ML")

dat.roy4 = lme(y ~ meth-1, data = dat,
random = list(item=pdCompSymm(~ meth-1)), 
correlation = corCompSymm(form=~1 | item/repl), method="ML")

#------------------------------------------------------#

#ANOVAs
test1 = anova(dat.roy1,dat.roy2) # Between-Subject Variabilities
test2 = anova(dat.roy1,dat.roy3) # Within-Subject Variabilities
test3 = anova(dat.roy1,dat.roy4) # Overall Variabilities
