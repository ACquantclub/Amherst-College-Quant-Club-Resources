#### RW on hypercube

### Simulate the return time to the origin for 
###   simple random walk on the n-hypercube

hyper <- function(n) {
start <- rep(0,n)
i <- 0
found <- 1
vec <- start
while (found  >0) {
  bit <- sample(1:n,1)
	vec[bit] = abs(vec[bit]-1)
	found <- sum(vec)
	i <- i  +1}
return(i)
}

simlist <- replicate(10000,hyper(5))
mean(simlist)