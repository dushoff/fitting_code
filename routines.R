
# Curves

linfun <- function(c0=c0, lambda=lambda){
	c0+lambda*epidemic$week
}

logitfun <- function(K, x0, lam){
	mean = (K*x0)/(x0+(K-x0)*exp(-epidemic$week*lam))
}

# Likelihoods
## linfun baked in

lsfun <- function(c0=1, lambda=1){
	log_mean <- linfun(c0, lambda)
	case_mean <- exp(log_mean)
	return(sum((epidemic$cases-case_mean)^2))
}

log_lsfun <- function(c0=1, lambda=1){
	log_mean <- linfun(c0, lambda)
	return(sum((log(epidemic$cases)-log_mean)^2))
}

exp_nb <- function(c0=1, lambda=1, shape=2){
	log_mean <- linfun(c0, lambda)
	case_mean <- exp(log_mean)
	-sum(dnbinom(epidemic$cases, shape, mu=case_mean, log=TRUE))
}

logit_nb = function(x0=1, lam=1, K=1000, shape=2){
	case_mean = logitfun(K, x0, lam)
	-sum(dnbinom(epidemic$cases, shape, mu=case_mean, log=TRUE))
}

# Fitting function

pulliam_fit <- function(ll){
	fit <- mle(ll, method="SANN")
	fit@details$convergence
	(fit <- mle(ll, start=as.list(fit@coef), method="Nelder-Mead"))
	print(c(converge=fit@details$convergence))
	fit
}
