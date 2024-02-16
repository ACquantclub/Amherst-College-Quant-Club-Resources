# logistic.R
# Figure 9.4
# simulating logistic SDE

f <- function(t) {
	K*2/(2+(K-2)*exp(-r*t))
}
 
par(mfrow=c(3,3),mar=c(2,1.75,1.5,1),tck=-.03,mgp=c(3,.5,0),cex.axis=0.7)
r <- 0.06; K <- 300
T <- 200; n <- 1000
for (k in 1:3) {
	sigma <- 0.02
x <- numeric(n+1)
x[1] <- 2
for (i in 2:(n+1)) {
	x[i] <- x[i-1] + r*x[i-1]*(1-x[i-1]/K)*T/n + sigma*x[i-1]*sqrt(T/n)*rnorm(1)
}
plot(seq(0,T,T/n),x,type="l",xlab="",ylab="",yaxt="n", ylim=c(0,400))
axis(2,c(0,300))
plot(f,0,T, add =TRUE)
abline(h = K,lty=2)
text(40,355,expression(paste(sigma," = 0.02")),cex=0.9)
}
for (k in 1:3) {
	sigma <- 0.05
x <- numeric(n+1)
x[1] <- 2
for (i in 2:(n+1)) {
	x[i] <- x[i-1] + r*x[i-1]*(1-x[i-1]/K)*T/n + sigma*x[i-1]*sqrt(T/n)*rnorm(1)
}
plot(seq(0,T,T/n),x,type="l",xlab="",ylab="",yaxt="n", ylim=c(0,400))
axis(2,c(0,300))
plot(f,0,T, add =TRUE)
abline(h = K,lty=2)
text(40,355,expression(paste(sigma," = 0.05")),cex=0.9)
}
for (k in 1:3) {
	sigma <- 0.15
x <- numeric(n+1)
x[1] <- 2
for (i in 2:(n+1)) {
	x[i] <- x[i-1] + r*x[i-1]*(1-x[i-1]/K)*T/n + sigma*x[i-1]*sqrt(T/n)*rnorm(1)
}
plot(seq(0,T,T/n),x,type="l",xlab="",ylab="",yaxt="n", ylim=c(0,400))
axis(2,c(0,300))
plot(f,0,T, add =TRUE)
abline(h = K,lty=2)
text(40,355,expression(paste(sigma," = 0.15")),cex=0.9)
}
