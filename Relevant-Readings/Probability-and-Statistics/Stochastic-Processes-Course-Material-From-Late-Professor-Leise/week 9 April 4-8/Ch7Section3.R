# Generator matrix example
Q <- matrix(0,3,3)
Q[1,] <- c(-2,1,1)
Q[2,] <- c(1,-2,1)
Q[3,] <- c(1,1,-2)

# transition function P(t)
library("expm")
transfun <- function(t,Q) expm(t*Q)

transfun(0.1,Q) 
transfun(1,Q)
transfun(100,Q)


# Chapter 7 Section 3: stationary distribution for continuous-time Markov chain
Q <- matrix(0,4,4)
Q[1,] <- c(-3,1,1,1)
Q[2,] <- c(1,-2,0,1)
Q[3,] <- c(2,0,-4,2)
Q[4,] <- c(1,1,1,-3)
Q

# eigenvalues and eigenvectors
r <- eigen(t(Q))
lambda <- r$values
round(lambda)
V <- r$vectors

pibar <- V[,4]/sum(V[,4]) # associated with lambda=0
pibar
