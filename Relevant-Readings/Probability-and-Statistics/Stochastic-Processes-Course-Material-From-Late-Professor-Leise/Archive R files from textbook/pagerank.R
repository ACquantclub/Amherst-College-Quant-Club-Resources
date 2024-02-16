# pagerank.R
# Example 3.21
# PageRank probabilities

Q <- matrix(c(0,0,0,0,1/2,1/2,0,1/3,0,1/3,0,0,1/3,0,0,0,0,1/2,0,1/2,0,0,0,0,0,0,1,0,
  1/4,0,0,1/4,0,1/4,1/4,1/2,1/2,0,0,0,0,0,1/7,1/7,1/7,1/7,1/7,1/7,1/7),nrow=7,byrow=TRUE)
states <- c("a","b","c","d","e","f","g")
rownames(Q) <- states
colnames(Q) <- states
Q
A <- matrix(rep(1/7,49),nrow=7)
rownames(A) <- states
colnames(A) <- states
A
# transition matrix with damping factor p=0.85
P <- 0.85*Q + 0.15*A
pr <- stationary(P)
pr # stationary probabilities