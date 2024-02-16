# bivariatenormal.R
# Exmaple 5.6
# Gibbs sampler for Bivariate normal distribution

rho <- - 0.60
trials <- 2000
sdev <- sqrt(1 - rho^2)
simlist <- matrix(rep(0,2*trials),ncol=2)
for (i in 2:trials) {
	simlist[i,1] <- rnorm(1,rho*simlist[i-1,2], sdev)
	simlist[i,2] <- rnorm(1, rho*simlist[i,1], sdev)
}
plot(simlist,pch=20,xlab="x",ylab="y",main="")
