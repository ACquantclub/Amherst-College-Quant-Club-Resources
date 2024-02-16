# bbridge.R
# Example 8.12
# simulation of Brownian bridge

n <- 1000
t <- seq(0,1, length=n)
bm <- c(0,cumsum(rnorm(n-1,0,1)))/sqrt(n)
bb <- bm - t*bm[n]
plot(t,bb,type="l")

