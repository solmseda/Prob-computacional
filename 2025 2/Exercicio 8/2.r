#a1
dbinom(3, 10, 0.1)

#a2
1 - pbinom(2, 10, 0.1)

#a3
pbinom(4, 10, 0.1)

#b
dbinom(0:10, 10, 0.1)

#c
nsamples <- 1000000
namostras <- 10
cont_defeituoso <- 0
nmouses_sem_defeito <- 0
nmouses_defeituosos <- rep(0, 10)

for (i in 1:nsamples){
    cont_defeituoso <- 0
    for(j in 1:namostras){
        mouse_selecionado_defeituoso <- sample(c(T, F), 1, prob = c(0.1, 0.9))
        if(mouse_selecionado_defeituoso){
            cont_defeituoso <- cont_defeituoso + 1
        }
    }
    if(cont_defeituoso > 0){
        nmouses_defeituosos[cont_defeituoso] <- nmouses_defeituosos[cont_defeituoso] + 1
    }
    else{
        nmouses_sem_defeito <- nmouses_sem_defeito + 1
    }
}

# c.1)
prob.tres.defeituoso <- nmouses_sem_defeito[3]/nsamples
print(prob.tres.defeituoso)

# c.2)
prob.mais.dois.defeituosos <- sum(nmouses_defeituosos[3:10])/nsamples # filtro no vetor
print(prob.mais.dois.defeituosos)

# c.3)
prob.maximo.quatro.defeituosos <- (nmouses_sem_defeito + sum(nmouses_defeituosos[1:4]))/nsamples
print(prob.maximo.quatro.defeituosos)

