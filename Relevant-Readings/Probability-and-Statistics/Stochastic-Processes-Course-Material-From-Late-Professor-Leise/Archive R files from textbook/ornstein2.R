# ornstein2.R
# Example 9.12
# simulation of Ornstein-Uhlenbeck with Euler-Maruyama method

mu <- -1
r <- 0.5
sigma <- 0.1
T <- 10
n <- 1000
xpath <- numeric(n+1)
xpath[1] <- 2  #initial vlaue
for (i in 1:n) {
	xpath[i+1] <- xpath[i] - r*(xpath[i]-mu)*T/n +
	  sigma*sqrt(T/n)*rnorm(1) }
plot(seq(0,T,T/n),xpath,type="l")

# For one outcome of X_T code simplifies
x <- -2
for (i in 1:n) {
	x <- x - r*(x-mu)*T/n + sigma*sqrt(T/n)*rnorm(1) }
x

# simulation of mean and standard deviation of X_10
x <- -2
trials <- 10000
simlist <- numeric(trials)
for (k in 1:trials) {
	for (i in 1:n) {
		x <- x-r*(x-mu)*T/n + sigma*sqrt(T/n)*rnorm(1) }
	simlist[k] <- x
	}
mean(simlist)
sd(simlist)
