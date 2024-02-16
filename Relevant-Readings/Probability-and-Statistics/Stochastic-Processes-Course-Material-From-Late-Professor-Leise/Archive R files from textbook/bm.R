# bm.R
# Section 8.1
# Simulating standard Brownian motion on [0, t]

n <- 1000
t <- 1
bm <- c(0,cumsum(rnorm(n,0,sqrt(t/n))))
steps <- seq(0,t,length=n+1)
plot(steps,bm,type="l")
