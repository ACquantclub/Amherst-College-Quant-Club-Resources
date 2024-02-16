# integratedbm.R
# Integrated Brownian motion and Figure 9.1

par(mfrow=c(3,3), mar=c(3.75,1.75,2,1), tck=-.05, mgp=c(3,.5,0), cex.axis=0.7)
trials <- 9
mesh <- 1000
sim <- numeric(trials)
for (i in 1:trials){
	bm <- c(0,cumsum(rnorm(mesh)))/sqrt(mesh)
	ss <- sum(bm)/mesh
	sim[i] <- ss
x <- c(0:mesh,rev(0:mesh))
y <- c(rep(0,mesh+1),rev(bm))
plot(0:mesh,bm,type="l",xaxt="n",xlab="",ylab="")
axis(1,at = c(0,500,1000),labels=c("0.0", "0.5", "1.0"))
axis(2,at=c(0),labels=c("0.0"))
abline(h =0)
polygon(x,y,col="lightgray")
ss <- round(ss,2.7)
mtext(paste("Area = ",ss),1,line=2,cex=0.7)
}