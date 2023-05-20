
## quasipoisson. compare with example(glm)
counts <- c(18,17,15,20,10,20,25,13,12)
outcome <- gl(3,1,9)
treatment <- gl(3,3)
d.AD <- data.frame(treatment, outcome, counts)

d.AD

var(counts)/mean(counts)

glm.pois <- glm(counts ~ outcome + treatment, family = poisson())
summary(glm.pois)

glm.qpois <- glm(counts ~ outcome + treatment, family = quasipoisson())
summary(glm.qpois)

anova(glm.qpois, test = "F")

## for Poisson results use
anova(glm.qpois, dispersion = 1, test = "Chisq")


summary(glm.qpois, dispersion = 1)
