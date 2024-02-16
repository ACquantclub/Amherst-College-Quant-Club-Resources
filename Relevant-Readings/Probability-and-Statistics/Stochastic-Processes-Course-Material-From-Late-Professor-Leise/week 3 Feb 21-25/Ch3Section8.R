# Section 3.8

# 7 state example
P <- matrix(0,7,7) # states 1 to 7
P[1,1] <- 3/4
P[1,2] <- 1/4
P[2,c(1,2,3)] <- c(1/2,1/4,1/4)
P[7,c(1,6,7)] <- c(1/4,1/4,1/2)
for (k in 3:6) P[k,c(1,k-1,k,k+1)] <- matrix(1/4,1,4)
P
rowSums(P) # as check

# find eigenvalues
r <- eigen(t(P))
V <- r$vectors
lambda <- r$values
lambda
pibar <- V[,1]/sum(V[,1])
pibar

# After running for a long time, what is probability that 
# next 3 states will be 5,6,1 in that order?
pibar[5]*P[5,6]*P[6,1] # invariant prob vector method

longterm <- P %^% 100
longterm[1,5]*P[5,6]*P[6,1] # large power of P method

# Start in state 4. What is expected number of steps before
# chain is in state 4 again?
1/pibar[4]

# Start in state 1. What is expected number of steps
# until chain is in state 7?
Q <- P[1:6,1:6] # let state 7 be absorbing
M <- solve(diag(6)-Q)
sum(M[1,]) # sum row 1 of M (since start at 1)

# Start in state 2. What is prob of reaching state 7 before state 1?
P[1,]=c(1,0,0,0,0,0,0)
P[7,]=c(0,0,0,0,0,0,1) # let states 1 and 7 be absorbing
round(P %^% 100, 8) # ad hoc method: look at row 2 of large power of P

Q <- P[2:6,2:6] 
R <- P[2:6,c(1,7)]
M <- solve(diag(5)-Q)
A <- M %*% R
A[1,1:2] # precise method using linear algebra
