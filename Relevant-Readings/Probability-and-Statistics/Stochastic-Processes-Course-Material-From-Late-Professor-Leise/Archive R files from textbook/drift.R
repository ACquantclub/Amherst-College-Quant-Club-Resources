# drift.R
# Example 9.13, Figures 9.6 and 9.7
# simulation of random genetic drift SDE

par(mfrow=c(3,3),mar=c(2,1.75,1.5,1),tck=-.03,mgp=c(3,.5,0),cex.axis=0.7)
n = 200
t = 1.5
N <- 50
set.seed(4)
for(k in 1:9) {
xlist <- numeric(n*t + 1 )
xlist[1] <- 1/2
for (i in 2:(t*n + 1)) {
	xlist[i] <- xlist[i-1] +  sqrt(xlist[i-1]*(1-xlist[i-1]))*rnorm(1)/sqrt(n)
	if (xlist[i] < 0) xlist[i] <- 0
	if (xlist[i] > 1) xlist[i] <- 1
}
plot(seq(0,t,1/n),ylim=c(0,1),xlist,type="l",xlab="",ylab="",yaxt="n")
axis(2,c(0,0.5,1))
}

par(mfrow=c(2,2),mar=c(2,1.75,1.5,1),tck=-.03,mgp=c(3,.5,0),cex.axis=0.7)
tt <- c( 0.1, 0.2,0.35,1)
for (k in 1:4) {
n = 100
t = tt[k]
trials <- 10000
simlist <- numeric(trials)
for (j in 1:trials) {
xlist <- 1/2
for (i in 2:(n+1)) {
	new <- xlist + sqrt(xlist*(1-xlist))*rnorm(1)/sqrt(n/t)
if (new <0) new <- 0
if (new > 1) new <- 1
	xlist <- new
}
simlist[j] <- xlist
}
hist(simlist,xlab="",ylab="", freq=F,xlim=c(-.1,1.1),main="", col="lightgray")
}
