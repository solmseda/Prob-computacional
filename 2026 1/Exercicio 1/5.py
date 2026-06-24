import random

random.seed(123)

def mover(posicao, dimensao):
    direcoes = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    x = posicao
    y = posicao
    
    while True:
        dx  = random.choice(direcoes)
        dy = random.choice(direcoes)
        nx = x + dx
        ny = y + dy
        
        if (1 <= nx) and (nx <= dimensao) and (1 <= ny) and (ny <= dimensao):
            return (nx, ny)

def gerarPastilhas(pastilhas, dimensao):
    posicoes = set()
    while len(posicoes) < pastilhas:
         pos = (random.randint(1, dimensao), random.randint(1, dimensao))
         posicoes.add(pos)
    return posicoes

n=11
vitorias = 0
nSamples = 1000
pastilhas = 4

posInicialFantasmas = [(1, n), (n, 1), (n, 1), (n, n)]
posInicialPacman = (1, 1)

coletadas = set()

for _ in range(nSamples):
    pacmanPos = posInicialPacman
    fantasmas = posInicialFantasmas
    
    pastilhas = gerarPastilhas(pastilhas, n)
    
    while True:
        pacmanPos = mover(pacmanPos, n)
        fantasmasPos = fantasmas[:]
        
        if pacmanPos in pastilhas:
            coletadas.add(pacmanPos)
        
        if len(coletadas) == pastilhas:
            vitorias += 1
            break
        
        fantasmas = [mover(f, n) for f in fantasmas]
        
        if pacmanPos == fantasmasPos:
            break
        
pVitorias = vitorias / nSamples
print("A probabilidade do pacman vencer é de: {pVitorias:.4f}")