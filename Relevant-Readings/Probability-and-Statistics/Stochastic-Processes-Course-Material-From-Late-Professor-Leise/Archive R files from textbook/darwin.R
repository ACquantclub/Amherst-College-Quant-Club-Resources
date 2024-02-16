# darwin.R
# Example 5.4
# Darwin's finches 
# For 1,000 iterations code takes a few minutes to run

dmat <- matrix(c(rep(1,17),rep(1,11),0,0,1,0,1,1,
rep(1,13),0,1,0,0,
rep(1,13),0,0,0,0,
1,0,rep(1,11),0,0,0,0,
rep(1,11),0,0,0,0,0,0,  1,1,1,1,1,0,1,1,0,0,0,0,0,1,0,1,1,1,1,1,1,1,1,0,1,1,1,1,0,0,0,0,0,0,rep(1,10),rep(0,7),1,1,1,1,0,1,1,rep(0,10),rep(0,13),1,1,0,0,1,1,rep(0,15),0,0,0,0,1,rep(0,12)),byrow=T,ncol=17)

# Is a 2x2 matrix swappable?
swappable <- function(sub)  {
    if ( ((sub[1,1]+sub[2,2] ==2) & (sub[2,1]+sub[1,2]==0)) |
   ((sub[1,1]+sub[2,2] ==0) & (sub[2,1] + sub[1,2]==2))) 1 else 0 }

# count checkerboards
checkercount <- function(mat) { ct <- 0
	for (i1 in 1:12) {
	 for (i2 in (i1+1):13) {
	   for (j1 in 1:16) {
	     for (j2 in (j1+1):17) {
	    			p <- swappable(mat[c(i1,i2),c(j1,j2)])
	    			ct <- ct + p }
	    			# if (p == 1) print(matrix(c(i1,i2,j1,j2),nrow=2,byrow=F)) }
	    		}}}
		ct }
	
trials <- 100
simlist <- numeric(trials)
state <- dmat
for (i in 1: trials) {
  sw <- 0
  new <- state
  while (sw <1) {
  	r <- sample(1:13,2,replace=F)
    c <- sample(1:17,2,replace=F)
    sub <- state[r,c]
    if (swappable(sub)) sw <- 1   }
    if (state[r[1],c[1]]==1)  new[r,c] <- c(0,1,1,0) else new[r,c] <- c(1,0,0,1)
    p <- checkercount(new)/checkercount(state)
    if (runif(1) < p) state <- new 
    simlist[i] <- checkercount(state)
    }
hist(simlist)
mean(simlist)
  