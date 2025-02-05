# EDUC 885 / MULTIPLE LINEAR REGRESSION / EXAMPLE 1

# Data file: generic_data.rda
# - Data frame: dataset
# - Matrix: S

# Conventional approach (for reference)
results <- lm(y~x1+x2+x3, dataset)
summary(results)
lm.beta(results)   # Requires add-on package 'lm.beta'

# MLR as an SEM
# - Package: 'lavaan'
model <- 'y ~ x1 + x2 + x3'
# Note: For an intercept to be included in the model, it must be explicitly specified.
# 'y ~ 1 + x1 + x2 + x3'

# # Using data frame (dataset)
fit <- sem(model, dataset)
summary(fit, rsquare=TRUE, standardized=TRUE)
parameterEstimates(fit, standardized=TRUE)

# # Using covariance matrix (S)
fit.cov <- sem(model, sample.cov=S, sample.nobs=265)
summary(fit.cov, rsquare=TRUE, standardized=TRUE)
parameterEstimates(fit.cov, standardized=TRUE)
