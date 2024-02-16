#### Branching process with Poisson offspring distribution


branch <- function(n,lam) {
	z <- c(1,rep(0,n))
	for (i in 2:(n+1)) {
			z[i] <- sum(rpois(z[i-1],lam))
			}
			return(z)
			}
			
			### Geometric offspring
			branch <- function(n,p) {
	z <- c(1,rep(0,n))
	for (i in 2:(n+1)) {
			z[i] <- sum(rgeom(z[i-1],p))
			}
			return(z)
			}
			
			
			curve((1-sqrt(1-4*x*(1-x)))/(2*(1-x)),0,1/2,xlab="p",ylab="Extinction probability")