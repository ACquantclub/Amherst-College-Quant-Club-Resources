# pizza.R
# Example 1.25
# Simulation of Bob's pizza probability

trials <- 10000
simlist <- numeric(trials)
toppings <- c("pepper","pepperoni","pineapple","prawns","proscuitto")
for (i in 1:trials) {
pineapple <- 0
pepperoni <- 0
while (pineapple == 0) {
   pick <- sample(toppings,1)
   if (pick == "pepperoni") pepperoni <- pepperoni + 1
   if (pick == "pineapple") pineapple <- 1
   }	
simlist[i] <- pepperoni
}
mean(simlist)