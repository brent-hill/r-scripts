# EDUC 885 / SEM -- CFA / EXAMPLE 3
# Data file: neurot_extrav.rda
# - Matrix: COV_neu.ext (covariance matrix)

# Example notes:
# - Covariance matrix (COV_neu.ext) used as input data
# - The sample size is N = 250


# Model 1 -----------------------------------------------------------------

model1 <- '
AffSoc =~ neu1 + neu2 + neu3 + neu4 + ext1 + ext2 + ext3 + ext4
'

# Parameter estimates and significance tests
sol1 <- cfa(model1, sample.cov=COV_neu.ext, sample.nobs=250)
summary(sol1, standardized=TRUE, rsquare=TRUE)
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


# Model 2 -----------------------------------------------------------------
# - Modification: Allow for n = 2 factors

model2 <- '
Neu =~ neu1 + neu2 + neu3 + neu4
Ext =~ ext1 + ext2 + ext3 + ext4
Neu ~~ Ext
'
sol2 <- cfa(model2, sample.cov=COV_neu.ext, sample.nobs=250)
summary(sol2, standardized=TRUE, rsquare=TRUE)
parameterEstimates(sol2, standardized=TRUE)

# Global fit
fitMeasures(sol2, c("chisq","df","pvalue"))
fitMeasures(sol2, c("RMSEA","CFI","SRMR"))

# Local fit
# - Covariance residuals
residuals(sol2, type="normalized")
residuals(sol2, type="standardized")
residuals(sol2, type="cor")
# - Modification indices
modificationIndices(sol2, minimum.value=10)
