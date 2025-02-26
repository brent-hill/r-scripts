# EDUC 885 / SEM -- PATH ANALYSIS / EXAMPLE 2
# Data file: foobar.rda
# - Matrix: S (covariance matrix)
# - Scalar: N (sample size)

# Example highlights:
# - 

# Initial Model -----------------------------------------------------------

model1 <- '
'
sol1 <- sem(model1, sample.cov=S, sample.nobs=N)

# Parameter estimates and significance tests
summary(sol1, standardized=TRUE)
parameterEstimates(sol, standardized=TRUE)

# Global fit
fitMeasures(sol1, c("chisq","df","pvalue"))
fitMeasures(sol1, c("cfi","tli","rmsea","srmr"))

# Local fit
resid(sol1, type="normalized")
resid(sol1, type="standardized")
resid(sol1, type="cor")
modificationIndices(sol1)                    # Shows all MIs
modificationIndices(sol1, minimum.value=5)   # Show only MIs ≥ 5


# Modified Model ----------------------------------------------------------
# Add: behavior ~ perbhvcon
model2 <- '
'
# Run this new model and assess fit.
sol2 <- sem(model2, sample.cov=S, sample.nobs=N)
