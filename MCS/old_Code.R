## 1. Load R packages

library(dplyr)
library(tidyr)
library(magrittr)
library(nlme)
library(readr)
library(MethComp)
library(MethComp)
library(lme4)
library(dplyr)
library(magrittr)
library(broom)
library(ggplot2)

data(sbp)
head(sbp)
sbp <- sbp %>% arrange(item)

#######################



########################
ranef(Model2) %>% as.data.frame() %>% group_by(term) %>% summarize(var(condval))

augment(Model2,sbp)

Fixed = 127.4078
Random = -23.9066193
Fixed+Random

#########################

Model3 <- lmer(y~meth -1 + (1|item)+(1|meth) ,data=sbp)

summary(Model3) %>% names()

fixef(Model1)
fixef(Model3)

ranef(Model1)
ranef(Model3)

augment(Model3,sbp)



## 2. Read In the Systolic Blood Pressure Data  Set
#sbp <- read_csv("https://raw.githubusercontent.com/DragonflyStats/MCS_Summer_2019/master/MeasurementComp/sbp.csv")

data(sbp)
# -- Check it
sbp.js <- sbp %>% filter(meth !="R")

## 3. Make Life Easy by Relaxing the Optimizer

ctrl <- lmeControl(opt='optim',maxIter = 500, msMaxIter = 500,
                   tolerance = 1e-5);


## 4. Fit Roy's Model

MethCompModel = lme(y ~ meth-1, data = sbp.js,
                    random = list(item=pdSymm(~ meth-1)),
                    weights=varIdent(form=~1|meth),
                    correlation = corSymm(form=~1 | item/repl),
                    #control=ctrl,
                    method="ML")

summary(MethCompModel)
ranef(MethCompModel) %>% cov()


for(i in 1:nrow(sbp.js)){
sbp.temp <- sbp.js %>% filter(item != i)
MethCompModel = lme(y ~ meth-1, data = sbp.temp,
                    random = list(item=pdSymm(~ meth-1)),
                    weights=varIdent(form=~1|meth),
                    correlation = corSymm(form=~1 | item/repl),
                    #control=ctrl,
                    method="ML")

}
