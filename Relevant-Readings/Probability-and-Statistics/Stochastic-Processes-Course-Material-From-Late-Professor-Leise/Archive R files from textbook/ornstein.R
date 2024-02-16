# ornstein.R
# Figure 9.5
# Ornstein-Uhlenbeck simulation

xo <- 2; mu<- -1; sig <- .1; alpha <- .5
mesh <- 100
t <- 10
par(mfrow=c(1,2),mar=c(2,1.75,1.5,1),tck=-.03,mgp=c(3,.5,0),cex.axis=0.7)
bm <- c(0, cumsum(rnorm(1000)))/sqrt(100)
xlist <- numeric(1001)
for (i in 0:1000){ 
xlist[i+1] <- mu + (xo-mu)*exp(-alpha * i/100) +
sig*bm[i+1] - alpha * sig*exp(-alpha*i/100) * 
    sum( exp(alpha*(0:i)/100 )*bm[1:(i+1)]/1000)
    }
    plot(seq(0,10,.01),xlist,type="l",ylim=c(-2,2),xlab="",ylab="")
    abline(h = -1, lty =2)

for (i in 1:6) {
bm <- c(0, cumsum(rnorm(1000)))/sqrt(100)
xlist <- numeric(1001)
for (i in 0:1000){ 
xlist[i+1] <- mu + (xo-mu)*exp(-alpha * i/100) +
sig*bm[i+1] - alpha * sig*exp(-alpha*i/100) * 
    sum( exp(alpha*(0:i)/100 )*bm[1:(i+1)]/1000)
    }
    lines(seq(0,10,.01),xlist,type="l")
    }
    
    xo <- 2; mu<- -1; sig <- .2; alpha <- .3
mesh <- 100
t <- 10
bm <- c(0, cumsum(rnorm(1000)))/sqrt(100)
xlist <- numeric(1001)
for (i in 0:1000){ 
xlist[i+1] <- mu + (xo-mu)*exp(-alpha * i/100) +
sig*bm[i+1] - alpha * sig*exp(-alpha*i/100) * 
    sum( exp(alpha*(0:i)/100 )*bm[1:(i+1)]/1000)
    }
    plot(seq(0,10,.01),xlist,type="l",ylim=c(-2,2),xlab="",ylab="")
    abline(h = -1, lty =2)

for (i in 1:6) {
bm <- c(0, cumsum(rnorm(1000)))/sqrt(100)
xlist <- numeric(1001)
for (i in 0:1000){ 
xlist[i+1] <- mu + (xo-mu)*exp(-alpha * i/100) +
sig*bm[i+1] - alpha * sig*exp(-alpha*i/100) * 
    sum( exp(alpha*(0:i)/100 )*bm[1:(i+1)]/1000)
    }
    lines(seq(0,10,.01),xlist,type="l")
    }
