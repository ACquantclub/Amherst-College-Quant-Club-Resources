## SaylesCost.R
## Total cost of "Sayles fee"
## Students arrive at Sayles -- about 10 per minute over 60 minutes

## Simulate total cost 
cost <- function() {
	N <- rpois(1,600)
dat <- sort(runif(N,0,60))
return(sum(60-dat))
}

cost()

simlist <- replicate(10000, cost())
hist(simlist, main="Simulation of total cost", xlab = "Cost", ylab="")
mean(simlist)
sd(simlist)