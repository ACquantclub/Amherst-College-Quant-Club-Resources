# powerlaw.R
# Example 5.2
# Simulate power law simulation
 
trials <- 1000000
simlist <- numeric(trials)
simlist[1] <- 2
for (i in 2:trials)
  {  	if (simlist[i-1] ==1) {
  		p <- (1/2)^(5/2)
  		new <- sample(c(1,2),1,prob=c(1-p,p))
  		simlist[i] <- new
  		} else { leftright <- sample(c(-1,1),1)
  			if  (leftright == -1)  { simlist[i] <- simlist[i-1] - 1} else {
  			    p <- (simlist[i-1]/(simlist[i-1]+1))^(3/2)
  			   simlist[i] <- sample(c(simlist[i-1],1+simlist[i-1]),1,prob=c(1-p,p))
  			} } } 
dat <- simlist[1000:trials]  # discard first 1000
tab <- table(dat)/length(dat)	
tab[1:9]