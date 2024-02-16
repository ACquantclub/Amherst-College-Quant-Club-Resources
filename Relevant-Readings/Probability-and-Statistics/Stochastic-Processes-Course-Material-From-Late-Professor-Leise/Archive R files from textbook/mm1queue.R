# m/m/1 queue

lam <- 2
mu <- 3

sim <- function(tmax) {
	t <- 0
	hair <- 0
		sys <- 0
	while (t < tmax) {
		atime <- rexp(1,lam)
		stime <- rexp(1,mu)
		if (hair == 0) {  
			sys <- 1
			hair <- 1
			t <- t + atime} else {z <- min(atime, stime)
				t <- t + z
				if (z==atime) { sys <- sys + 1 } else {sys <- sys -1
					 	if (sys==0) hair <- 0} 
					 }
	}
	return(sys)
}
###
sim <- function(tmax) {
	t <- 0
	sys <- 0
	oldsys <- sys
	while (t < tmax) {
		oldsys <- sys
		# print(c(t,sys))
		atime <- rexp(1,lam)
		stime <- rexp(1,mu)
		if (sys == 0) {  
			sys <- 1
			t <- t + atime} else {z <- min(atime, stime)
				t <- t + z
				if (z==atime) { sys <- sys + 1 } else {sys <- sys -1}
					 } }
	return(oldsys)
}
