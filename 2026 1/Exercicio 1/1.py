def LCG(seed, a , c, M, nsamples):
    x = seed
    u =[]
    for i in range(nsamples):
        nx = (a * x + c) % M
        u.append(nx)
        x = nx
    return u
