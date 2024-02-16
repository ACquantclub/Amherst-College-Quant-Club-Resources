# perfect.R
# perfect sampling

P = 
matrix(c(1/4,1/4,1/4,1/4,1/3,1/3,1/3,0,0,1/3,1/3,1/3,0,1,0,0),nrow=4,byrow=T)
# pre-process by taking cumulative sums
Q <- t(apply(P,1,cumsum))
k <- dim(P)[1]  # number of states
discrete <- function(states,u)	which(u < Q[states,]) [1]

# modified Markov simulation function
markov <- function(mat,n,u) { 
	out <- c(0,0,0,0)
	for (j  in 1:k) { 
		state <- discrete(j,u[1])
		for (i in 2:n)  state <- discrete(state,u[i]) 
		out[j] <- state}
	return(out)
}
trials <- 30000
simlist <- numeric(trials)
for (g in 1:trials) {
coalesce <- 0
s <- 1
u <- runif(1)
out <- numeric(k)
for (i in 1:k) out[i] <- discrete(i,u) 
while (coalesce == 0) {
s = s*2
u <- c(runif(s/2),u)
out <- markov(P,s,u)
if (length(unique(out))==1) coalesce <- 1
}
simlist[g] <- out[1]
}
# stationary distribution is (2/11,9/22,3/11,3/22)
table(simlist)/length(simlist)