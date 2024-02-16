brownian <- function(n=6000,plot=T,fun=rnorm) {
	x<-cumsum(fun(n))
	y<-cumsum(fun(n))
	plot(x,y,type="l",xlab="",ylab="",xaxt="n",col="red",yaxt="n")
	}
 
 # for book use seed=13
setEPS()
postscript(file="../Graphics/c1brownian.eps",width=4, height=4)
set.seed(14)
par(mfrow=c(2,2), mar=c(1.25,1.25,1.5,1),tck=-.03,mgp=c(3,.5,0),cex.axis=0.7)
for (i in 1:4) brownian(fun=rnorm)

dev.off()

k <- 110
par(mfrow=c(4,4), mar=c(1.25,1.25,1.5,1))
for (i in k:(k+15)) {
	set.seed(i)
	brownian(n=11000)
}

par(mfrow=c(1,1))
set.seed(121)
brownian(n=11000)