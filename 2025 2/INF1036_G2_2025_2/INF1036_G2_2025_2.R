#######################
# 1)
#######################

# chamadas por hora
lambda <- 30

# a) 0.05111534
probabilidadeA <- dpois(25, lambda)

# b) 0.9932621
# 10 minutos = 1/6 horas
lambda10minutos <- lambda * (1/6)
probabilidadeB <- 1 - dpois(0, lambda10minutos)

# c) Tempo médio entre chamadas em minutos 0.03333333 hrs ou 2 minutos
tempoMedio <- 1 / lambda

# d) 0.082085
# 5 minutos = 5/60 = 1/12 horas; 
probabilidadeD <- 1 - pexp(1/12, lambda)

# e) 0.1353353
t9 <- 9 / 60   # ajustando para horas
t5 <- 5 / 60   # ajustando para horas

# Cálculo da probabilidade condicional
# P(T > 9 | T > 5) = P(T > 9 inter T > 5) / P(T > 5) =  P(T > 9) / P(T > 5)
maior9 <- 1 - pexp(t9, lambda)
maior5  <- 1 - pexp(t5, lambda)

# Probabilidade condicional
probabilidadeE <- maior9 / maior5

# f)

# O gráfico da Distribuição Poisson modela o número de eventos em um intervalo de tempo fixo.
intervalo <- 0:60
distribuicaoPoisson <- dpois(intervalo, lambda)
barplot(height = distribuicaoPoisson,
        names.arg = intervalo,
        col = "mediumseagreen",
        border = "black",
        main = "Número de chegadas por hora - Distribuição Poisson",
        xlab = "Número de chegadas (k)",
        ylab = "P(X = k)")

# O gráfico da Distribuição Exponencial modela o tempo entre dois eventos consecutivos.
t <- seq(0, 1, length = 1000)  
ft <- lambda * exp(-lambda * t)
plot(t, ft, type = "l", col="blue",
     main = "Tempo entre chegadas - Distribuição Exponencial",
     xlab = "Tempo entre chegas (horas)",
     ylab = "Densidade de probabilidade")


#g) # 39

qpois(0.95, lambda = 30)

#######################
# 2)
#######################

# a) 0.7247573

p <- pnorm (60, 50, 15) - pnorm (20, 50, 15)
print(p) 

# b) 0.7475075

p <- 1 - pnorm (40, 50, 15)
print(p) 

# c) 19.04419

q <- 20 * (1 - pnorm (25, 50, 15))
print(q)

#######################
# 3)
#######################

# a)
 
# a.1) 0.00525913
p <- dbinom(5, size = 30, prob = 0.04)
print(p)

# a.2) 0.006319976
p <- 1 - pbinom(4, size = 30, prob = 0.04)
print(p)

# a.3) 0.9998522
p <- pbinom(6, size = 30, prob = 0.04)
print(p)

# b)
x <- 0:30
probabilidades <- dbinom(x, size = 30, prob = 0.04)
print(probabilidades) # 2.938576e-01 3.673221e-01 2.219237e-01 8.630368e-02 2.427291e-02 5.259130e-03

plot(x, probabilidades, type = "h", lwd = 2,
     main = "Distribuição Binomial (n = 30, p = 0.04)",
     xlab = "Número de mouses defeituosos",
     ylab = "Probabilidade")

# c)

set.seed(123) 

nsamples <- 100000

sim <- rbinom(nsamples, size = 30, prob = 0.04)

# a.1)
mean(sim == 5)

# a.2)
mean(sim > 4)

# a.3)
mean(sim <= 6)


#######################
# 4)
#######################

# a)

p <- 1 - pweibull (5000, 0.5, 8000)
print(p) # 0.4535864

# b)

p <- pweibull (5000, 0.5, 8000)
print(p) # 0.5464136

x <- 0:10000
curve (dweibull (x, 0.5, 8000), 0, 10000)

# c)
#slide 41 do material 7.


#######################
# 5)
#######################

# a)
# c é 0,5
# base x altura = área da região e deve valer 1
# (4 * c) / 2 = 1 => c = 1/2

fx <- function(x) {
  return(0.5*(1 - x/4))
}
integrate(fx,0,4) # 1,0

# b)
#F(x) = 0, x < 0
#F(x) = x/2 - x^2/16, 0 <= x <= 4
#F(x) = 1, x > 4

# c) 0.203125
integrate(fx,0.5, 1)

#ou
#F(1) - F(0.5)

# d) E(X) = 1.333333, Var(X) = 0.8888889
#E(X)
xfx <- function(x) {
  return(x*(0.5*(1 - x/4)))
}
ex <- integrate(xfx, 0, 4)
print(ex)

#Var(X)
# E(X^2)−(E(X))^2

x2fx <- function(x) {
  return((x^2)*(0.5*(1 - x/4)))
}
ex2 <- integrate(x2fx, 0, 4)

varx <- ex2$value - (ex$value)^2
print(varx)


