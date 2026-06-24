##### (1) Função LCG com os parâmetros do enunciado #####
lcg <- function(n, seed = 3, a = 39373, c = 0, M = 2^31 - 1) {
  x <- numeric(n)
  x_prev <- seed
  for (k in 1:n) {
    x_k <- (a * x_prev + c) %% M
    x[k] <- x_k
    x_prev <- x_k
  }
  # Normaliza para [0,1)
  u <- x / M
  return(u)
}

##### (2) Função utilitária: mapear [0,1) -> [L, U] #####
map_range <- function(u, L, U) L + (U - L) * u

##### (3) Parte (a): 10 personagens usando LCG #####
n_personagens <- 10

# Gera 30 uniformes com LCG e organiza 10x3 (S, A, I)
U_lcg <- matrix(lcg(n_personagens * 3), nrow = n_personagens, ncol = 3, byrow = TRUE)

forca_lcg       <- round(map_range(U_lcg[, 1], 10, 20), 1)
agilidade_lcg   <- round(map_range(U_lcg[, 2],  5, 15), 1)
intelig_lcg     <- round(map_range(U_lcg[, 3],  8, 18), 1)

personagens_lcg <- data.frame(
  Personagem   = 1:n_personagens
,
  Forca        = forca_lcg,
  Agilidade    = agilidade_lcg,
  Inteligencia = intelig_lcg
)

cat("\n=== (a) Atributos com LCG ===\n")
print(personagens_lcg, row.names = FALSE)

# Checagem rápida de faixas
stopifnot(
  all(personagens_lcg$Forca       >= 10 & personagens_lcg$Forca       <= 20),
  all(personagens_lcg$Agilidade   >=  5 & personagens_lcg$Agilidade   <= 15),
  all(personagens_lcg$Inteligencia>=  8 & personagens_lcg$Inteligencia<= 18)
)

##### (4) Parte (b): 10 personagens usando o gerador padrão do R #####
set.seed(123)  # reprodutibilidade (pode trocar se quiser resultados diferentes)

U_r            <- matrix(runif(n_personagens * 3), nrow = n_personagens, ncol = 3, byrow = TRUE)
forca_r        <- round(map_range(U_r[, 1], 10, 20), 1)
agilidade_r    <- round(map_range(U_r[, 2],  5, 15), 1)
intelig_r      <- round(map_range(U_r[, 3],  8, 18), 1)

personagens_r  <- data.frame(
  Personagem   = 1:n_personagens
,
  Forca        = forca_r,
  Agilidade    = agilidade_r,
  Inteligencia = intelig_r
)

cat("\n=== (b) Atributos com runif() (R padrão) ===\n")
print(personagens_r, row.names = FALSE)

# Checagem rápida de faixas
stopifnot(
  all(personagens_r$Forca        >= 10 & personagens_r$Forca        <= 20),
  all(personagens_r$Agilidade    >=  5 & personagens_r$Agilidade    <= 15),
  all(personagens_r$Inteligencia >=  8 & personagens_r$Inteligencia <= 18)
)
