library(lme4)
mod1 <- lmer(r1 ~ (1 | site), data = sample_set) #Only random effects
mod2 <- lmer(r1 ~ p1 + (1 | site), data = sample_set) #One fixed effect + 
            # random effects
mod3 <- lmer(r1 ~ p1 + p2 + (1 | site), data = sample_set) #Two fixed effects + 
            # random effects
#To compare models, I am using the anova function and looking at differences in AIC relative to the lowest AIC model:

anova(mod1, mod2, mod3)
#The above is fine for comparing models.

# simple way to interpret goodness of fit measures for each model. 
# Journal papers on R squared for the fixed effects of mixed effects models:

#Cheng, J., Edwards, L. J., Maldonado-Molina, M. M., Komro, K. A., & Muller, K. E. (2010). Real longitudinal data analysis for real people: Building a good enough mixed model. Statistics in Medicine, 29(4), 504-520. doi: 10.1002/sim.3775
#Edwards, L. J., Muller, K. E., Wolfinger, R. D., Qaqish, B. F., & Schabenberger, O. (2008). An R2 statistic for fixed effects in the linear mixed model. Statistics in Medicine, 27(29), 6137-6157. doi: 10.1002/sim.3429

#######################################################################
# http://www.ualberta.ca/~baayen/publications/baayenCUPstats.pdf

# http://stats.stackexchange.com/questions/37944/what-are-easy-to-interpret-goodness-of-fit-measures-for-linear-mixed-effects-mo
