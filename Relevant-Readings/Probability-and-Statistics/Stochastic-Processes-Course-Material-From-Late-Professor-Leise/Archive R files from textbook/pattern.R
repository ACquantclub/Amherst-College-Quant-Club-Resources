# pattern.R
# Example 3.32
# expected number of flips to get HTHTH
# P(Heads) = 2/3, P(Tails) = 1/3

trials <- 100000
simlist <- numeric(trials)
for (i in 1:trials) {
pattern <- c(1,0,1,0,1) # 1: Heads, 0: Tails
state <- sample(c(0,1),5,prob=c(1/3,2/3),replace=T)
k <- 5
while (!prod(state==pattern))
 { flip <- sample(c(0,1),1,prob=c(1/3,2/3))
 	state <- c(tail(state,4),flip)
 	k <- k + 1
 	}
 	simlist[i] <- k
 	}
 mean(simlist)
 # exact expectation = 38.625