edges <- c(0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0)
adjmatr <<-  matrix(edges, nrow = 6, byrow = T) 

n <<- dim(adjmatr)[1]
id <<- 0
sccCount <<- 0
Stk <<- c()
dfs <- function(at){
    Stk <<- c(Stk,at)
    onStk[at] <- TRUE
    id <- id + 1
    ids[at] = low[at] = id
    
    to <- 0
    for(t in adjmatr[at,]){
        to <- to + 1
        if(t !=0 ){
            if(ids[to] == -1){
                dfs(to)
            }
            if(onStk[to]){
                low[at] <<- min(low[at],low[to])
            }
        }
        
    }
    
    if(ids[at] == low[at]){
        node <- c(Stk)#pushing all elements into node
        Stk <- c()#poping all elements from Stk
        for(i in 1:length(node)){
            onStk[i] = FALSE
            low[i] = ids[at]
        }
        sccCount  <- sccCount +1
    }
}


SCC <- function(adjmatr){
   
    
    ids <<- numeric(n)
    low <<- numeric(n)
    onStk <<- logical(n)
    
    for(i in 1:n){
        ids[i] <<- -1 #unvisited 
    }
    for(i in 1:n ){
        if(ids[i] == -1){
            dfs(i)
        }
    }
    return(low)
    
}
