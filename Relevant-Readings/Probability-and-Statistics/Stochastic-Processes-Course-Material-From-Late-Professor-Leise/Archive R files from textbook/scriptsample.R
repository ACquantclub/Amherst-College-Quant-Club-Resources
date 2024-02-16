# scriptsample.R
# Appendix A -- Getting started with R

### Area of circle
radius <- 1:20
area <- pi*radius^2
plot(radius,area,main="Area as function of radius")

### Coin flips
n <- 1000 # number of coin flips
coinflips <- sample(0:1,n,replace=TRUE)
heads <- cumsum(coinflips)
prop <- heads/(1:n)  # cumulative proportion of heads
plot(1:n,prop,type="l",xlab="Number of coins",
  ylab="Running average",
  main = "Running proportion of heads in 1000 coin flips")
abline(h = 0.5)
