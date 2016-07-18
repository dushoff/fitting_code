# Just the points
compplot()
compplot(logy=TRUE)

# Regular LS
compplot()
fitline(lsfit)
compplot(logy=TRUE)
fitline(lsfit)

# log-scale LS
compplot()
fitline(log_lsfit, col="blue")
compplot(logy=TRUE)
fitline(log_lsfit, col="blue")

# Both LS
compplot()
fitline(lsfit)
fitline(log_lsfit, col="blue")
compplot(logy=TRUE)
fitline(lsfit)
fitline(log_lsfit, col="blue")

# Add NB
compplot()
fitline(lsfit)
fitline(log_lsfit, col="blue")
fitline(nbfit, col="red")
compplot(logy=TRUE)
fitline(lsfit)
fitline(log_lsfit, col="blue")
fitline(nbfit, col="red")
