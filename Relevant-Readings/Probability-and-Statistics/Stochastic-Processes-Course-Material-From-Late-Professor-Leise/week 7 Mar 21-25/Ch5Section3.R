# Adapted from:
# http://www.mas.ncl.ac.uk/~ndjw1/teaching/sim/gibbs/gibbs.html
# and Computational Statistics with MATLAB

# Bivariate normal example

# Direct generation of samples
rbvn<-function (n,mu,rho) 
{
  z1 <- rnorm(n,0,1)
  z2 <- rnorm(n,0,1)
  x <- z1+mu[1]
  y <- rho*z1+sqrt(1-rho^2)*z2+mu[2]
  cbind(x, y)
}
mu <- c(1,2)
rho <- 0.9
bvn<-rbvn(10000,mu,rho)
plot(bvn[,1],bvn[,2],pch=".")

# Samples means and covariance
mean(bvn[,1]) 
mean(bvn[,2])
cov(bvn)

# True covariance matrix
Sigma <- matrix(c(1,rho,rho,1),2,2)
Sigma

# Generate samples using Gibbs sampler
n <- 100000
xgibbs <- matrix(0,n,2)
rho <- 0.9
sigma <- sqrt(1-rho^2)
# Initial point
xgibbs[1,] <- c(10,10)
# Run the chain
for (i in 2:n) {
  mean1 <- mu[1] + rho*(xgibbs[i-1,2]-mu[2])
  xgibbs[i,1] <- mean1 + sigma*rnorm(1,0,1) # only needs standard normal univariate sampling
  mean2 <- mu[2] + rho*(xgibbs[i,1] - mu[1])
  xgibbs[i,2] <- mean2 + sigma*rnorm(1,0,1)
}
plot(xgibbs[,1],xgibbs[,2],pch=".")
mean(xgibbs[seq(from=5000,to=n,by=10),1]) # Discard initial portion and thin
mean(xgibbs[seq(from=5000,to=n,by=10),2])
cov(xgibbs[seq(from=5000,to=n,by=10),])
