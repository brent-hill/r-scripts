# SEM -- SR Models / Example 4
# Data file: shen_takeuchi_2001.rda
# - Cov. matrix: COV (N=983)

library(lavaan)


# Scratch Pad -------------------------------------------------------------
# Compute the measurement error for the single indicator `depscale`.
# This indicator has a known reliability of α = .70.

(1-.70)*COV["depscale","depscale"]


# Measurement Submodel ----------------------------------------------------

msub1 <- '
Accult =~ accscale + genstat + pctlife
Stress =~ intper + jobrel
Income =~ income
Depres =~ depscale
depscale ~~ 3.06*depscale
'
sol.msub1 <- cfa(msub1, sample.cov=COV, sample.nobs=983)
summary(sol.msub1, standardized=TRUE)
fitMeasures(sol.msub1, c("chisq", "df", "pvalue"))
fitMeasures(sol.msub1, c("cfi", "rmsea", "srmr"))
residuals(sol.msub1, type="normalized")
modificationIndices(sol.msub1, minimum.value=10, sort=TRUE)


# Complete SR Model -------------------------------------------------------

model <- '
# Measurement submodel:
Accult =~ accscale + genstat + pctlife
Stress =~ intper + jobrel
Depres =~ depscale
depscale ~~ 3.06*depscale
# Structural submodel:
Depres ~ Stress + income
Stress ~ Depres + Accult
'
sol <- sem(model, sample.cov=COV, sample.nobs=983)
summary(sol, standardized=TRUE)
fitMeasures(sol, c("chisq", "df", "pvalue"))
fitMeasures(sol, c("cfi", "rmsea", "srmr"))
residuals(sol, type="normalized")
modificationIndices(sol, minimum.value=10, sort=TRUE)
