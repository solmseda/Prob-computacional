f <- function(x) {
    ifelse(x >= -1 & x < 0, -x, ifelse(x >= 0 & x <= 1, x, 0))
}

curve(f(x), from = -1.5, to = 1.5, xlab = "x", ylab= "f(x)", main = "Densidade f(x)")
abline(h = 0, col = "gray")
