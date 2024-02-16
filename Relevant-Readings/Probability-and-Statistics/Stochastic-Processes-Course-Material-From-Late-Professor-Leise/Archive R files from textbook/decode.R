# decode.R
# Example 5.3
# cryptography example

message <- "coincidences in general are great stumbling blocks in the way of that class of thinkers who have been educated to know nothing of the theory of probabilities that theory to which the most glorious objects of human research are indebted for the most glorious of illustrations edgar allen poe the murders in the rue morgue morpheus this is your last chance after this there is no turning back you take the blue pill the story ends you wake up in your bed and believe whatever you want to believe you take the red pill you stay in wonderland and i show you how deep the rabbit hole goes"

mat <- read.table("AustenCount.txt",header=F)
logmat <- log(mat + 1)

# Computes the score of the decoded message using the given code
score <- function(code)
{  
	p <- 0
	# For each pair of letters in the decoded message
	# query the transition matrix for the probability of that pair
	for (i in 1:(nchar(message)-1)){
		p <- p + logmat[charIndex(substr(code, i, i)),charIndex(substr(code, i+1, i+1))]
	}
	# return the sum of these probabilities
	p
}

# ascii(char) returns the numerical ascii value for char
ascii <- function(char)
{ 
	strtoi(charToRaw(char),16L) #get 'raw' ascii value
} 

# charIndex takes in a character and returns its 'char value'
# defined as a=1, b=2, ..., z=26, space=27
# this matches the array created by read.table
charIndex <- function(char)
{
	aValue <- ascii(char)
	if (aValue == 32)
	{
		# return 27 if a space
		27
	} else
	{
		#ascii sets "a" as 97, so subtract 96
		aValue - 96 
	}
}

# Decrypts code according to curFunc	
decrypt <- function(code,curFunc)
{  	
	out <- code
	# for each character in the message, decode it according to the curFunc
	for (i in 1:nchar(message))
	{
		charInd <- charIndex(substr(code,i,i))
		if (charInd < 27)
		{
			# change the ith character to the character determined by the curFunc
			substr(out,i,i) <- rawToChar(as.raw(curFunc[charInd] + 96))
		}
	}
	out 
}
# codemess holds the scrambled message
codemess <- decrypt(message,sample(1:26))

# instantiate a map to hold previously computed codes' scores
map <- new.env(hash=T, parent=emptyenv())

# we begin with a basic (a->a, z->z) function for decrypting the codemess
curFunc <- 1:27
# calculate the score for curFunc and store it in the map
oldScore <- score(decrypt(codemess,curFunc))
map[[paste(curFunc, collapse='')]] <- oldScore

# run 7000 iterations of the Metropolis-Hastings algorithm
for (iteration in 1:29000) {
	# sample two letters to swap
	swaps <- sample(1:26,2)
	oldFunc <- curFunc
	
	# let curFunc be oldFunc but with two letters swapped
	curFunc[swaps[1]] <- oldFunc[swaps[2]]
	curFunc[swaps[2]] <- oldFunc[swaps[1]]
	
	# if we have already scored this decoding,
	# retrieve score from our map
	if (exists(paste(curFunc, collapse =''), map)){
		newScore <- map[[paste(curFunc, collapse ='')]]
	} else
	# if we have not already scored this decoding,
	# calculate it and store it in the map
	{
		newScore <- score (decrypt(codemess,curFunc))
		map[[paste(curFunc, collapse = '')]] <- newScore
	}
	
	# decide whether to accept curFunc or to revert to oldFunc
	if (runif(1) > exp(newScore-oldScore))
	{
		curFunc <- oldFunc
	} else 
	{
		oldScore <- newScore
	}
	
	# print out our decryption every 100 iterations
	if ((iteration %%  100) == 0)
	{
		print(c(iteration,decrypt(codemess,curFunc)))
	}
}
