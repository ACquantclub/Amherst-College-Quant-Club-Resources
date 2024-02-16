# poissonsim.R
# Section 6.5
# Simulating a Poisson process

t <- 40
lamba <- 1/2
N <- rpois(1, lambda*t)
unifs <- runif(N,0,t)
arrivals <- sort(unifs)
arrivals
