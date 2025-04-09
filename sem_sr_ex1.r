# SEM -- SR / EXAMPLE 1

# Data file: frisky_dingo.rda
# - Matrix: COV

library(lavaan)


# Measurement Submodel ----------------------------------------------------

msubmodel1 <- '
Ksi1 =~ x1 + x2 + x3
Ksi2 =~ x4 + x5 + x6
Eta1 =~ y1 + y2 + y3
Eta2 =~ y4 + y5 + y6
'
sol.msub1 <- cfa(msubmodel1, sample.cov=COV, sample.nobs=232)
parameterEstimates(sol.msub1, standardized=TRUE)
fitMeasures(sol.msub1, "chisq","df","pvalue")
fitMeasures(sol.msub1, "cfi","rmsea","srmr")
residuals(sol.msub1, type="normalized")
modificationIndices(sol.msub1, minimum.value=10, sort=TRUE)

# # Optional modification
msubmodel2 <- '
Ksi1 =~ x1 + x2 + x3
Ksi2 =~ x4 + x5 + x6
Eta1 =~ y1 + y2 + y3
Eta2 =~ y4 + y5 + y6
y4 ~~ y5
'


# Full SR Model -----------------------------------------------------------

model1 <- '
Ksi1 =~ x1 + x2 + x3
Ksi2 =~ x4 + x5 + x6
Eta1 =~ y1 + y2 + y3
Eta2 =~ y4 + y5 + y6
y4 ~~ y5
Eta1 ~ Ksi1 + Ksi2
Eta2 ~ Ksi1 + Ksi2 + Eta1
'
sol1 <- sem(model1, sample.cov=COV, sample.nobs=232)
parameterEstimates(model1, standardized=TRUE)
fitMeasures(model1, "chisq","df","pvalue")
fitMeasures(model1, "cfi","rmsea","srmr")
residuals(model1, type="normalized")
modificationIndices(model1, minimum.value=10, sort=TRUE)
