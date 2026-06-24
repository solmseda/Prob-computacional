# Exemplo) Uma urna possui 10 bolas sendo 3 com o número 1 e 7 com o número 2. Usando
# simulação, obtenha a probabilidade de se obter nenhuma, uma ou duas bolas número 1 em
# duas extrações sem reposição. Plote um gráfico com as probabilidades obtidas.

nsamples <- 1000
urna <- c(rep(1, 3), rep(2, 7))
probSelecao <- rep(0.1, 10)
totalBolas <- rep(0, 3)
for (i in 1:nsamples){
  bolas <- sample(urna, 2, replace = FALSE, prob = probSelecao)
  if ((bolas[1] == 1) & (bolas[2] == 1)) {
    totalBolas[3] = totalBolas[3] + 1
  } else if ((bolas[1] == 1) | (bolas[2] == 1)) {
    totalBolas[2] = totalBolas[2] + 1
  } else {
    totalBolas[1] = totalBolas[1] + 1
  }
}

sprintf("A probabilidade de obter nenhuma bola e %.2f.", totalBolas[1]/nsamples)
sprintf("A probabilidade de obter uma bola e %.2f.", totalBolas[2]/nsamples)
sprintf("A probabilidade de obter duas bolas e %.2f.", totalBolas[3]/nsamples)

q <- 0:5
p <- c(totalBolas[1]/nsamples, totalBolas[2]/nsamples, totalBolas[3]/nsamples, 0, 0, 0)
plot (q, p, main = "Gráfico", xlab = "Quantidade", ylab = "Probabilidade", type = "h")
points (0, totalBolas[1]/nsamples)
points (1, totalBolas[2]/nsamples)
points (2, totalBolas[3]/nsamples)
