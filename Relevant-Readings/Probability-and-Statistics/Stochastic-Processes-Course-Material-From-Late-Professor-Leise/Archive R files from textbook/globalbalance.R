# globalbalance.R
# Example 7.18
# Simulating the global balance equations

trials <- 100000
simin2 <- simout2 <- numeric(trials)
for (i in 1:trials) {
state <- sample(1:3,1, prob=c(5/19,6/19,8/19))
t <- 0  # time
in2  <- 0    # counter for transitions to 2
out2 <- 0  # counter for transtions from 2
while (t < 19) {
if (state == 1) {t <- t+rexp(1,1/5)
	if (t > 19) {break}
	state <- 2
	in2 <- in2 + 1 }
if (state == 3) {t <- t + rexp(1,1/4)
	if (t > 19) {break}
	state <- 2
	in2 <- in2 + 1}
if (state ==2) { r1 <- rexp(1, (1/2)*(1/3))
	   r3 <- rexp(1, (1/2)*(2/3))
	   if (r1 < r3) { t <- t + r1
	   	if (t > 19) {break}
	   	out2 <- out2 + 1
	   	state <- 1} else { t <-  t + r3
	   		if (t > 19) {break}
	   		out2 <- out2 + 1
	   		state <- 3}}
	}		
simin2[i] <- in2
simout2[i] <- out2}
mean(simin2)
mean(simout2)