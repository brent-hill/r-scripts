# EDUC 885 / SEM -- CFA / EXAMPLE 5
# Data file: test_anxiety.rda
# - Matrix: S_rtt (covariance matrix)

# Example notes:
# - Covariance matrix (S_rtt) used as input data
# - The sample size is N = 318
# - Although the chi-squared test is significant, and there are a few
#   relatively large MIs, this is an example of a good model that does not
#   really need to be modified.


# Model 1 -----------------------------------------------------------------

model1 <- '
Tens =~ tens1 + tens2 + tens3
Wor =~ wor1 + wor2 + wor3
Irr =~ irr1 + irr2 + irr3
Body =~ body1 + body2 + body3
'

# Parameter estimates and significance tests
sol1 <- cfa(model1, sample.cov=S_rtt, sample.nobs=318)
summary(sol1, rsquare=TRUE, standardized=TRUE)
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
