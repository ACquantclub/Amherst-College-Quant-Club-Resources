# Section 3.4 Finite irreducible Markov chains

P <- matrix(c(.4,.2,.4,.6,0,.4,.2,.5,.3),3,3,byrow=T)
r <- eigen(t(P))
lambda <- r$values
V <- r$vectors
pibar <- V[,1]/sum(V[,1])
pibar
1/pibar[2]

takestep <- function(x) {
  switch(x,
         sample(3,1,prob=P[1,]), #if state 1
         sample(3,1,prob=P[2,]), #if state 2
         sample(3,1,prob=P[3,]))   #if state 3
}
waitingtime <- function(initial) {
  x <- initial
  for (j in 1:10000) {
    x <- takestep(x)
    ifelse(x==initial, return(j),-1)
  }
}
initial <- 2
nsims <- 10000
sims <- matrix(0,nsims)
for (k in 1:nsims) {
  sims[k] <- waitingtime(initial)
}
hist(sims,(min(sims)-.5):(max(sims)+.5),freq=FALSE,
     xlab="Number of steps",xlim=c(0,20),
     main=paste("Mean first return time",mean(sims)))
