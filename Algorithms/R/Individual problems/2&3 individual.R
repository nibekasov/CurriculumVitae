stonevec <- c(9,8,8,2)

reshatel <- function(stonevec,number_of_problem = 2 ){
    if (number_of_problem == 2){
        k <- 2
    }else if (number_of_problem == 3){
        k <- 1.5
        #return(stonevec * k)
    }else{
        cat("This script is only for solution of third and second problems")
    }
    stonevecAvalanche <- stonevec[which.max(stonevec)] 
    stonevec[which.max(stonevec)] <- 0
    stonevecToss <- c()
    while(length(stonevecAvalanche) + length(stonevecToss) != length(stonevec)){
        if (sum(stonevecAvalanche) > sum(stonevecToss)){
            stonevecToss <- c(stonevecToss,stonevec[which.max(stonevec)])
            stonevec[which.max(stonevec)] <- 0
        }else{
            stonevecAvalanche <- c(stonevecAvalanche,stonevec[which.max(stonevec)])
            stonevec[which.max(stonevec)] <- 0
        }
    }
    if (sum(stonevecAvalanche > sum(stonevecToss))){
        if(sum(stonevecAvalanche) < k * sum(stonevecToss)){
            stonevecTiny <- stonevecAvalanche
            stonevecTiny <- c(stonevecTiny,stonevecToss)
            otvet <- matrix(stonevecTiny,nrow = 2,byrow = TRUE)
            cat("Первая кучка:",otvet[1,],"\n")
            cat("Вторая кучка:",otvet[2,],"\n")
            #return(otvet)
        }else{
            return(FALSE)
        }
    }else  if (sum(stonevecAvalanche < sum(stonevecToss))){
        if(sum(stonevecAvalanche) * k > sum(stonevecToss)){
            stonevecTiny <- stonevecAvalanche
            stonevecTiny <- c(stonevecTiny,stonevecToss)
            otvet <- matrix(stonevecTiny,nrow = 2,byrow = TRUE)
            cat("Первая кучка:",otvet[1,],"\n")
            cat("Вторая кучка:",otvet[2,],"\n")
            #return(otvet)
        }else{
            return(FALSE)
        }
        
    }else{
        stonevecTiny <- stonevecAvalanche
        stonevecTiny <- c(stonevecTiny,stonevecToss)
        otvet <- matrix(stonevecTiny,nrow = 2,byrow = TRUE)
        cat("Первая кучка:",otvet[1,],"\n")
        cat("Вторая кучка:",otvet[2,],"\n")
        #return(otvet)
    }
}


reshatel(stonevec,3)
reshatel(stonevec,2)
