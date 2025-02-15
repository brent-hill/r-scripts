# EDUC 885 / PATH ANALYSIS / EXAMPLE 2
# Data file: ingram_et_al_2001.rda
# - Matrix: Cov

# Example highlights:
# - Some model modification (respecification) needed
# - Input is covariance matrix
# - Data taken from a published journal article (Ingram et al., 2001)
# - Data provided in article as correlation matrix and vector of SDs; this is also an example of how to (1) copy that data into R and (2) convert those into a covariance matrix.

# Model and estimation
model <- '
behavior ~ intent
intent ~ attitude + subnorm + perbhvcon
'
sol <- sem(model, sample.cov=Cov, sample.nobs=60)   # N=60 (reported in article)

# Overall results
summary(sol, standardized=TRUE, fit.measures=TRUE, modindices=TRUE)
parameterEstimates(sol, standardized=TRUE)

# Global fit
fitMeasures(sol, c("chisq","df","pvalue"))
fitMeasures(sol, c("cfi","tli","rmsea","srmr"))

# Diagnostics for model modification
modindices(sol)                    # Shows all MIs
modindices(sol, minimum.value=5)   # Show only MIs ≥ 5
resid(sol, type="standardized")
resid(sol, type="normalized")


# -----------------------------------------------------
# Modified model
# Add: behavior ~ perbhvcon
model2 <- '
behavior ~ intent + perbhvcon
intent ~ attitude + subnorm + perbhvcon
'
# Run this new model and assess global fit.