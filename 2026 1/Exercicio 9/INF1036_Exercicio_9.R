######
# Q1)
######

# a.i)

dbinom(1, 10, 0.15)

# a.ii)

dbinom(0, 10, 0.15)

# a.iii)

# P(X<2)=P(X=0)+P(X=1)

pbinom(1, 10, 0.15)

# b)

set.seed(123)

N <- 100000

x <- rbinom(N, 10, 0.15)

mean(x == 1)
mean(x == 0)
mean(x < 2)

# c)

x <- 0:10

prob <- dbinom(x, 10, 0.15)

plot(
  x,
  prob,
  type = "h",
  lwd = 3,
  col = "blue",
  xlab = "Número de lâmpadas defeituosas",
  ylab = "Probabilidade",
  main = "Distribuição Binomial (n = 10, p = 0,15)"
)

# Use a binomial quando cada ensaio é independente e a probabilidade de sucesso p permanece constante
# entre os ensaios (por exemplo, testar lâmpadas de uma grande produção assumindo
# probabilidade fixa de defeito e amostras independentes).

# Use a hipergeométrica quando a amostragem é feita sem reposição a partir de uma população finita
# com um número fixo de sucessos — aí os ensaios são dependentes e a probabilidade
# muda conforme você retira itens.

# d.i)

# dhyper(x, m=5, n=15, k=3)
dhyper(2, 5, 15, 3)

# d.ii)
# P(X≥2)=P(X=2)+P(X=3)

sum(dhyper(2:3, 5, 15, 3))

# d.iii)
# P(X=0)

dhyper(0, 5, 15, 3)

######
# Q2)
######

# Temos uma taxa média de 30 mensagens por semana (7 dias). Logo, a taxa média diária é:
  
# λ = 30/7

# Se X representa o número de mensagens recebidas em um dia:
# X ∼ Poisson(30/7)

# O responsável não responde aos e-mails quando há mais de 3 mensagens:
# P(não responder) = P(X > 3)

lambda <- 30/7
pNaoResponderEmUmDia <- 1 - ppois(3, lambda)
print(pNaoResponderEmUmDia)

# a) Em cada um dos 5 dias o responsável não responda aos e-mails

# Assumindo independência entre os dias:
# P(não responder nos 5 dias) = [P(X>3)]^5

lambda <- 30/7

pNaoResponderEmUmDia <- 1 - ppois(3, lambda)

pNaoResponderTodos5 <- pNaoResponderEmUmDia^5

print(pNaoResponderTodos5)

# b) Em pelo menos um dos 5 dias o responsável não responda aos e-mails
# Calculando o complementar.
# P(responder em um dia) = P(X≤3)
# P(responder em todos os 5 dias) = P(X≤3)^5
# P(pelo menos um dia sem responder) = 1 − P(responder em todos os 5 dias) = 1 − [P(X≤3)]^5

lambda <- 30/7

pResponderEmUmDia <- ppois(3, lambda)
pResponderEmTodos5 <- pResponderEmUmDia^5

pPeloMenosUmDiaSemResponder <- 1 - pResponderEmTodos5

print(pPeloMenosUmDiaSemResponder)








