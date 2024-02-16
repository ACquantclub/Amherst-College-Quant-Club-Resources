# bmhitting.R
# Examples 8.26, 8.27
# First hitting time for Brownian motion with drift

mu <- 1/2
sig <- 1
a <- 10
simlist <- numeric(5000)
for (i in 1:5000) {
	t <- 80
	n <- 10000
	bm <- c(0,cumsum(rnorm(n,0,sqrt(t/n))))
	xproc <- mu*seq(0,t,t/n) + sig*bm
	simlist[i] <- which(xproc >= a)[1] * (t/n)
}
mean(simlist)
var(simlist)

# Exact results are mean = 20 and variance = 80
