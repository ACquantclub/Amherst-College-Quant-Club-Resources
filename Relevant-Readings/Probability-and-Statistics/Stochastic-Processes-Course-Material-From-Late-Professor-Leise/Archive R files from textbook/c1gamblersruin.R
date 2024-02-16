# Gambler's ruin
set.seed(19)
final<-c()
par(mfrow=c(3,3))

for (i in 1:9) {
start <- 20
gain <- start
vec <- c(start)
i <- 0
while (0 < gain &&  gain < 60)
{ i <- i + 1
gain <- gain + sample(c(-1,1),1)
if (i == 200) twty <- gain
vec <- c(vec,gain)
}

time <- i
if (gain == 60) yes <- 1 else yes <- 0

  plot(0:i,vec,type="l",xlab="",ylab="Total Gain",yaxt="n",ylim=c(-5,65),
      xlim= c(0,1000))
  axis(2, at=c(0,20,40,60))
# abline(v = 200,lty=2)
abline(h = 0, lty=2)
abline(h=60, lty = 2)
final <- c(final,i)
}


## seeds: 6, 13, *19*