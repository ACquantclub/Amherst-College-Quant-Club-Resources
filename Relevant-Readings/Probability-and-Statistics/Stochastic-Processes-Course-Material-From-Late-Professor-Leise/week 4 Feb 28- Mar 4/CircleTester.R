nsteps <- 100
nvertices <- 20
p <- 0.99
coinflips <- sample(c(-1,1), nsteps, replace=TRUE, c(1-p,p))
walk <- cumsum(c(0,coinflips))
theta <- seq(from=0, to=2*pi, by=.01)
for (k in 1:nsteps) {
  plot(cos(theta), sin(theta), type="l", ylim=c(-1.2,1.2),
       asp=1, col="blue", xlab="", ylab="", main=paste("Time step",k))
  points(cos(walk[k]*2*pi/nvertices), sin(walk[k]*2*pi/nvertices), col="red", pch=19)
  Sys.sleep(0.1)
}