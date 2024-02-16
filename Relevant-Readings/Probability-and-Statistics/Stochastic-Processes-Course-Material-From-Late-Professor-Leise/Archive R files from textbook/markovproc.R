
markproc <- function(ini,holding,emb,end)
{
time <- 0
state <- ini
outmat <- c(0,0,0)
while (time <= end) {
	old <- time
	time <- rexp(1,holding[state]) + time
		outmat <- rbind(outmat,c(old,state,min(end,time)))
	initial <- rep(0,length(holding))
	initial[state]<-1
	state <- markov(initial,emb,1)[2]
}
return(outmat[-1,])
}
markov <- function(init,p,n) { 
simlist <- numeric(n+1)
states <- 1:length(init)
simlist[1] <- sample(states,1,prob=init)
for (i in 2:(n+1)) 
	{ simlist[i] <- sample(states,1,prob=p[simlist[i-1],]) }
simlist
}


init <- 1
holding <-c(2,1,1)
embed <- matrix(c(0,1/2,1/2,1/4,0,3/4,1/4,3/4,0),byrow=T,nrow=3)
end <- 200
dat <- markproc(init,holding,embed,end)
time <- 0  
rate2 <- 0
rows <- dim(dat)[1]
for (j in 1:rows) {
	if (dat[j,2] != 1) next
		time <- time + dat[j,3]-dat[j,1]
		rate2 <- rate2 + 1 + sum(  (dat[,3] < (dat[j,3]+1)) & (dat[,3] >dat[j,3]))
	}
time/end
time/sum(dat[,2] == 1) # avg length of time
rate2/rows

#fromiouti/dat[10829,3]
init <- 1
holding <-c(2,1,1)
embed <- matrix(c(0,1/2,1/2,1/4,0,3/4,1/4,3/4,0),byrow=T,nrow=3)
end <- 100
dat <- markproc(init,holding,embed,end)
plot("", xlim=c(0,end), ylim=c(.9,3.1))

rows <- dim(dat)[1]
id1 <- (1:rows)[dat[,2]==1]
for (i in 1:length(id1)) {
	lines(dat[id1[i],c(1,3)],c(1,1))
}
id2 <- (1:rows)[dat[,2]==2]
for (i in 1:length(id2)) {
	lines(dat[id2[i],c(1,3)],c(2,2))
}
id3 <- (1:rows)[dat[,2]==3]
for (i in 1:length(id3)) {
	lines(dat[id3[i],c(1,3)],c(3,3))
}
