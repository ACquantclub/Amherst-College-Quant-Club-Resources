# stochresonance.R
# Example 9.14
# Stochastic resonance

par(mfrow=c(1,3),mar=c(2,1.75,1.5,1),tck=-0.03,mgp=c(3,.5,0))
sig <- c(0.2,2,0.8)
set.seed(20)
for (k in 1:3) {
	sigma<- sig[k]
	T <- 100
n <- 600
A <- .3
z <- 1
w <- 2*pi/40
x <- numeric(n+1)
x[1]<- 0
for (i in 2:(n+1)) x[i] <- x[i-1] + (z*x[i-1] - z*x[i-1]^3 + A*sin(w*T*(i-1)/n))*T/n + sigma*sqrt(T/n)*rnorm(1)
plot(seq(0,T,T/n),x,type="l",ylim=c(-1.5,1.5),xaxt="n",xlab="",ylab="",yaxt="n",lwd=0.5)
axis(2,c(-1,0,1))
axis(1,c(0,25,50,75,100))
curve(A*sin(w*x),0,400,lty=2,add=TRUE)
}


