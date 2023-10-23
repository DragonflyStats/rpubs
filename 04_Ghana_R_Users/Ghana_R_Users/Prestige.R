

library(car)
reg1 <-lm(prestige ~ education + income + type, data = Prestige)
avPlots(reg1, id.n=2, id.cex=0.7)
# id.n–id most influential observation
# id.cex –font size for id.
# Graphs outcomevspredictor variables holding the rest constant (also called partial-regression plots)
# Help identify the effect(or influence) of an observation on the regression coefficient of the predictor variable

library(car)
reg1 <-lm(prestige ~ education + income + type, data = Prestige)
influenceIndexPlot(reg1, id.n=3)
# Cook's distance measures how much an observation influences the overall model or predicted values
# Studentizidedresiduals are the residuals divided by their estimated standard deviation as a way to standardized
# Bonferronitest to identify outliers
# Hat-points identify influential observations (have a high impact on the predictor variables)
NOTE: If an observation is an outlier and influential (high leverage) then that observation can change the fit of the linear model, it is advisable to remove it. To remove a case(s) type
reg1a <-update(prestige.reg4, subset=rownames(Prestige) != "general.managers")
reg1b <-update(prestige.reg4, subset= !(rownames(Prestige) %in% c("general.managers","medical.technicians")))

library(car)
reg1 <-lm(prestige ~ education + income + type, data = Prestige)
influencePlot(reg1, id.n=3)
# Creates a bubble-plot combining the display of Studentizedresiduals, hat-values, and Cook's distance (represented in the circles).

library(car)
reg1 <-lm(prestige ~ education + income + type, data = Prestige)
qqPlot(reg1)
# Look for the tails, points should be close to the line or within the confidence intervals.
