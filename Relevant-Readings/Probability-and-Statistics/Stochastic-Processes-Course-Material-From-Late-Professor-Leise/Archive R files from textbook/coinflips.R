# coinflips.R
# Example 8.9
# fluctuations in coin tossing

trials <- 10000
simlist <- numeric(trials)
t <- 0.95
for(i in 1:trials) {rw <- c(0,cumsum(sample(c(-1,1),10000, replace=T)))
  simlist[i] <- if  (0 == length(which(rw[(10000*t):10000]==0))) 1 else 0 }
  mean(simlist)

trials <- 10000
simlist <- numeric(trials)
for(i in 1:trials) {
   rw <- c(0,cumsum(sample(c(-1,1),(trials-1),replace=T)))
   simlist[i] <- tail(which(rw==0),1) 
   }
mean(simlist)
hist(simlist,xlab="",ylab="Counts",main="")

