# Psubordination.R
# Example 7.26
# Simulate CTMC with Poisson subordination
# Simulate distribution of X_1.5 given X_0 = 1

q <- matrix(c(-2,1,1,1,-3,2,0,1,-1),nrow=3,byrow=T)
colnames(q) <- 1:3
rownames(q) <- 1:3
q
lambda <- 3
r <- (1/lambda)*q+diag(3)
r
trials <- 100000
simlist <- numeric(trials)
for (i in 1:trials) {
	s <- 0  # time
	state <- 1
	newstate <- 1
	while(s < 1.5) {
		state <- newstate
		s <- s+rexp(1,lambda)
		newstate <- sample(1:3,1,prob=r[state,])
	}
	simlist[i] <- state
	}

table(simlist)/trials
round(expm(1.5*q),3)


