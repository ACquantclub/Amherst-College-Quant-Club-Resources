# Section 2.4

# random walk with reflecting boundary
nstates <- 5
p <- 1/2
P <- matrix(0,nstates,nstates)
P[1,2] <- 1
P[nstates,nstates-1] <- 1
for (j in 2:(nstates-1)) {
  P[j,j-1] <- p
  P[j,j+1] <- 1-p
}
P

# to take powers, need matrix exponentiation package expm
#install.packages('expm')
library(expm)

P %^% 20 # converges to different matrices for even and odd powers
P %^% 21
P %^% 22

# at step n, phi vector gives probability of being in each state
phi <- matrix(1/nstates,1,nstates)
for (k in 1:30) {
  phi <- phi %*% P
  plot(1:nstates,phi,ylim=c(0,.5))
  Sys.sleep(.5)
}

# 2x2 example
P <- matrix(c(3/4,1/6,1/4,5/6),2,2)
P %^% 100        # matches rows of large power of matrix

# find eigenvectors
r <- eigen(t(P)) # t is transpose, use if treating vectors as rows
V <- r$vectors
lambda <- r$values
V # left eigenvectors
V[,1]/sum(V[,1]) # invariant vector (eigenvector for lambda=1)
Q <- solve(V) # right eigenvectors
Q[1,]/Q[1,1] # lambda=1 has right eigenvector of all 1s
t(V %*% diag(lambda) %*% solve(V))

pibar <- V[,1]/sum(V[,1]) # invariant vector (eigenvector for lambda=1)
pibar
P %^% 100        # pibar matches rows of large power of matrix

