# graduation.R
# Example 2.19
# Simulating graduation, drop-out rate

init <- c(0,1,0,0,0,0) # student starts as frosh
P <- matrix(c(1,0,0,0,0,0,0.06,0.03,0.91,0,0,0,0.06,0,0.03,0.91,0,0,0.04,
  0,0,0.03,0.93,0,0.04,0,0,0,0.03,0.93,0,0,0,0,0,1),nrow=6,byrow=T)
states <- c("Drop","Fr","So","Jr","Se","Grad")
rownames(P) <- states
colnames(P) <- states
P
markov(init,P,10,states)
sim <- replicate(10000,markov(init,P,10,states)[11])
table(sim)/10000
sim