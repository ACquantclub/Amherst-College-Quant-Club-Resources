# random walk with absorbing boundaries
nstates <- 4
p <- 1/2
P <- matrix(0,nstates,nstates)
P[1,1] <- 1
P[nstates,nstates] <- 1
P[nstates,nstates] <- 1
for (j in 2:(nstates-1)) {
  P[j,j-1] <- p
  P[j,j+1] <- 1-p
}
P

# first and last columns give probability that walker
#starting in (row)th position get absorbed into each boundary
P %^% 50
round(P %^% 50, 6)

# stationary vector for each absorbing state
r <- eigen(t(P)) # t is transpose, use if treating vectors as rows
V <- r$vectors
lambda <- r$values
round(t(V %*% diag(lambda) %*% solve(V)),6) # diagonalization

phi <- matrix(1/nstates,1,nstates) # uniform initial prob
for (k in 1:30) {
  phi <- phi %*% P
  plot(1:nstates,phi,ylim=c(0,1),xlab="State",ylab="Probability",
       main=paste("Probability distribution at time",k))
  Sys.sleep(.5)
}

# limiting distribution depends on initial condition when
# more than one invariant prob distr, but will always be a 
# linear combination of eigenvectors for lambda=1
phi <- matrix(0,1,nstates)
phi[2] <- 1 # start at state 2
for (k in 1:30) {
  phi <- phi %*% P
  plot(1:nstates,phi,ylim=c(0,1),xlab="State",ylab="Probability",
       main=paste("Probability distribution at time",k))
  Sys.sleep(.5)
}

round(phi %*% (P %^% 50),6)
