# returntime.R
# Example 3.17
# Expected return time

P <- matrix(c(0,1,0,1/2,0,1/2,1/3,1/3,1/3),nrow=3,byrow=TRUE)
states <- c("a","b","c")
colnames(P) <- states
rownames(P) <- states
init <- c(1,0,0)
markov(init,P,25,states)

trials <- 10000
simlist <- numeric(trials)
for (i in 1:trials) {
	path <- markov(init,P,25,states)
	  # find index of 2nd occurrence of "a"
	  # subtract 1 to account for time 0
	returntime <- which(path == "a")[2] - 1
	simlist[i] <- returntime
}
# expected return time to state "a"
mean(simlist)