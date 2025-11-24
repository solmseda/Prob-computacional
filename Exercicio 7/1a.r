set.seed(123)  # só para os resultados serem reprodutíveis

N <- 1e6  # número de clientes

# 1) Simular plano de cada cliente (A ou B)
plano <- sample(c("A", "B"),
                    size = N,
                    replace = TRUE,
                    prob = c(0.6, 0.4))

# 2) Simular faixa etária condicional ao plano
faixa <- character(N)

# Clientes do plano A
idx_A <- plano == "A"
n_A   <- sum(idx_A)
faixa[idx_A] <- sample(c("<=30", ">30"),
                       size = n_A,
                       replace = TRUE,
                       prob = c(0.3, 0.7))

# Clientes do plano B
idx_B <- plano == "B"
n_B   <- sum(idx_B)
faixa[idx_B] <- sample(c("<=30", ">30"),
                       size = n_B,
                       replace = TRUE,
                       prob = c(0.5, 0.5))

# 3) Probabilidade de sinistro para cada combinação (plano, faixa)
prob_sinistro <- ifelse(plano == "A" & faixa == "<=30", 0.03,
                  ifelse(plano == "A" & faixa == ">30", 0.015,
                  ifelse(plano == "B" & faixa == "<=30", 0.06,
                                             0.04)))

# 4) Simular se houve sinistro (0 = não, 1 = sim)
sinistro <- rbinom(N, size = 1, prob = prob_sinistro) == 1

# ------------------ ESTIMATIVAS PEDIDAS ------------------

# (1) P(B | Sinistro)
P_B_dado_sinistro <- mean(plano[sinistro] == "B")

# (2) P(Até 30 anos | Sinistro)
P_ate30_dado_sinistro <- mean(faixa[sinistro] == "<=30")

# (3) P(B | Sinistro e até 30 anos)
cond <- sinistro & faixa == "<=30"
P_B_dado_sinistro_ate30 <- mean(plano[cond] == "B")

P_B_dado_sinistro
P_ate30_dado_sinistro
P_B_dado_sinistro_ate30