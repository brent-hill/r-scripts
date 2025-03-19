# EDUC 885 / SEM -- PATH ANALYSIS / EXAMPLE 2
# Data file: foobar.rda
# - Matrix: S (covariance matrix)
# - Scalar: N (sample size)

# Example highlights:
# - Global fit tests for model 1 are inconsistent (some show poor fit, some
#   show acceptable fit)
# - Respecification: Model modified to include covariance for the
#   disturbances of y2 and y3


# Initial Model -----------------------------------------------------------

model1 <- '
y3 ~ y2
y2 ~ x1 + x2 + y1
y1 ~ x1
x1 ~~ x2
'
sol1 <- sem(model1, sample.cov=S, sample.nobs=N)

# Parameter estimates and significance tests
summary(sol1, standardized=TRUE)
parameterEstimates(sol1, standardized=TRUE)

# Global fit
fitMeasures(sol1, c("chisq","df","pvalue"))
fitMeasures(sol1, c("cfi","rmsea","srmr"))

# Local fit
residuals(sol1, type="normalized")
residuals(sol1, type="standardized")
residuals(sol1, type="cor")
modificationIndices(sol1)                     # Shows all MIs
modificationIndices(sol1, minimum.value=10)   # Show only MIs ≥ 10


# Modified Model ----------------------------------------------------------
# Add: Covariance for disturbances of y2 and y3
model2 <- '
y3 ~ y2
y2 ~ x1 + x2 + y1
y1 ~ x1
x1 ~~ x2
y2 ~~ y3
'
# Run this new model and assess fit.
sol2 <- sem(model2, sample.cov=S, sample.nobs=N)
fitMeasures(sol2, c("chisq","df","pvalue"))
fitMeasures(sol2, c("cfi","rmsea","srmr"))
