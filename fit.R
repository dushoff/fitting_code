library(stats4)

# Do best fit least squares on the original data
print(lsfit <- pulliam_fit(lsfun))

# Do best fit least squares directly on the logged data
print(log_lsfit <- pulliam_fit(log_lsfun))

# Do an nb fit
print(nbfit <- pulliam_fit(exp_nb))
