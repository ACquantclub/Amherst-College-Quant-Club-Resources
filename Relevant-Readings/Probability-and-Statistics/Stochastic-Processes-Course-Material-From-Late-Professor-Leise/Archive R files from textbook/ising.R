# ising.R
# Example 5.8
# Ising model

par(mfrow=c(2,2),mai=c(.8,0,.1,0),mgp=c(1.5,1,0))
betalist <- c(0,.441,.75,-1.5)
for (z in 1:4) {
g <- 60
beta <- betalist[z]
trials <- 100000
grid <- matrix(sample(c(-1,1),(g+2)^2,replace=T),nrow=g+2)
grid[c(1,g+2),]<- 0
grid[,c(1,g+2)] <-0
for (m in 1:trials) {
	i <- sample(2:(g+1), 1 )
	j <- sample(2:(g+1),1 )
deg <- grid[i,j+1] + grid[i,j-1] + grid[i-1,j] + grid[i+1,j]
 p <- 1/(1 + exp(-beta*2*deg))
 if (runif(1) < p) grid[i,j] <- 1 else grid[i,j] <- -1
 }
 final <- grid[2:(g+1),2:(g+1)]
image(final, yaxt="n", xaxt="n", xlab=c("A","B","C","D")[z],col=c(0,1),asp=1,frame=F)
}
