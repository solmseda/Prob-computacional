set.seed(123)

N <- 1e6  # número de simulações

# Função que simula 1 duelo entre x e y
vencedor_duelo <- function(x, y) {
  # probabilidades definidas no enunciado
  if (x == "A" & y == "B") return(ifelse(runif(1) < 0.60, "A", "B"))
  if (x == "B" & y == "A") return(ifelse(runif(1) < 0.40, "B", "A"))

  if (x == "B" & y == "C") return(ifelse(runif(1) < 0.65, "B", "C"))
  if (x == "C" & y == "B") return(ifelse(runif(1) < 0.35, "C", "B"))

  if (x == "C" & y == "A") return(ifelse(runif(1) < 0.55, "C", "A"))
  if (x == "A" & y == "C") return(ifelse(runif(1) < 0.45, "A", "C"))
}

# Vetor para guardar vencedores
vencedores <- character(N)

for (i in 1:N) {

  # Escolher quem descansa
  descansando <- sample(c("A", "B", "C"),
                        size = 1,
                        prob = c(0.4, 0.3, 0.3))

  participantes <- setdiff(c("A", "B", "C"), descansando)
  x <- participantes[1]
  y <- participantes[2]

  # Primeiro duelo
  vencedor1 <- vencedor_duelo(x, y)

  # Segundo duelo (contra o descansado)
  finalista <- vencedor_duelo(vencedor1, descansando)

  vencedores[i] <- finalista
}

# Probabilidades estimadas
prob_A <- mean(vencedores == "A")
prob_B <- mean(vencedores == "B")
prob_C <- mean(vencedores == "C")

prob_A; prob_B; prob_C
