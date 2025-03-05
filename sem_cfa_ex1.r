# SEM / CFA / EXAMPLE 1

model1 <- '
Seq =~ hm + nr + wo
Sim =~ gc + tr + sm + ma + ps
'

sol1 <- cfa(model1, sample.cov=COV, sample.nobs=200)
summary(sol1, standardized=TRUE, rsquare=TRUE)
parameterEstimates(sol1, standardized=TRUE)

# Covariance residuals
residuals(sol1, type="normalized")
residuals(sol1, type="standardized")
residuals(sol1, type="cor")

# MI values
modificationIndices(sol1, minimum.value=10)




# Factor reliability coefficients
# Package: semTools
# note that semTools calculates AVE based on the unstandardized
# solution, not the standardized solution, so the result for
# AVE below will not match those in Kline (2023), which
# are based on the standardized solution.

semTools::reliability(sol1)
