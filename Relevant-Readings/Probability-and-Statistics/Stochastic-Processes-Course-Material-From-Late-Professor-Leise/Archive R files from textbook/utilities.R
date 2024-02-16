##### Matrix powers ###############################
# matrixpower(mat,k) mat^k
#
matrixpower <- function(mat,k) {
	if (k == 0) return (diag(dim(mat)[1])) 
	if (k == 1) return(mat)
	if (k > 1) return( mat %*% matrixpower(mat, k-1))
 }

###### Simulate discrete-time Markov chain ########################
# Simulates n steps of a Markov chain 
# markov(init,mat,n,states)
# Generates X0, ..., Xn for a Markov chain with initiial
#  distribution init and transition matrix mat
# Labels can be a character vector of states; default is 1, .... k

markov <- function(init,mat,n,labels) { 
	if (missing(labels)) labels <- 1:length(init)
simlist <- numeric(n+1)
states <- 1:length(init)
simlist[1] <- sample(states,1,prob=init)
for (i in 2:(n+1)) 
	{ simlist[i] <- sample(states,1,prob=mat[simlist[i-1],]) }
labels[simlist]
}
####################################################

####################################################
######## Build the transition matrix for random walk on n-cycle
n <- 25
r1 <- c(0,1/2,rep(0,n-3),1/2)
tmat <- matrix(0,nrow=n,ncol=n)
tmat[1,] <- r1 
for (i in 1:(n-1)) tmat[26-i,] <- r1[1 + (i:(n+i-1)) %% n]

### Start the RW on vertex 1
init <- c(1,rep(0,n-1))

sim <- markov(init,tmat,100) # 100 steps
sim
table(sim)/101 # Proportion of visited sites in first 100 steps
sim2 <- markov(init,tmat,100000) #100,000 steps
table(sim2)/100001 # Proportion of visited sites in 100,000 steps
#####################################################

### Stationary distribution of discrete-time Markov chain
###  (uses eigenvectors)
###
stationary <- function(mat) {
x = eigen(t(mat))$vectors[,1]
as.double(x/sum(x))
}

## Example of stationary(mat)
mat <- matrix(c(3/4,1/4,0,1/8,2/3,5/24,0,1/6,5/6),nrow=3, byrow=T)
mat
lambda <- stationary(mat)
lambda
lambda %*% mat

#####################################################
### Standard Brownian motion
### bm(t,n) generates B_0, B_{t/n}, B_{2t/n}, . . . , B_{(n-1)t/n, B_t}
###
bm <- function(t,n) {
	cumsum(c(0,rnorm(n,0,sqrt(t/n))))
}
#### Example of BM plot on [0,15]
tscale <- seq(0,15,15/1000)
plot(tscale,bm(15,1000),type="l")

