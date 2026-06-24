# Suponha que, respectivamente, 8 e 7 nadadores das equipes 𝑩𝒓𝒂𝒔𝒊𝒍 e 𝑰𝒕á𝒍𝒊𝒂 sejam destros e que: (2,0 pontos)
#  • A equipe 𝑩𝒓𝒂𝒔𝒊𝒍 possui 10 nadadores;
#  • A equipe 𝑰𝒕á𝒍𝒊𝒂 possui 10 nadadores.
# Se 7 nadadores, sendo 3 da equipe 𝑩𝒓𝒂𝒔𝒊𝒍 e 4 da equipe 𝑰𝒕á𝒍𝒊𝒂, forem selecionadas ao acaso, qual é a probabilidade
# de que pelo menos um não seja destro? Resolva:

#a) Utilizando funções disponibilizadas pelo R.
# Probabilidades Brasil e Itália
p_brasil <- dhyper(3, 8, 2, 3)   # 3 destros dentre 3 escolhidos
p_italia <- dhyper(4, 7, 3, 4)   # 4 destros dentre 4 escolhidos

# Probabilidade de todos destros
p_todos_destros <- p_brasil * p_italia

# Probabilidade de pelo menos um não destro
p_pelo_menos_um_canhoto <- 1 - p_todos_destros

print("A probabilidade de pelo menos um não ser destro é de:")
p_pelo_menos_um_canhoto

#b) Utilizando simulação.
set.seed(123)
N <- 1e6  # número de simulações

# Brasil: 8 destros, 2 canhotos
brasil <- c(rep(1, 8), rep(0, 2))

# Itália: 7 destros, 3 canhotos
italia <- c(rep(1, 7), rep(0, 3))

cont <- 0

for (i in 1:N) {

  amostra_brasil <- sample(brasil, 3, replace = FALSE)
  amostra_italia <- sample(italia, 4, replace = FALSE)

  grupo <- c(amostra_brasil, amostra_italia)

  if (any(grupo == 0)) {  # algum canhoto?
    cont <- cont + 1
  }
}

prob_simulada <- cont / N
prob_simulada