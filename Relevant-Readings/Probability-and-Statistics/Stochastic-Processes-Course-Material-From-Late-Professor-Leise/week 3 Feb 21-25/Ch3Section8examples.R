# Section 3.8 examples

# Simple random walk on a circle (cycle graph)

# simulation of walk on circle
n <- 200
nvertices <- 30
coinflips <- sample(c(-1,1),n,replace=TRUE)
walk <- cumsum(c(0,coinflips)) %% nvertices # modulo number of edges
theta <- seq(0,2*pi,.01)
for (k in 1:n) {
  plot(cos(theta),sin(theta),type="l",ylim=c(-1.2,1.2),
       asp=1,col="blue",xlab="",ylab="",main=paste("Time step",k))
  points(cos(walk[k]*2*pi/nvertices),sin(walk[k]*2*pi/nvertices),
         col="red",pch=19)
  Sys.sleep(0.1)
}

# Markov chain analysis of random walk on circle
nvertices <- 8
P <- matrix(0,nvertices,nvertices)
P[1,c(2,nvertices)] <- 1/2
P[nvertices,c(1,nvertices-1)] <- 1/2
for (k in 2:nvertices-1)  P[k,c(k-1,k+1)]=1/2
P
P %^% 50 # not aperiodic
P %^% 51
P %^% 52
r <- eigen(t(P))
V <- r$vectors
lambda <- r$values
round(lambda,8)
pibar <- V[,1]/sum(V[,1])
pibar # over long run, equally likely to visit any point on circle

# sample distribution biased toward initial position 
# until have run many steps
n<-10
coinflips <- sample(c(-1,1),n,replace=TRUE)
walk <- (cumsum(c(0,coinflips)) %% nvertices)+1
hist(walk,0.5:(nvertices+0.5),freq=FALSE,xlab="State",
     xlim=c(0.5,nvertices+.5))

n<-100
coinflips <- sample(c(-1,1),n,replace=TRUE)
walk <- (cumsum(c(0,coinflips)) %% nvertices)+1
hist(walk,0.5:(nvertices+0.5),freq=FALSE,xlab="State",
     xlim=c(0.5,nvertices+.5))

n<-100000
coinflips <- sample(c(-1,1),n,replace=TRUE)
walk <- (cumsum(c(0,coinflips)) %% nvertices)+1
hist(walk,0.5:(nvertices+0.5),freq=FALSE,xlab="State",
     xlim=c(0.5,nvertices+.5))

# expected value for time to hit all points on circle
# is N(N-1)/2
nvertices <- 30
nvertices*(nvertices-1)/2

# Calculate prob of going around circle in <=500 nsteps
# Double length (for going forward or backward around circle)
# and add absorbing boundaries
nvertices <- 30
P <- matrix(0,2*nvertices+1,2*nvertices+1)
P[1,1] <- 1
P[2*nvertices+1,2*nvertices+1] <- 1
for (k in 2:(2*nvertices))  P[k,c(k-1,k+1)]=1/2
L <- P %^% 500
# middle state (nvertices+1) is starting position
L[nvertices+1,1]+L[nvertices+1,2*nvertices+1] 
