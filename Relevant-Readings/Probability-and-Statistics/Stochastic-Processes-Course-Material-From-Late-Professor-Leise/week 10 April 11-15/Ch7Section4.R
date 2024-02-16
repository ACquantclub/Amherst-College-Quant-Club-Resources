# Eat play nap example
Q <- matrix(c(-4,2/3,1/4,2,-2,3/4,2,4/3,-1),3,3)
Q
# eigenvalues and eigenvectors
r <- eigen(t(Q))
lambda <- r$values
V <- r$vectors
round(lambda,4)
pibar <- V[,3]/sum(V[,3])
pibar

round(pibar %*% Q, 6)

# Mean passage time for continuous-time Markov chain
Q <- matrix(0,4,4)
Q[1,] <- c(-3,1,1,1)
Q[2,] <- c(1,-2,0,1)
Q[3,] <- c(2,0,-4,2)
Q[4,] <- c(1,1,1,-3)
Q

# eigenvalues and eigenvectors
r <- eigen(t(Q))
lambda <- r$values
V <- r$vectors
round(lambda,4)
pibar <- V[,4]/sum(V[,4]) # eigenvector with lambda=0
pibar

round(pibar %*% Q, 6)

# mean passage time to state 1 (treat as absorbing state)
V <- Q[2:4,2:4]
Fm <- solve(-V) # Fundamental matrix
Fm
rowSums(Fm) # gives a2 a3 a4

# passage time simulation
Ntrials <- 100000
statelist <- 1:4
simtimes <- numeric(Ntrials)
init <- 2   # initial state
targetstate <- 1
for (trial in 1:Ntrials) {
  state <- init
  t <- 0
  while (state!=targetstate) {
    t <- t + rexp(1,rate=-Q[state,state]) # add on time to next state
    otherstates <- statelist[-state]
    state <- sample(otherstates,1,prob=Q[state,otherstates]/(-Q[state,state]))
  }
  simtimes[trial] <- t
}
hist(simtimes,main=paste("Mean passage time to state 1, mean=",round(mean(simtimes),3)), breaks=20, freq=F)

# Embedded chain
Ptilde <- matrix(c(0,1/2,1/2,1/3,1/3,0,0,1/3,1/3,0,0,1/3,1/3,1/2,1/2,0),4,4)
Ptilde
r <- eigen(t(Ptilde))
lambda <- r$values
V <- r$vectors
round(lambda)
pibar <- V[,1]/sum(V[,1])  # eigenvector with lambda=1
pibar
