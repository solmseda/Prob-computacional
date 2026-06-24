import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import poisson

lambda_per_minute = 4

k_values = np.arange(0, 20)
pmf_values = poisson.pmf(k_values, lambda_per_minute)
cdf_vals = poisson.cdf(k_values, lambda_per_minute)

plt.figure(figsize=(14, 6))

plt.subplot(1, 2, 1)
plt.bar(k_values, pmf_values, color='skyblue')
plt.title('Função de Probabilidade\nPacotes Perdidos em 1 Minuto (λ=4)')
plt.xlabel('Número de pacotes perdidos')
plt.ylabel('P(X = k)')
plt.grid(True, axis='y', linestyle='--', alpha=0.7)

plt.subplot(1, 2, 2)
plt.step(k_values, cdf_vals, where='mid', color='orange')
plt.title('Função Acumulada de Probabilidade (CDF)\nPacotes Perdidos em 5 Minutos (λ=15)')
plt.xlabel('Número de pacotes perdidos')
plt.ylabel('P(X ≤ k)')
plt.grid(True, axis='both', linestyle='--', alpha=0.7)

plt.tight_layout()
plt.show()