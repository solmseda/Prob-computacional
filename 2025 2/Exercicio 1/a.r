lcg <- function(n, seed, a, c, M) {
  x <- numeric(n)
  x_prev <- seed
  for (k in 1:n) {
    x_k <- (a * x_prev + c) %% M
    x[k] <- x_k
    x_prev <- x_k
  }
  u <- x / M
  return(u)
}

    