# EDUC 885 / SEM -- CFA / EXAMPLE 1
# Data file: holzinger_swineford.rda
# - Data frame: scores

# Example highlights:
# - Classic dataset from Holzinger and Swineford (1939)


# Initial Model -----------------------------------------------------------

model1 <- '
Spatial =~ 1*visperc + cubes
Verbal =~ lozenges + 1*parcomp + sencomp + wordmng
Spatial ~~ Verbal
'

# Parameter estimates and significance tests
sol1 <- cfa(model1)
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
# - Modification: Add loading for Spatial → lozenges

model2 <- '
Spatial =~ 1*visperc + cubes + lozenges
Verbal =~ lozenges + 1*parcomp + sencomp + wordmng
Spatial ~~ Verbal
'


# Next steps: Should we leave the loading for Verbal → lozenges?
