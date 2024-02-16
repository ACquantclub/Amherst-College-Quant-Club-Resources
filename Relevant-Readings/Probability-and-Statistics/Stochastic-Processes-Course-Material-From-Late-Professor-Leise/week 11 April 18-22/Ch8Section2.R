# random walk approach for Brownian motion
duration <- 1  # total time
numsteps <- 100
steps <- seq(0,1,1/numsteps)
deltax <- sample(c(-1,1),size=numsteps,replace=TRUE)/sqrt(numsteps)
x <- c(0, cumsum(deltax)) # compute cumulative sum
plot(steps, x, type = "l", ylim = c(-2, 2),main="Random walk")

# simulate 100 instances (use either random walk or independent increments)
numsim <- 100
numsteps <- 1000
steps <- seq(0,1,1/numsteps)
deltaX <- matrix(sample(c(-1,1),size=numsteps*numsim,replace=TRUE)/sqrt(numsteps), numsim, numsteps)
# deltaX <- matrix(rnorm(n = numsim * numsteps, sd = sqrt(1/numsteps)), numsim, numsteps)
X <- cbind(rep(0, numsim), t(apply(deltaX, 1, cumsum)))
plot(steps, X[1, ], xlab = "time", ylab = "phenotype", ylim = c(-2, 2), type = "l")
for (k in 2:numsim) 
  lines(steps, X[k, ])

#  expected variance of B_t is parameter σ^2 times t
numsim <- 1000
numsteps <- 1000
steps <- seq(0,1,1/numsteps)
sigma2 <- 3 # variance parameter
deltaX <- matrix(sample(c(-1,1),size=numsteps*numsim,replace=TRUE)*sqrt(sigma2/numsteps), numsim, numsteps)
#deltaX <- matrix(rnorm(n = numsim * numsteps, sd = sqrt(sigma2/numsteps)), numsim, numsteps)
X <- cbind(rep(0, numsim), t(apply(deltaX, 1, cumsum)))
v <- apply(X, 2, var)
plot(steps, v, type = "l", xlab = "Time", ylab = "Variance among simulations")
abline(0,sigma2,col="blue")
