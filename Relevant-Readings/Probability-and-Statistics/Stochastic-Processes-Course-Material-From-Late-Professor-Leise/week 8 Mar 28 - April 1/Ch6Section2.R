# Poisson process simulations
lambda <- 2 # rate parameter
totalarrivals <- 1000

# independent exponentially distributed waiting (interarrival) times X_n
X <-rexp(totalarrivals,rate=lambda) # samples interarrival times from exponential distributon
hist(X,xlab="Interarrival time",
     freq=FALSE,breaks=50,main="Distribution of interarrival times") # plots density
t <- seq(0,10/lambda,length.out=50)
points(t,lambda*exp(-lambda*t),type="l") # plots original density function on top of histogram

# cumulative sum S_n=X_1+...X_n
S <- cumsum(X)
plot(S,xlab="Customer n",ylab="Arrival time S_n") # slope will be 1/lambda

# plot number of customers over time
N <- cumsum(c(0,rep(1,totalarrivals))) 
plot(stepfun(S,N),do.points = F,
     xlab="Time t",ylab="# customers",
     main=paste("Customer #",totalarrivals,"arrived at t=",round(S[totalarrivals])),
     xlim=c(0,S[totalarrivals]))
