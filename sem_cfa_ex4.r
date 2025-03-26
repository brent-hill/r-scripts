# EDUC 885 / SEM -- CFA / EXAMPLE 4
# Data file: etoh_motives.rda
# - Matrix: COV_etoh.mot (covariance matrix)

# Example notes:
# - Covariance matrix (COV_etoh.mot) used as input data
# - The sample size is N = 250
# - Possible method effect present


# Model 1 -----------------------------------------------------------------

model1 <- '
CopMot =~ cop1 + cop2 + cop3 + cop4
SocMot =~ soc1 + soc2 + soc3 + soc4
EnhMot =~ enh1 + enh2 + enh3 + enh4
'

# Parameter estimates and significance tests
sol1 <- cfa(model1, sample.cov=COV_etoh.mot, sample.nobs=500)
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
# - Modification: Allow for the measurement errors of indicators `enh3` and
#   `enh4` to be correlated.

model2 <- '
CopMot =~ cop1 + cop2 + cop3 + cop4
SocMot =~ soc1 + soc2 + soc3 + soc4
EnhMot =~ enh1 + enh2 + enh3 + enh4
enh3 ~~ enh4
'
