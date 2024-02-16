
######

par(mfrow=c(1,1))
## seed 1 works; better to use 10
set.seed(12)
lim <- 20
t <- 600
times <- numeric(t)
times[1] <- 0
for (i in 2:t) {
times[i] <- rexp(1,(i-1)/5)
}
z <- cumsum(times)
curve(exp(0.20*x),0,lim+2,lwd=4,lty=1,xlab = "Time",
   ylab="Population",xlim=c(0,lim+1))

for (kk in 1:6)
{t <- 6000
times <- numeric(t)
times[1] <- 0
for (i in 2:t) {
times[i] <- rexp(1,(i-1)/5)
}
z <- cumsum(times)
vec <- sum(z<=lim+2)
lines(z[1:vec],0:(vec-1),type="l")
}
################
trials <- 10000
simlist <- numeric(trials)
t <- 100
times <-numeric(t)
for (j in 1:trials) {
times[1] <- 0
for (i in 2:t) {
times[i] <- rexp(1,(i-1)/5)
}
z <- cumsum(times)
simlist[j] <-sum(z <= 10)	
}
