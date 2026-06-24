nsamples = 100
set.seed(123)

nVoos <- 20

compensacaoVoluntaria <- 1000
compensacaoForcada <- 2500
passageiros <- rep(c(0), 190)

quantVoluntarios <- 0
quantForcados <- 0

for (simulacao in 1:nsamples){
    for(voo in 1:nVoos){
        compareceram <- 0
        passageiros <- rep(0, 190)
        for(passageiro in 1:length(passageiros)){
            probCompareceu <- runif(1)
            if(probCompareceu > 0.9 && probCompareceu < 0.95){
                passageiros[passageiro] <- 1
                compareceram <- compareceram + 1
            }
            if(compareceram > 180){
                if(runif(1) < 0.25){
                    quantVoluntarios <- quantVoluntarios + 1    
                }
                else{
                    quantForcados <- quantForcados + 1
                }
            }
        }
    }
}

custoTotal <- quantForcados * compensacaoForcada + quantVoluntarios * compensacaoVoluntaria
sprintf("O custo total de overbooking e: %.2f", custoTotal)
