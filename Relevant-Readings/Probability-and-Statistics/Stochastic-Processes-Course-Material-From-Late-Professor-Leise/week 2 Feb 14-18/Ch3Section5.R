# Section 3.5 Periodicity

# Reducible: transient and recurrent communication classes
# Transient class {3,4}
# Recurrent classes {1,2}, {5,6}
P <- matrix(0,6,6)
P[1:2,1:2] <- matrix(c(1/2,1/4,1/2,3/4),2,2)
P[3,3:6] <- matrix(c(1/4,1/4,1/4,1/4),1,4)
P[4,3:6] <- matrix(c(1/4,1/4,1/4,1/4),1,4)
P[5:6,5:6] <- matrix(c(1/2,1/3,1/2,2/3),2,2)
P
P %^% 50
r <- eigen(t(P))
V <- r$vectors
lambda <- r$values
# Matrix has two stationary distributions
round(V[,1]/sum(V[,1]),6)
round(V[,2]/sum(V[,2]),6)

# Periodic Markov chain: if period d, expect d eigenvalues with abs=1
P <- matrix(0,5,5)
P[1,2:3] <- 1/2
P[2:3,4:5] <- 1/2
P[4:5,1] <- 1
P
P %^% 50
P %^% 51
P %^% 52
P %^% 53
r <- eigen(t(P))
V <- r$vectors
lambda <- r$values
abs(lambda)
# Spend third of time in subset of states
# Proportion given by invariant prob distribution
# Equals limit of mean of d successive powers of M
pibar <- V[,3]/sum(V[,3])
pibar
(P %^% 50 + P %^% 51 + P %^% 52)/3

# another period 3 example
P <- matrix(0,6,6)
P[1:2,3:4] <- matrix(c(1/2,1/4,1/2,3/4),2,2)
P[3:4,5:6] <- matrix(c(1/2,1/2,1/2,1/2),2,2)
P[5:6,1:2] <- matrix(c(1/2,1/3,1/2,2/3),2,2)
P
P %^% 50
P %^% 51
P %^% 52
P %^% 53
r <- eigen(t(P))
V <- r$vectors
lambda <- r$values
round(abs(lambda),6)
# Spend third of time in each pair of states
# Proportion given by stationary distribution
# Equals limit of mean of d successive powers of M
round(lambda,6)
pibar <- V[,1]/sum(V[,1]) # update index to give eigenvector with lambda=1
pibar
(P %^% 50 + P %^% 51 + P %^% 52)/3
