#Не похожие "таблицы"
tableA <- c(1:10)
tableB <- c(1:15)
#Похожие "таблицы"
# tableA <- c(1:10)
# tableB <- c(1:10)
# tableC <- c(1:5)
# tableB <- c(tableC,tableB)

unique_function <- function(vek4){
    vek4 <- sort(vek4)#O(nlog(n))
    vecUnique <- c()
    vecUnique <- c(vecUnique,vek4[1])
    vecUnUnique <- c()
    vio <- 0
    for (i in 2:length(vek4)){#O(n - 1) = o(n)
        if (vek4[i] == vek4[i - 1]){
            
            if (vio > 0){
                if (vecUnUnique[length(vecUnUnique)] 
                    != vek4[i]){ vecUnUnique <- c(vecUnUnique,vek4[i]) }
                
                
                
            }else{
                vecUnUnique <- c(vecUnUnique,vek4[i])
                vio <- vio + 1
                
            }
            
            
            
            
        }else{
            
            vecUnique <- c(vecUnique,vek4[i])
            
        }
        
}
return(vecUnique)
}#O(nlog(n) + n) = O(n)

A <- unique_function(tableA)
B <- unique_function(tableB)
if (length(A) == length(B)){
    if(sum(A == B) == length(B)){
        cat("Все хорошо:
              Таблицы похожи")
    }else{
        cat("Все плохо:
              Таблицы не похожи")
    }
}else{
    cat("Все плохо:
              Таблицы не похожи")
}
    

