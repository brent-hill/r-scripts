# EDUC 885 / PATH ANALYSIS / EXAMPLE 1
# Data file: student_profiles.rda
# - Data frame: profile

# Example highlights:
# - This model has a very good fit, so no model modification
#   (respecification) is needed.
# - Specifying/estimating/testing indirect effects is also demonstrated.

# Basic Path Model --------------------------------------------------------

# Initial model
model <- '
gpa ~ am + iq
am ~ ses
'
sol <- sem(model, profile, fixed.x=FALSE)

# - Parameter estimates and significance tests
summary(sol, standardized=TRUE)
parameterEstimates(sol, standardized=TRUE)

# - Global fit
fitMeasures(sol)                           # All global test
fitMeasures(sol, c("chisq","df","pvalue")) # Request specific global fit tests
fitMeasures(sol, c("cfi","rmsea","srmr"))

# - Diagnostics for model modification
# - - Modification indices (MI)
modificationIndices(sol, sort=0)
# - - Covariance residuals
residuals(sol, type="standardized")   # Computes SCRs
residuals(sol, type="normalized")     # Computes NCRs
residuals(sol, type="cor")            # Computes CorRes


# Model with Indirect Effects ---------------------------------------------
# Specify model and define indirect effects
# Note: This is the same structural model as that given above; the only
# difference here is the use of coefficient labels and defining an indirect
# effect.
model <- '
gpa ~ B21*am + G22*iq
am ~ G11*ses
ie := B21*G11
'
# Estimating/testing indirect effects
# - Sobel method (default)
sol.sobel <- sem(model, profile, fixed.x=FALSE)
summary(sol.sobel, standardized=TRUE)
parameterEstimates(sol.sobel, standardized=TRUE)

# - Bootstrapping method
sol.bs <- sem(model, profile, fixed.x=FALSE, se="bootstrap", bootstrap=1000)
summary(sol.bs, standardized=TRUE)
parameterEstimates(sol.bs, standardized=TRUE)
