option <- function(go,t,k,mu ,sig2) {
	beta  <- ( log(k/go) - mu*t)/sqrt(sig2)
	go*exp(t*(mu + sig2/2))*(1-pnorm((beta-sqrt(sig2)*t)/  sqrt(t))) - k*(1-pnorm(beta/sqrt(t)))
}
