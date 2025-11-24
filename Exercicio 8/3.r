# A probabilidade de uma regulagem bem sucedida na montagem de um determinado tipo de freio de carros de
# corrida é de 𝟎. 𝟖𝟓. Assumindo que as tentativas são independentes, responda qual é a probabilidade de que a primeira
# regulagem bem sucedida requeira:

#a) exatamente quatro tentativas (use funções prontas do R)?
print("A probabilidade de sucesso em exatamente 4 tentativas é de: ")
dgeom(4 - 1, 0.85)

#b) no máximo quatro tentativas (use funções prontas do R)?
print("A probabilidade de sucesso em máximo 4 tentativas é de: ")
pgeom(4 - 1, 0.85)

#c) ao menos quatro tentativas (use simulação)?
set.seed(123)

N <- 1e6
p <- 0.85

# X = número de falhas antes do primeiro sucesso
X <- rgeom(N, prob = p)

# queremos P(X >= 3)
prob_sim <- mean(X >= 3)
print("A probabilidade de sucesso em ao menos 4 tentativas é de: ")
prob_sim