# Intro to Stochastic Processes

# Bernoulli process demo -- heads and tails
# fair coin
sample(0:1,30,replace=TRUE) # observe how common runs are
x <- sample(0:1,30,replace=TRUE)
table(x) # tabulate how many 0s and 1s

# indices of heads after n flips, can be unfair coin
head <- function(n,p) (1:n)[rbinom(n,1,p)==1]
head(30,1/2) 
head(30,0.2)

# Simple random walk (heads move to right, tails move to left)
n <- 100
support <- 1:100
walk <- cumsum(sample(c(-1,1),n,replace=TRUE))
graph <- function(k) {
  plot(1:k, walk[support<=k],xlim=c(1,n),
       ylim=c(-n/4,n/4),type="l",xlab="Step",ylab="Position")
  Sys.sleep(0.1)
}
# DOUBT: Why is it returning a null vector?
z <- sapply(support,graph)
