# Markov chain intro demo

# Simple random walks with absorbing or reflective BCs
# Interpret as Gambler's ruin
p <- 18/38 # prob of winning
q <- 1-p   # prob of losing
n <- 10   # upper absorbing barrier
c <- 5    # initial state
P <- matrix(0,n+1,n+1)
for (i in 2:n) {
  P[i,i+1] <- p
  P[i,i-1] <- q
}
P[1,1] <- 1 # absorbing boundary
P[n+1,n+1] <- 1
#P[1,2] <- 1 # reflecting boundary
#P[n+1,n] <- 1
x <- matrix(0,1,n+1)
x[1,c+1] <- 1
for (i in 1:30) {
  x <- x %*% P
  plot((1:(n+1))[x>0],x[x>0],xlim=c(0,n+2),
       ylim=c(0,1),xlab="k",ylab="P(X=k)")
  Sys.sleep(.2)
}

# random walk with 5 states and absorbing boundaries
# demo with initial probability vector
nstates <- 5
p <- 1/2
P <- matrix(0,nstates,nstates)
P[1,1] <- 1
P[nstates,nstates] <- 1
for (j in 2:(nstates-1)) {
  P[j,j-1] <- p
  P[j,j+1] <- 1-p
}
P
rownames(P) <- c("0","1","2","3","4")
colnames(P) <- c("0","1","2","3","4")
P

# stochastic matrix: each row sums to 1
rowSums(P) 

alpha <- c(0,0,1,0,0) # initially at state 3
alpha %*% P

# to take powers, need matrix exponentiation package expm
#install.packages('expm')
library(expm)

alpha %*% (P %^% 2)
alpha %*% (P %^% 3)
alpha %*% (P %^% 4)
alpha %*% (P %^% 20)

# P^n converges to a matrix with information about large-time behavior
P %^% 20 
P %^% 50
P %^% 100
round(P %^% 100, 6) # round to at most 6 decimal places

