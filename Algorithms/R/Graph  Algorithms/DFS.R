edges <- c(0, 1, 1, 0, 0, 1,
           1, 0, 0, 0, 0, 0,
           1, 0, 0, 1, 0, 1,
           0, 0, 1, 0, 0, 1,
           0, 1, 0, 0, 0, 1,
           0, 0, 0, 1, 1, 0)
adjmatr <-  matrix(edges, nrow = 6, byrow = T) 
n = dim(adjmatr)[1]

u_discovery <- numeric(n) 
u_finishng <- numeric(n) 
#u_color <- 
#u_ansector <- 


DFS <- function(adjmatr){
    for(i in 1:n){
        u_color[i] <- -1#white
        u_ansestor[i] <- NA
    }
    time <<- 0
    for(i in 1:n){
        if(u_color[i] == -1){
            DFS-visit(adjmatr,i)
        }
    }
    
}

DFS-visit(adjmatr,u){
    time <<- time +1 
    u_discovery[u] <- time
    u_color[u] <- 0#gray
    for( i in 1:n){#каждой v 
        if(u_color[i] == -1){#v
            u_ansector[i] <- i#v
            DFS-Visit(adjmatr,v)
        }
    }
    u_color[i] <- 1#black
    time <<- time + 1
    u_finishing[i] <- time
}

