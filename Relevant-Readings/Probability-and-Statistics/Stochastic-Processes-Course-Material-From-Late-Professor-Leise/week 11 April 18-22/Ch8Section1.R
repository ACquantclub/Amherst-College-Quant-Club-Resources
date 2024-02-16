# simulate a single instance of standard Brownian motion as sum of increments
t <- 1  # total time
numsteps <- 1000
steps <- seq(0,1,t/numsteps)
# first generate a set of random increments
deltaX <- rnorm(n = numsteps, sd = sqrt(t/numsteps))
# then compute their cumulative sum
X <- c(0, cumsum(deltaX))
plot(steps, X, type = "l", ylim = c(-max(abs(X))*1.1, max(abs(X))*1.1),main="Brownian motion simulation")
abline(h=0, col="blue")
