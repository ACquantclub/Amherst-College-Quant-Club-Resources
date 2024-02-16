update <- function(state,u) {  # update function
	z <- state
	if (state==1 & u > 0.5) z <- 2 else { 
		if (state == n & u < 0.5) z <- n-1 else {
			if (state > 1 & state < n & u < 0.5) z <- state - 1 else {
				if (state > 1 & state < n) z <- state + 1 }
			}  }  
			return(z)  }

trials <- 10  # generate 10 samples
n <- 100
simlist <- numeric(trials)
for (g in 1:trials) {
coalesce <- 0
s <- 1
u <- runif(1)
bottom <- 1
top <- n
while (coalesce == 0) {
s = s*2
# print(c(s,bottom,top))
u <- c(runif(s/2),u)
for (a in 1:length(u)) {
	bottom <- update(bottom,u[a])
	top <- update(top,u[a])
}
if (bottom==top)  coalesce <- 1
}
simlist[g] <- bottom
}
simlist