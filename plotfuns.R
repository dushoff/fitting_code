compplot = function(logy=FALSE, expand=1.25){
	par(cex.lab = expand, cex = expand, cex.axis = expand, lwd=expand)
	logtext=ifelse(logy, "y", "")
	plot (epidemic$week, epidemic$cases,
		log=logtext,
		xlab = "Week", ylab="Cases", pch=19
	)
}

fitline = function(fit, col="black"){
	with(c(epidemic, fit@coef), {
		lines(week, exp(linfun(c0=c0, lambda=lambda)), col=col)
	})
}
