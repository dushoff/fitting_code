epidemic <- read.csv("mexican.csv")
with(epidemic, {
	plot(week, cases)
	plot(week, cases, log="y")
})

