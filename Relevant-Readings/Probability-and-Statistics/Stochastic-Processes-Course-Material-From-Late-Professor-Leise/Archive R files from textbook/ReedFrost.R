# ReedFrost.R
# Exercise 1.25
# Simulate graphs in Figure 1.2

par(mfrow=c(2,2))
set.seed(12)
for (k in 1:4) {
z = 0.004
steps  <- 21
sus <- numeric(steps)
inf <- numeric(steps)
sus[1] <- 400
inf[1] <- 3

for (t in 1:(steps-1)) {
inf[t+1] <- rbinom(1,sus[t],1-(1-z)^inf[t])
sus[t+1] <- sus[t] - inf[t+1]
}
plot((0:(steps-1)),inf,type="o",yaxt="n",ylim=c(0,36),xlab="Time",ylab="Infected")
axis(2,at=c(0,10,20,30))
}
#seed: 12