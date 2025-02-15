# EDUC 885 / MLR as SEM / EXAMPLE 3
# Data file: acad_perf.rda
# - Data frame:

# Example showing how to include intercepts
# - Via model specification (1)
# - meanstructure=TRUE in sem()

model <- 'ugpa~act+hsgpa'
fit <- sem(model, acad_perf, meanstructure=FALSE)
summary(fit, rsquare=TRUE, standardized=TRUE)
parameterEstimates(fit, standardized=TRUE)
