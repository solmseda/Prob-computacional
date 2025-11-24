par(mfrow = c(1, 2))
x <- 0:12
fx <- dpois(x, 3)
plot(main = "Distribuição",
     x,
     fx,
     type = "h",
     xlab = "X",
     ylab = "f(x)",
     ylim = c(0, 0.25),
     lwd=4
)
axis(1, at=x, labels = x)
#axis(2, labels = x )
abline(v=seq(1,12), lty=3,lwd = 1)
grid(nx = NULL, ny = NULL, lty = 3, lwd = 1, col = "gray")
text(x, fx, round(fx, 2), cex = 1.2, pos = 3)

Fx <- ppois(x, 3)
plot(main = "Poisson (taxa = 3 / Km)",
     x,
     Fx,
     type = "s",
     xlab = "X",
     ylab = "F(x)",
     ylim = c(0, 1.2)     
)
abline(v=seq(1,12), lty=3,lwd = 1)
grid(nx = NULL, ny = NULL, lty = 3, lwd = 1, col = "gray")
par(mfrow = c(1, 1))