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
  for (i in 1:nchar(code))
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