nSamples <- 1000
set.seed(123)

lutadores <- c("A", "B", "C")
probVitoriaAB <- 0.6
probVitoriaBC <- 0.65
probVitoriaCA <- 0.55

vitoriasA <- 0
vitoriasB <- 0
vitoriasC <- 0


for (simulacao in 1:nSamples){
    escolhido <- sample(lutadores, 2, prob = c(0.6, 0.2, 0.2))
    if((escolhido[1] == "A" && escolhido[2] == "B") || (escolhido[1] == "B" && escolhido[2] == "A")){
        vencedor <- sample(c("A", "B"), 1, prob = c(probVitoriaAB, 1 - probVitoriaAB))

        # Vencedor A -> A luta com C
        if(vencedor == "A"){
            vencedor <- sample(c("A", "C"), 1, prob = c(1 - probVitoriaCA, probVitoriaCA))
            if(vencedor == "A"){
                vitoriasA <- vitoriasA + 1
            }
            else{
                vitoriasB <- vitoriasB + 1
            }
        }
        # Vencedor B -> B luta com C
        else{
            vencedor <- sample(c("C", "B"), 1, prob = c(1 - probVitoriaBC, probVitoriaBC))
            if(vencedor == "C"){
                vitoriasC <- vitoriasC + 1
            }
            else{
                vitoriasB <- vitoriasB + 1
            }
        }
    }
    else if ((escolhido[1] == "A" && escolhido[2] == "C") || (escolhido[1] == "C" && escolhido[2] == "A")){
        vencedor <- sample(c("A", "C"), 1, prob = c(1 - probVitoriaCA, probVitoriaCA))

        # Vencedor A -> A luta com B
        if(vencedor == "A"){
            vencedor <- sample(c("A", "B"), 1, prob = c(probVitoriaAB, 1 - probVitoriaAB))
            if(vencedor == "A"){
                vitoriasA <- vitoriasA + 1
            }
            else{
                vitoriasB <- vitoriasB + 1
            }
        }
        # Vencedor B -> B luta com C
        else{
            vencedor <- sample(c("B", "C"), 1, prob = c(probVitoriaBC, 1 - probVitoriaBC))
            if(vencedor == "C"){
                vitoriasC <- vitoriasC + 1
            }
            else{
                vitoriasB <- vitoriasB + 1
            }
        }
    }
    # Lutadores escolhidos B contra C
    else {
        vencedor <- sample(c("B", "C"), 1, prob = c(probVitoriaBC, 1 - probVitoriaBC))

        # Vencedor C -> C luta com A
        if(vencedor == "C"){
            vencedor <- sample(c("C", "A"), 1, prob = c(probVitoriaCA, 1 - probVitoriaCA))
            if(vencedor == "C"){
                vitoriasC <- vitoriasC + 1
            }
            else{
                vitoriasA <- vitoriasA + 1
            }
        }
        # Vencedor B -> B luta com A
        else{
            vencedor <- sample(c("B", "A"), 1, prob = c(1 - probVitoriaAB, probVitoriaAB))
            if(vencedor == "B"){
                vitoriasB <- vitoriasB + 1
            }
            else{
                vitoriasA <- vitoriasA + 1
            }
        }
    }
}

vitoriasA <- vitoriasA / nSamples
vitoriasB <- vitoriasB / nSamples
vitoriasC <- vitoriasC / nSamples

sprintf("A probabilidade de o ludator A ganhar é de : %.2f", vitoriasA)
sprintf("A probabilidade de o ludator B ganhar é de : %.2f", vitoriasB)
sprintf("A probabilidade de o ludator C ganhar é de : %.2f", vitoriasC)