install.packages(igraph)
library(igraph)

edges <- c(0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0)
adjmatr <-  matrix(edges, nrow = 6, byrow = T) 


Lee_algorithm <-function(adjmatr,sVertex = 1,eVertex = n){
    
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
                    vek[j] <- vek[i]+adjmatr[i,j]
                }else if(vek[i]+adjmatr[i,j] <=  vek[j]){
                    vek[j] <- vek[i]+adjmatr[i,j]
                    
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
                if(vek[j]-adjmatr[i,j]==vek[i]){
                    otv <- c(i,otv)
                    j <- i
                }
        }
    }
    cat("Кратчайший путь от",sVertex,"до",eVertex,"равен",vek[eVertex],"и может быть представлен таким образом:",otv,"\n")
    print(vek)
} 

(adjmatr)
Lee_algorithm(adjmatr)
Lee_algorithm(adjmatr,sVertex = 1,eVertex = 5)



