# generating function
a<-c(1/4,1/4,1/2) # probability of 0, 1, or 2 offspring
mu <- sum((0:(length(a)-1))*a) # expected value of number of offspring
G <- function(s) a[1]+a[2]*s+a[3]*s^2

# extinction probability e
polyroot(c(a[1],a[2]-1,a[3]))
