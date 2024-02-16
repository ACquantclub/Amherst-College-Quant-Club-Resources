# branching.R
# Chapter 4
# Branching process with different offspring distributions

### Poisson offspring distribution
branch <- function(n,lam) {  ## Poisson
	z <- c(1,rep(0,n))
	for (i in 2:(n+1)) {
			z[i] <- sum(rpois(z[i-1],lam))
			}
			return(z)
			}
			
### Geometric distribution
			branch <- function(n,p) {
	z <- c(1,rep(0,n))
	for (i in 2:(n+1)) {
			z[i] <- sum(rgeom(z[i-1],p))
			}
			return(z) }

### Examples						
branch(10,1/4)
replicate(5, branch(10,1/4))		
n <- 5000
simlist <- replicate(n, branch(10,1/4)[11])
sum(simlist==0)/n

branch(10,1/4)	
			curve((1-sqrt(1-4*x*(1-x)))/(2*(1-x)),0,1/2,xlab="p",ylab="Extinction probability")
		
## Example in class a= (1/6,1/3,1/2)		
			branch <- function(n) {
	z <- c(1,rep(0,n))
	for (i in 2:(n+1)) {
			z[i] <- sum( sample(0:2, z[i-1], replace=T, prob=c(1/6, 1/3, 1/2)))
			}
			return(z) }

branch(20)
n <- 5000
simlist <- replicate(n, branch(20)[21])
sum(simlist==0)/n

			
			