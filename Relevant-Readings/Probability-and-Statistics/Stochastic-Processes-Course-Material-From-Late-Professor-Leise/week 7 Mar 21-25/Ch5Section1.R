# Binary seq with no adjacent 1s

nextgoodseq <- function(goodseq) {
  m <- length(goodseq)
  n <- sample(1:m, 1) # choose random component to flip
  nextgoodseq <- goodseq
  if(goodseq[n]==1) { nextgoodseq[n] <- 0 } else {
    nextgoodseq[n] <- 1
    checkseq <- nextgoodseq+c(nextgoodseq[2:m],0) # adjacent 1s will cause 2 in checkseq
    if(sum(checkseq==2)>0) nextgoodseq[n] <- 0 # if any adjacent 1s, flip back to 0
  }
  return(nextgoodseq)
}

m <- 4
init <- rep(0,m)  # Start at sequence of all 0's
init
goodseq <- nextgoodseq(init)
goodseq
for(i in 1:20) {
  goodseq <- nextgoodseq(goodseq)  # generate MC of good sequences
  print(goodseq)
}

# check that limiting prob does appear to be uniform
m <- 4
goodseq <- rep(0,m)  # Start at sequence of all 0's
nSamples <- 10000
goodseqcount <- matrix(0,1,2^m)
for(i in 1:nSamples) {
  goodseq <- nextgoodseq(goodseq)  # generate MC of good sequences
  index <- 1 + sum((2^(0:(m-1)))*goodseq) # for all binary seq
  goodseqcount[index] <- goodseqcount[index] + 1
}
# good sequences correspond to binary indices 1 2 3 5 6 9 10 11 for m=4 case
goodseqcount/nSamples
