# EDUC 885 / SEM -- CFA / EXAMPLE 2
# Data file: kabc.rda
# - Matrix: COV (from a sample of N = 200)

# Example highlights:
# - Initial model specified with orthogonal factors; poor fit
# - Respecified (model 2) to allow factors to correlate; reasonable fit
# - Possible minor modification to model 2


# Initial Model -----------------------------------------------------------

model1 <- '
Seq =~ hm + nr + wo
Sim =~ gc + tr + sm + ma + ps
Seq ~~ 0*Sim
'

# Parameter estimates and significance tests
sol1 <- cfa(model1, sample.cov=COV, sample.nobs=200)
summary(sol1, standardized=TRUE, rsquare=TRUE)
parameterEstimates(sol1, standardized=TRUE)

# Global fit
fitMeasures(sol1, c("chisq","df","pvalue"))
fitMeasures(sol1, c("RMSEA","CFI","SRMR"))

# Local fit
# - Covariance residuals
residuals(sol1, type="normalized")
residuals(sol1, type="standardized")
residuals(sol1, type="cor")
# - Modification indices
modificationIndices(sol1, minimum.value=10)


# Model 2 -----------------------------------------------------------------
# - Modification: Allow factors to correlate

model2 <- '
Seq =~ hm + nr + wo
Sim =~ gc + tr + sm + ma + ps
Seq ~~ Sim
'


# Model 3 -----------------------------------------------------------------
# Modification: Allow measurement errors for `nr` and `wo` to correlate.
# The necessity of this modification is debatable. If this is the desired
# model, respecify as `model3` (see below) and re-run analysis.

model3 <- '
Seq =~ hm + nr + wo
Sim =~ gc + tr + sm + ma + ps
Seq ~~ Sim
nr ~~ wo
'

# Factor reliability and AVE ----------------------------------------------
# Package: semTools
# note that semTools calculates AVE based on the unstandardized solution,
# not the standardized solution, so the result for AVE below will not match
# those in Kline (2023), which are based on the standardized solution.

library(semTools)
reliability(sol1)
