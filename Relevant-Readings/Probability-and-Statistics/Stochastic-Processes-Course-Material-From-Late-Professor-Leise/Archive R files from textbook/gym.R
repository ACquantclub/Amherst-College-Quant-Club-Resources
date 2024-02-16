# gym.R
# Example 3.2
# Markov simulation

P <- matrix(c(0.1,0.2,0.4,0.3,0.4,0,0.4,0.2,0.3,0.3,0,0.4,0.2,0.1,0.4,0.3),
  nrow=4, byrow=TRUE)
lab <- c("Aerobics","Massage","Weights","Yoga")
rownames(P) <- lab
colnames(P) <- lab
P
init <- c(1/4,1/4,1/4,1/4) # initial distribution
states <- c("a","m","w","y")
# simulate chain for 100 steps
simlist <- markov(init,P,100,states)
simlist
table(simlist)/100
steps <- 1000000
simlist <- markov(init,P,steps,states)
table(simlist)/steps