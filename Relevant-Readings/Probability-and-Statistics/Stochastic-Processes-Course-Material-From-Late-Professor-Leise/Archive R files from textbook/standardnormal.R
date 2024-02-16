# standardnormal.R
# Example 5.5

trials <- 1000000
simlist <- numeric(trials)
state <- 0
for (i in 2:trials) {
  prop <- runif(1, state-1,state+1)
  acc <- exp(-(prop^2-state^2)/2)
  if (runif(1) < acc) state <- prop
  simlist[i] <- state
}
hist(simlist,xlab="",main="",prob=T)
curve(dnorm(x),-4,4,add=T)
