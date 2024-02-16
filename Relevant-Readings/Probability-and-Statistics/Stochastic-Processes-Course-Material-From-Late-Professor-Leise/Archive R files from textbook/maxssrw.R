# maxssrw.R
# Example 8.4
# simulate the maximum of a simple symmetric random walk

n <- 10000
simlist <- replicate(10000,
  max(cumsum(sample(c(-1,1),n,replace=T))))
mean(simlist)
sd(simlist)
sim <-replicate(10000,
  if(max(cumsum(sample(c(-1,1),n,rep=T)))>200) 1 else 0)
mean(sim)  # P(max > 200)
  