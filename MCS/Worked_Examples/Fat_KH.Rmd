
#### Code Segment 1 : Load R Packages ####
library(MethComp)
library(nlme)
library(lme4)
library(magrittr)
library(tidyr)
library(broom)
library(dplyr)
#### Code Segment 2 : Prepare FAT data ####
# - Load from MethComp R package
# - Response Variable: Viscous Fat
# - Methods: KL and SL
# - items: 43 items (with IDs between 1 and 46)
# - Replicates : Consistently 3 replicate measurements for both methods of measurement.
data(fat)
fat <- fat %>% rename("item" = Id, "repl" = Rep, "meth" = Obs, "y" = Vic) %>% select(-Sub)
fat <- fat %>% mutate(item = factor(item))
#### Code Segment 3 : Basic Models (nlme) ####
## 3.A. Basic NLME Model 1
# - This model fits an LME model using nlme
# - fixed effect : meth
# - random effect : item 
# - 
# - Not informative w.r.t. MCS
fat.nlme.basic.1 <- lme( y ~ meth , random = (~1|item), data=fat)
fat.nlme.basic.1a <- lme( y ~ meth-1 , random = (~1|item), data=fat)
## 3.B. IMPORANT
# Formula : lme( response~ VarA, random=~1|VarA/VarB)
# The data is structured such that observations of items are nested within groups that are identified by VarB. 
# These groups are further nested within larger groupings identified by VarA. 
## 3.C. Basic NLME Model 2
# - This model fits an LME model using nlme
# - fixed effect : meth
# - random effect : "item" then "method inside item"
# - 
# - More informative than previous model
fat.nlme.basic.2 <- lme( y ~ meth , random = (~1|item/meth), data=fat)
## 3.D. Basic NLME Model 3
# - This model fits an LME model using nlme
# - fixed effect : meth
# - random effect : item inside method
# - 
# - similar to Basic Model 2, but with different nesting structure.
fat.nlme.basic.3 <- lme( y ~ meth , random = (~1|meth/item), data=fat)

#### Code Segment 4 : Basic Models (lme4) ####
# -  Response variables: y
# -  Fixed effect: meth
# -  Random effect : item  and meth respectively 
# - -  model 1 is more intuitive than model 2 for purposes of MCS
# - -  Rationale for including both will become clear when discussing Crossed Random Effects
# -  Direct equivalents to counterparts in Code Segment 3
# -  (Also: Error term as random effect) 
fat.lme4.basic.1 <- (lmer(y ~ meth + (1|item), data = fat) )
fat.lme4.basic.2 <- (lmer(y ~ meth + (1|meth), data = fat) )

#### Code Segment 5 : Nested Models with nlme ####
fat.nlme.nested.1 <- lme(y ~ method - 1, random=list(~1|item, ~1|meth), data=fat)
## This formulation illustrates that lme assumes nesting in the order that grouping factors are listed.

#### Code Segment 6 : Nested Models with lme4 ####
# - IMPORTANT 
# - - For time being, consider "item" as a traditional "factor"
# - - Nested random effects occur when a lower level factor appears only within a particular level of an upper level factor. 
# - - Crossed random effects means that a given factor appears in more than one level of the upper level factor. 
fat.lme4.nested.1 <- (lmer(y ~ meth + (1/item|meth), data = fat))
fat.lme4.nested.2 <- (lmer(y ~ meth + (1/meth|item), data = fat))
fat.lme4.nested.3 <- (lmer(y ~ meth + (meth|item), data = fat))
# - Convergence Issue with 4th nested model. 
# 
# fat.lme4.nested.4 <- (lmer(y ~ meth + (item|meth), data = fat))
#### Code Segment 7 : Models with Crossed Random Effects lme4 ####
fat.lme4.crossed.1 <- (lmer(y ~ meth + (1|item) + (1|meth), data = fat))

#### Code Segment 8 : Models specified with pdMat objects (nlme4) ####
# - For ease of comparison, code that would feature in Roy's models is presented, but commented out.
# - 
# - Assessment of the AICs indicates less effectiveness in explaining data, when compared to basic models, presented previously.
# - 
# - When using nlme, the random effects are specified such that the methods have different variance.
## - pdDiag
# - 
fat.pd.diag.1 = lme(y ~ meth-1, data = fat,
                    random = list(item=pdDiag(~ meth-1)), 
                    #weights=varIdent(form=~1|meth),
                    #correlation = corSymm(form=~1 | item/repl), 
                    method="ML")
## - pdIdent
# - - no covariance between methods, methods are independent.
fat.pd.ident.1 = lme(y ~ meth-1, data = fat,
                     random = list(item=pdIdent(~ meth-1)), 
                     #weights=varIdent(form=~1|meth),
                     #correlation = corSymm(form=~1 | item/repl), 
                     method="ML")
## - pdSymm
# - - captures covariance between methods
fat.pd.symm.1 = lme(y ~ meth-1, data = fat,
                    random = list(item=pdSymm(~ meth-1)), 
                    #weights=varIdent(form=~1|meth),
                    #correlation = corSymm(form=~1 | item/repl), 
                    method="ML")
## - pdCompSymm
# - - captures covariance between methods
fat.pd.cs.1 = lme(y ~ meth-1, data = fat,
                  random = list(item=pdCompSymm(~ meth-1)), 
                  #weights=varIdent(form=~1|meth),
                  #correlation = corSymm(form=~1 | item/repl), 
                  method="ML")

#### Code Segment 9 : Roy's Four Models #### 
# - Reference Model
# - - Used as H1 in each of the subsequent tests
# - - G: Symmetric (unconstrained)
# - - Sigma : Symmetric (unconstrained)
fat.roy.1 = lme(y ~ meth-1, data = fat,
                random = list(item=pdSymm(~ meth-1)), 
                weights=varIdent(form=~1|meth),
                correlation = corSymm(form=~1 | item/repl), 
                method="ML")
# - - Used for Test 1
# - - G: Compound Symmetric (equality constraint)
# - - Sigma : Symmetric (unconstrained)
fat.roy.2 = lme(y ~ meth-1, data = fat,
                random = list(item=pdCompSymm(~ meth-1)), 
                weights=varIdent(form=~1|meth),
                correlation = corSymm(form=~1 | item/repl), 
                method="ML")
# - - Used for Test 2
# - - G: Symmetric (unconstrained)
# - - Sigma: Compound Symmetric (equality constraint)
fat.roy.3 = lme(y ~ meth-1, data = fat,
                random = list(item=pdSymm(~ meth-1)), 
                weights=varIdent(form=~1|meth),
                correlation = corCompSymm(form=~1 | item/repl), 
                method="ML")
# - - Used for Test 3
# - - G:  Compound Symmetric (equality constraint)
# - - Sigma: Compound Symmetric (equality constraint)
fat.roy.4 = lme(y ~ meth-1, data = fat,
                random = list(item=pdCompSymm(~ meth-1)), 
                weights=varIdent(form=~1|meth),
                correlation = corCompSymm(form=~1 | item/repl), 
                method="ML")

#### Code Segment 10 : More Advanced Models ####
# - This model is a variation on the first Roy Model.
fat.nlme.adv.1 <-  lme( 
  y ~ meth-1,  
  data = fat, 
  random = list(item=pdSymm(~ meth-1),repl=pdSymm(~1)), 
  weights=varIdent(form=~1|meth),  
  correlation = corSymm(form=~1 | item/repl),  
  meth="ML") 

