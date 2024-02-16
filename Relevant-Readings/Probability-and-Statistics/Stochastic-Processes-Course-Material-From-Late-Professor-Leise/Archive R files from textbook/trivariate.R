# trivariate.R
# Example 5.7
# Gibbs sampler for trivariate distribution
# (X, P, N)

install.packages("scatterplot3d")
library(scatterplot3d)
trials <- 500
sim <- matrix(rep(0,3*trials),ncol=3)
sim[1,] <- c(1,0.5,2)
for (i in 2:trials) {
sim[i,1] <- rbinom(1,sim[i-1,3], sim[i-1,2])
sim[i,2] <- rbeta(1,sim[i,1]+1, sim[i-1,3]-sim[i,1] + 1)
sim[i,3] <- rpois(1,4*sim[i,2]) + sim[i,1]
}
xx <- sim
par(mfrow=c(2,3) ,mar=c(5,6,2,2))
plot(sim[,1],sim[,2],xlab="X",ylab="P",pch=20,cex=0.7,cex.lab=1.4)
plot(sim[,1],sim[,3],xlab="X",ylab="N",pch=20,cex=0.7,cex.lab=1.4)
plot(sim[,2],sim[,3],xlab="P",ylab="N",pch=20,cex=0.7,cex.lab=1.4)
scatterplot3d(sim,pch=20,cex.symbols=0.7,xlab="X",ylab="P",zlab="N")
hist(xx[,1],xlab="X",ylab="",main="",prob=T,cex.lab=1.4)
hist(xx[,2],xlab="P",ylab="",main="",prob=T, cex.lab=1.4)