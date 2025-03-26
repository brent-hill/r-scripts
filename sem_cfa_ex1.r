# EDUC 885 / SEM -- CFA / EXAMPLE 1
# Data file: holzinger_swineford.rda
# - Data frame: scores

# Example notes:
# - Classic dataset from Holzinger and Swineford (1939)
# - Initial model (model 1) intentionally misspecified (`lozenges` loaded
#   on `Verbal`)
# - This example uses ULI (`visperc` and `parcomp` are the markers).


# Model 1 -----------------------------------------------------------------

model1 <- '
Spatial =~ visperc + cubes
Verbal =~ parcomp + sencomp + wordmng + lozenges
'

# Parameter estimates and significance tests
sol1 <- cfa(model1, scores)
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
# - Modification: Add loading for `lozenges` on `Spatial`

model2 <- '
Spatial =~ visperc + cubes + lozenges
Verbal =~ parcomp + sencomp + wordmng + lozenges
'
# Next steps: Should we leave the loading for `lozenges` onto `Verbal`?


# Model 3 -----------------------------------------------------------------
# - Modification: Removed loading for `lozenges` on `Verbal`

model3 <- '
Spatial =~ visperc + cubes + lozenges
Verbal =~ parcomp + sencomp + wordmng
'
