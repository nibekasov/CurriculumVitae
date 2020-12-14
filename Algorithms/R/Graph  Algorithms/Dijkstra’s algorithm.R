install.packages(igraph)
library(igraph)

edges <- c(0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0)
adjmatr <-  matrix(edges, nrow = 6, byrow = T) 



#DA <- function(adjmatr,sVertex = 1,eVertex = n){
    
    for(i in 1:n){#убираем петли 
        adjmatr[i,i]<-0
    }
    
    n <- dim(adjmatr)[1]
    vek <- numeric(n)
    #is.na(vek) <- 1:n
    vek[vek>-1] <- Inf
    vek[sVertex] <- 0
    
    
    for (level in 2:(n-1){
        
    }
    
}

DA <-function(adjmatr,sVertex = 1,eVertex = n){
    
    for(i in 1:n){#убираем петли 
        adjmatr[i,i]<-0
    }
    
    n <- dim(adjmatr)[1]
    vek <- numeric(n)
    #is.na(vek) <- 1:n
    vek[vek>-1] <- Inf
    vek[sVertex] <- 0
    i <- sVertex
    scetchick <- 0
    while(scetchick!=n){
        scetchick<- scetchick +1
        if (i>n){
            i <- i - n
        }
        for(j in 1:n){
            if(adjmatr[i,j]!=0){
                if((vek[j])== Inf){
                    vek[j] <- vek[i]+1
                }else if(vek[i]+1 <=  vek[j]){
                    vek[j] <- vek[i]+1
                    
                }
            }
            
        }
        i <- i + 1
        
        
    }
    #поиск обратного пути 
    j <- eVertex
    otv <- c(j)
    while(j!=sVertex){
        for(i in 1:n){
            if(adjmatr[i,j]!=0)
                if(vek[j]-1==vek[i]){
                    otv <- c(i,otv)
                    j <- i
                }
        }
    }
    cat("Кратчайший путь от",sVertex,"до",eVertex,"равен",vek[eVertex],"и может быть представлен таким образом:",otv,"\n")
    print(vek)
} 

(adjmatr)
DA(adjmatr)
DA(adjmatr,sVertex = 1,eVertex = 5)
