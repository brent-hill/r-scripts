# EDUC 885 / PATH ANALYSIS / EXAMPLE 2
# Data file: ingram_et_al_2001.rda
# - Matrix: Cov

# Example highlights:
# - The fit of the initial model is not good, so some model modification (respecification) is needed.
# - Input data is a covariance matrix.
# - Data taken from a published journal article (Ingram et al., 2001)
# - Data provided in article as correlation matrix and vector of SDs; this is also an example of how to (1) copy that data into R and (2) convert those into a covariance matrix.

# Initial model
model <- '
behavior ~ intent
intent ~ attitude + subnorm + perbhvcon
'
sol <- sem(model, sample.cov=Cov, sample.nobs=60)   # N=60 (reported in article)

# Parameter estimates and significance tests
summary(sol, standardized=TRUE)
parameterEstimates(sol, standardized=TRUE)

# Global fit
fitMeasures(sol, c("chisq","df","pvalue"))
fitMeasures(sol, c("cfi","tli","rmsea","srmr"))

# Diagnostics for model modification
modificationIndices(sol)                    # Shows all MIs
modificationIndices(sol, minimum.value=5)   # Show only MIs ≥ 5
resid(sol, type="standardized")
resid(sol, type="normalized")


# -----------------------------------------------------
# Modified model
# Add: behavior ~ perbhvcon
model2 <- '
behavior ~ intent + perbhvcon
intent ~ attitude + subnorm + perbhvcon
'
# Run this new model and assess fit.