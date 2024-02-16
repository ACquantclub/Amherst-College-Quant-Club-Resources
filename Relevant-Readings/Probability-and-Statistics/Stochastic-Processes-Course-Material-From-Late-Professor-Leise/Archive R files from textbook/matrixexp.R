# matrixexp.R
# Section 7.3
# Computing transition function from matrix exponential

install.packages("expm")
library(expm)
Q <- matrix(c(-1/4,1/4,0,0,0,1/5,-9/20,1/4,0,0,0,1/5,-9/20,1/4,0,0,0,1/5,-9/20,1/4,0,0,0,1/5,-1/5),nrow=5,byrow=T)
rownames(Q) <- 0:4
colnames(Q) <- 0:4
round(Q,3)

P  <- function(t) round(expm(t*Q),3)
P(2.5)
P(100)
