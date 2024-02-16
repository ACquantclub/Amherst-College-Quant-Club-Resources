# kstest.R
# Example 8.14
# Kolmogorov-Smirnov test for uniformity

trials <- 10000
n <- 1000
simlist <- numeric(trials)
for (i in 1:trials){
	t <- seq(0,1,length=n)
	# Brownian motion
	bm <- c(0,cumsum(rnorm(n-1,0,1)))/sqrt(n)
	bb <- bm - t*bm[n] # Brownian bridge
	z <- max(bb)  # maximum of Brownian bridge on [0,1]
	simlist[i] <- if (z > 0.22*sqrt(40)) 1 else 0
}
mean(simlist)  # simulation of P value = P(Z > 1.41)

data <- c(0.1,0.296,0.212,0.385,0.993,0.870,0.070,0.815,0.123,0.588,
0.332,0.035,0.758,0.362,0.453,0.047,0.134,0.389,0.147,0.424,
0.06,0.003,0.8,0.011,0.085,0.674,0.196,0.715,0.342,0.519,
0.675,0.799,0.768,0.721,0.315,0.009,0.109,0.835,0.044,0.152)
ks.test(data,"punif",0,1)$p.value/2  # exact P-value

