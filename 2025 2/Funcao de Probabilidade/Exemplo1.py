# Exemplo) Uma urna possui 10 bolas sendo 3 com o número 1 e 7 com o número 2. Usando
# simulação, obtenha a probabilidade de se obter nenhuma, uma ou duas bolas número 1 em
# duas extrações sem reposição. Plote um gráfico com as probabilidades obtidas.
import random
import matplotlib.pyplot as plt


n_samples = 1000
urna = [1, 1, 1, 2, 2, 2, 2, 2, 2, 2]
prob_selecao = [0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1]
total_bolas = [0, 0, 0] # nenhuma, uma e duas bolas de numero 1 respectivamente
for i in range(0,1000):
    bolas = random.sample(urna, 2)
    if(bolas[0] == 1 and bolas[1] == 1):
        total_bolas[2] += 1
    elif(bolas[0] == 1 and bolas[1] == 2):
        total_bolas[1] += 1
    else:
        total_bolas[0] += 1
print("A probabilidade de não sair nenhuma bola 1 é de ", total_bolas[0]/n_samples)
print("A probabilidade de sair uma bola 1 é de ", total_bolas[1]/n_samples)
print("A probabilidade de sair duas bolas 1 é de ", total_bolas[2]/n_samples)

# Vetores equivalentes
q = list(range(6))  # 0 a 5
p = [
    total_bolas[0] / n_samples,
    total_bolas[1] / n_samples,
    total_bolas[2] / n_samples,
    0, 0, 0
]

# Plot do tipo 'h' (linhas verticais)
plt.stem(q, p, use_line_collection=True)

# Ajustes de título e eixos
plt.title("Gráfico")
plt.xlabel("Quantidade")
plt.ylabel("Probabilidade")

# Exibir o gráfico
plt.show()