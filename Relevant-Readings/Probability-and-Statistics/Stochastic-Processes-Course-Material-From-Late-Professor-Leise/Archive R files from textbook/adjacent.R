# adjacent.R
# Section 5.1
# generate a random 0-1 sequence with no adjacent 1's
# count the number of 1's and take the average
# init:   initial sequence
# n:       number of steps to run the chain

adjacent <- function(init, n)
{ k <- length(init)
 tot <- 0  # total number of 1's
 new <-c(2, init,2)  # pad sequence at the ends
 for (i in 1:n) { 
 index <- 1 +sample(1:k,1)
 newbit <- 0 + !new[index]   # flip the bit
 if (newbit==0) {
 	new[index] <- 0
 	tot <- tot+sum(new)
 	next} else {
 		if (new[index-1]==1 | new[index+1] ==1) {
 			tot <-tot + sum(new)
 			next}
 		else {new[index] <- 1} 
 	tot <- tot + sum(new)} 
} 
tot/n- 4  }  # subtract both endpoints
m <- 100
init <- rep(0,m)  # Start at sequence of all 0's
adjacent(init,100000)
 