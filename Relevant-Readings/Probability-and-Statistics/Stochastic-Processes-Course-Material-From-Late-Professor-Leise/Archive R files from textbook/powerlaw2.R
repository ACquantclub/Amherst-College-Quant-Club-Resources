# powerlaw.R
# Example 5.2
# Simulate power law simulation
 
trials <- 1000000
simlist <- numeric(trials)
simlist[1] <- 2  # initial state
for (i in 2:trials)
  {  	if (simlist[i-1] ==1) { s12 <- sample(c(1,2),1)
  		  if (s12 == 1) {simlist[i] <- 1} 
  		  else {	acc <- 2^(-3/2)
  		  	if (runif(1) < acc) simlist[i] <- 2 else simlist[i] <- 1 }
  		  	}
  		  else { leftright <- sample(c(-1,1),1)
  			if (leftright == -1)  { simlist[i] <- simlist[i-1] - 1} 
  				else { acc <- (simlist[i-1]/(simlist[i-1]+1))^(3/2)
  			    if (runif(1) < acc)  simlist[i] <- simlist[i-1] + 1 
  			    	else simlist[i] <- simlist[i-1] } 
  			    	} } 
tab <- table(simlist)/trials
tab[1:9]