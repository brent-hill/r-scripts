# EDUC 885 / PATH ANALYSIS / EXAMPLE 1
# Data file: student_profiles.rda
# - Data frame: profile

# Model and estimation
model <- '
gpa ~ am + iq
am ~ ses
ses ~~ iq
'
sol <- sem(model, profile)

# Overall results
summary(sol, standardized=TRUE, fit.measures=TRUE, modindices=TRUE)
parameterEstimates(sol, standardized=TRUE)

# Global fit
fitMeasures(sol)   # All global test
fitMeasures(sol, c("chisq","df","pvalue"))   # Request specific test statistics
fitMeasures(sol, c("cfi","rmsea","srmr"))

# Diagnostics for model modification
modindices(sol)
resid(sol, type="standardized")
resid(sol, type="normalized")
