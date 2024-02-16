# Branching process demo
a<-c(.2,.5,.3) # probability of 0, 1, or 2 offspring

# expected value of number of offspring
mu <- sum((0:(length(a)-1))*a)

# graph sample chain -- run multiple times to observe
# extinction vs population explosion
nsteps<-40
Z<-matrix(0,nsteps,1)
Z[1]<-1
for (n in 2:nsteps) {
  ifelse(Z[n-1]>0,
     Z[n]<-sum(sample(0:(length(a)-1),Z[n-1],replace=TRUE,a)),
     Z[n]<-0)
}
plot(Z,type="l",xlab="Generation",ylab="Population",
     main="Branching process")
