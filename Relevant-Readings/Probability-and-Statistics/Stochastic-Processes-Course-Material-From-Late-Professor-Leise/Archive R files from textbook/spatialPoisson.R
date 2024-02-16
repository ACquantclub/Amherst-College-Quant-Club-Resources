# spatialPoisson.R
# Example 6.10
# Spatial Poisson process

lambda <- 100
squarearea <- 1
trials <- 10000
simlist <- numeric(trials)
for (i in 1:trials) {
	N <- rpois(1, lambda*squarearea)
	xpoints <- runif(N,0,1)
	ypoints <- runif(N,0,1)
	ct <- sum(((xpoints-0.7)^2 + (ypoints-0.7)^2) <= 0.2^2)
	simlist[i] <- ct # number of points in circle
	}
mean(simlist)
var(simlist)
# Compare to theoretical mean and variance
lambda*pi*(0.2)^2

