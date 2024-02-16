# gamblersruin.R
# Example 1.11

# gamble(k, n, p)
  #   k: Gambler's initial state
  #   n: Gambler plays until either $n or Ruin
  #   p: Probability of winning $1 at each play
  #   Function returns 1 if gambler is eventually ruined
  #                    returns 0 if gambler eventually wins $n
  
gamble <- function(k,n,p) {
	stake <- k
	while (stake > 0 & stake < n) {
		bet <- sample(c(-1,1),1,prob=c(1-p,p))
		stake <- stake + bet
	}
	if (stake == 0) return(1) else return(0)
	}   

k <- 10 
n <-  40  
p <- 1/2  
trials <- 1000
simlist <- replicate(trials, gamble(k, n, p))
mean(simlist) # Estimate of probability that gambler is ruined
# For p = 0.5, exact probability is (n-k)/n 
