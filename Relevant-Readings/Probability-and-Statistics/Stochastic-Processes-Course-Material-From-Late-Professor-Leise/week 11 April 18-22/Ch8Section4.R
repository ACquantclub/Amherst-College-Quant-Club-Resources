# random walk approach
set.seed(24689)
duration <- 1  # total time
numsteps <- 100000
steps <- seq(0,1,1/numsteps)
deltax <- rnorm(n = numsteps, sd = sqrt(1/numsteps))
#deltax <- sample(c(-1,1),size=numsteps,replace=TRUE)/sqrt(numsteps)
x <- c(0, cumsum(deltax)) # compute cumulative sum
plot(steps, x, type = "l", ylim = c(-1.3, 1.3),main="Random walk")
abline(h=0, col="blue")

leftend<-0

# zoom in
plot(steps, x, type = "l", xlim=leftend+c(0,0.1),ylim=c(-.5,.5),main="Random walk")
abline(h=0, col="blue")

# zoom in more
plot(steps, x, type = "l", xlim=leftend+c(0,0.01),ylim=c(-.1,.1),main="Random walk")
abline(h=0, col="blue")

# zoom in even more
plot(steps, x, type = "l", xlim=leftend+c(0,0.001),ylim=c(-.01,.01),main="Random walk")
abline(h=0, col="blue")
