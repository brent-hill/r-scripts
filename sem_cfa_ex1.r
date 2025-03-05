# EDUC 885 / SEM -- CFA / EXAMPLE 1
# Data file: kabc.rda
# - Matrix: COV (from a sample of N = 200)

# Example highlights:
# - Two-factor CFA model (n=2) with reasonable fit
# - Possible minor modification

# Initial Model -----------------------------------------------------------
model1 <- '
Seq =~ hm + nr + wo
Sim =~ gc + tr + sm + ma + ps
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


# Modified Model -----------------------------------------------------------
# Modification: Allow measurement errors for `nr` and `wo` to correlate.
# The necessity of this modification is debatable. If this is the desired
# model, respecify as `model2` (see below) and re-run analysis.

model2 <- '
Seq =~ hm + nr + wo
Sim =~ gc + tr + sm + ma + ps
nr ~~ wo
'

# Factor reliability and AVE ----------------------------------------------
# Package: semTools
# note that semTools calculates AVE based on the unstandardized solution,
# not the standardized solution, so the result for AVE below will not match
# those in Kline (2023), which are based on the standardized solution.

library(semTools)
reliability(sol1)
