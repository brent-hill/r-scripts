# EDUC 885 / PATH ANALYSIS / EXAMPLE 2
# Data file: ingram_et_al_2001.rda
# - Matrix: Cov

# Model and estimation
model <- '
behavior ~ intent
intent ~ attitude + subnorm + perbhvcon
'
sol <- sem(model, sample.cov=Cov, sample.nobs=60)   # N=60 reported in article

# Overall results
summary(sol, standardized=TRUE, fit.measures=TRUE, modindices=TRUE)
parameterEstimates(sol, standardized=TRUE)

# Global fit
fitMeasures(sol, c("chisq","df","pvalue"))
fitMeasures(sol, c("cfi","rmsea","srmr"))

# Diagnostics for model modification
modindices(sol)
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