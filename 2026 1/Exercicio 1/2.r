set.seed(123)

nSimulacoes <- 1000

vidaInicial <- 1.0
horas <- 720

probFalhaInesperada <- 0.002
custoFalhaInesperada <- 2000

totalSubistituicoes <- numeric(nSimulacoes)
totalCusto <- numeric(nSimulacoes)
totalFalhas <- numeric(nSimulacoes)

for (simulacao in 1:nSimulacoes){
    vida <- vidaInicial
    custo <- 0
    substituicao <- 0
    falha <- 0

    for (hora in 1:horas){
        if(runif(1) < probFalhaInesperada){
            vida <- 1.0
            falha <- falha + 1
            custo <- custo + custoFalhaInesperada
            substituicao <- substituicao + 1
        }
        else{
            prob <- runif(1)
            if(prob <= 0.1){
                vida <- vida - 0.07 
                if(vida <= 0){
                    custo <- custo + 700
                    vida <- 10
                    substituicao <- substituicao + 1
                }
            }
            else if (prob > 0.1 && prob <= 0.2){
                vida <- vida - 0.03
                if(vida <= 0){
                    custo <- custo + 500
                    vida <- 10
                    substituicao <- substituicao + 1
                }
            }
            else if(prob <= 0.7){
                vida <- vida - 0.01
                if(vida <= 0){
                    custo <- custo + 400
                    vida <- 10
                    substituicao <- substituicao + 1
                }
            }
        }
    }
    totalSubistituicoes[simulacao] = substituicao
    totalCusto[simulacao] = custo
    totalFalhas[simulacao] = falha
}

sprintf("A media de substituicoes 2: %.2f", mean(totalSubistituicoes))
sprintf("A media de custo e: %.2f", mean(totalCusto))
sprintf("A media de falhas aleatorias e : %.2f", mean(totalFalhas))