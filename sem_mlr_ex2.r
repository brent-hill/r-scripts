# EDUC 885 / MULTIPLE LINEAR REGRESSION / EXAMPLE 2

# Data file: hospitals.rda
# - Data frame: hosp

# Conventional approach (for reference)
results <- lm(risk~avgstay+avgage+culture+xray+census, hosp)
summary(results)
lm.beta(results)   # Requires add-on package 'lm.beta'

# MLR as SEM
# Package: 'lavaan'
model <- 'risk ~ avgstay + avgage + culture + xray + census'
fit <- sem(model, hosp)
summary(fit, rsquare=TRUE, standardized=TRUE)
parameterEstimates(fit, standardized=TRUE)



