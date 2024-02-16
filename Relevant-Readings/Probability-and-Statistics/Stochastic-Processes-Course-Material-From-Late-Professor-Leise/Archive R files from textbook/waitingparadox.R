# waitingparadox.R
# Section 6.8
# Waiting time paradox

mytime <- 50
lambda <- 1/10
trials <- 10000
simlist <- numeric(trials)
for (i in 1:trials) {
	N <- rpois(1,300*lambda)
	arrivals <- sort(runif(N,0,300))
	wait <- arrivals[arrivals > mytime][1] - mytime
	simlist[i] <- wait
}
mean(simlist)
