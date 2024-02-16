# generating function
a<-c(1/4,1/4,1/2) # probability of 0, 1, or 2 offspring
mu <- sum((0:(length(a)-1))*a) # expected value of number of offspring
G <- function(s) a[1]+a[2]*s+a[3]*s^2

# extinction probability e
polyroot(c(a[1],a[2]-1,a[3]))

# iterative calculation of s_n
niteration <- 100
s <- matrix(0,niteration+1,1)
s[1]<-G(0)
for (n in 1:niteration) s[n+1] <- G(s[n])
plot(0:niteration,s,xlab="n",ylab="s_n(1)",ylim=c(0,1),type="l")

# another scenario
a<-c(.3,.5,.2) # probability of 0, 1, or 2 offspring
sum((0:(length(a)-1))*a) # expected value of number of offspring
polyroot(c(a[1],a[2]-1,a[3])) # extinction probability s

niteration <- 100
s <- matrix(0,niteration+1,1)
s[1]<-G(0)
for (n in 1:niteration) s[n+1] <- G(s[n])
plot(0:niteration,s,xlab="n",ylab="s_n(1)",ylim=c(0,1),type="l")
# finite expected extinction time
plot(1:(niteration+1),1+cumsum((1-s[1:(niteration+1)])),
     xlab="n",ylab="Partial sum",type="l",
     main=paste("Expected extinction time",round(1+sum((1-s[1:(niteration+1)])),3)))

# simulation to estimate extinction time distribution
extinction <- function(p) {
  Z<-1
  for (n in 1:1000) {
    ifelse(Z>0,
           Z<-sum(sample(0:(length(a)-1),Z,replace=TRUE,a)),
           return(n-1))
  }
}
sims <- matrix(0,10000,1)
for (k in 1:length(sims)) sims[k]<-extinction(a)
hist(sims,(min(sims)-.5):(max(sims)+.5),freq=FALSE,
     xlab="Extinction time",
     main=paste("Mean extinction time",mean(sims)))
