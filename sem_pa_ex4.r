# SEM -- PATH ANALYSIS / EXAMPLE 4

# Data file: peabody1.rda

model1 <-
'
# Structural model
acqorder ~ B42*length + B43*frequse
frequse ~ B31*polysemy
polysemy ~ G11*entdate
length ~ G21*entdate

# Indirect effects
IE1 := G11*B31*B43
IE2 := G21*B42
'

sol <- sem(model1, sample.cov=COV, sample.nobs=175)
summary(sol, standardized=TRUE)
parameterEstimates(sol, standardized=TRUE)


fitMeasures(sol, c("chisq","df","pvalue"))
fitMeasures(sol, c("cfi","rmsea","srmr"))


resid(sol, type="cor")
resid(sol, type="standardized")
resid(sol, type="normalized")

modificationIndices(sol)
modificationIndices(sol, minimum.value=10)
