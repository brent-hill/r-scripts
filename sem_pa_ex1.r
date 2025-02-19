# EDUC 885 / PATH ANALYSIS / EXAMPLE 1
# Data file: student_profiles.rda
# - Data frame: profile

# Example highlights:
# - This model has a very good fit, so no model modification (respecification) is needed.
# - Estimating/testing indirect effects is also demonstrated.

# Initial model
model <- '
gpa ~ am + iq
am ~ ses
'
sol <- sem(model, profile)

# - Parameter estimates and significance tests
summary(sol, standardized=TRUE)
parameterEstimates(sol, standardized=TRUE)

# - Global fit
fitMeasures(sol)   # All global test
fitMeasures(sol, c("chisq","df","pvalue"))   # Request specific test statistics
fitMeasures(sol, c("cfi","rmsea","srmr"))

# - Diagnostics for model modification
# - - Modification indices (MI)
modificationIndices(sol)
# - - Covariance residuals
resid(sol, type="standardized")   # Computes SCRs
resid(sol, type="normalized")     # Computes NCRs



# Estimating/testing indirect effects
# - Sobel method
model_ie <- '
gpa ~ B21*am + G22*iq
am ~ G11*ses
ie_gpa.ses := B21*G11
'
sol_ie <- sem(model_ie, profile)
summary(sol_ie, standardized=TRUE)
parameterEstimates(sol_ie, standardized=TRUE)

# - Bootstrapping method
sol_ie_bs <- sem(model_ie, profile, se="bootstrap", bootstrap=1000)
summary(sol_ie_bs, standardized=TRUE)
parameterEstimates(sol_ie_bs, standardized=TRUE)
