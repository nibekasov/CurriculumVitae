#Hooke — Jeeves, Pattern search

funHJ <- function(x1,x2){
    return(x1^2+x2)
} 

HJ_PatternSearch <- function(x1,x2,h1,al=10,e= 10^-3){
    
    dimon <- 9
    myVec <- numeric(dimon)
    is.na(myVec) <- 1:dimon
    b <- matrix(myVec,nrow = 3,byrow = TRUE)#создание пустой матрицы
    
    mm <- funHJ(x1,x2)
    mi <- 2
    mj <- 2
    for(i in 1:3){
        for(j in 1:3){
            b[i,j] <- funHJ(x1+h1*(j-2),x2+h1*(2-i))
            if(b[i,j] < mm){
                mm <- b[i,j]
                mi <- i
                mj <- j
            }
            
        }
        x1 <- x1+h1*(mj-2)
        x2 <- x2+h1*(2-mi)
    }
    if(mi==2 && mj==2||h1 >e){
        h1 <- h1/al
        return(HJ_PatternSearch(x1,x2,h1))
        
    }else if(h1<=e){
        otv <- c(x1,x2,funHJ(x1,x2))
        return(otv)
        
    }else{
        return(HJ_PatternSearch(x1,x2,h1))
    }
}

HJ_PatternSearch(1,2,1)


# lt <- funHJ(x1-h1,x2)
# mt <- funHJ(x1,x2)
# rt <- funHJ(x1+h1,x2)
# if(lt > rt|| mt > rt){
#     rtu <- funHJ(x1+h1,x2+h1)
#     rtm <- funHJ(x1+h1,x2)
#     rtd <- funHJ(x1+h1,x2-h1)
#     
# }else if(rt > lt|| mt>lt){
#     ltu <- funHJ(x1-h1,x2+h1)
#     ltm <- funHJ(x1-h1,x2)
#     ltd <- funHJ(x1-h1,x2-h1)
#     
# }else{
#     mtu <- funHJ(x1,x2+h1)
#     mtm <- funHJ(x1,x2)
#     mtd <- funHJ(x1,x2-h1)
#     
# }
