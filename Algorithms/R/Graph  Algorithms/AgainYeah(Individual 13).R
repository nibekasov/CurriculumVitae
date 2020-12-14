edges <- c(0, 2, 2, 0, 0, 1,
           2, 0, 0, 0, 0, 0,
           2, 0, 0, 1, 0, 1,
           0, 0, 1, 0, 0, 1,
           0, 1, 0, 0, 0, 4,
           0, 0, 0, 1, 4, 0)
adjmatr <-  matrix(edges, nrow = 6, byrow = T) 


adj_l <- list()
n <- dim(adjmatr)[1]
for(i in 1:n ){#задание листа со списком смжных вершин 
    
    l <- adjmatr[i,]
    t <- which(l == 1)
    adj_l[[i]] <- t
}


DFS_COMP <- function(adj_l){
    dfs <- function(sv){
        visited[sv] <<- 1
        for (i in adj_l[[sv]]){
            if(visited[i] == 0){
                dfs(i)
            }
        }
    }
    com <- list()
    visited <<- numeric(n)
    k <- 0
    for(j in 1:n){
        if(visited[j] == 0){
            dfs(j)
            k <- k + 1
            z <- which(visited == 1)
            visited[z] <<- -1
            com[[k]] <- z
            
        }
    }
    return(com)
}

cong <- function(coc = DFS_COMP(adj_l)){#connected graph or not(exluding single vertexes)
    k <- 0
    for( i in length(coc)){
        if(length(coc[[i]]) > 1){
            k <- k + 1
        }
        
    }
    if(k!=1){
        return(FALSE)
    }else{
        return(TRUE)
    }
}

HaveFun <- function(adjmatr,vertexS=1,or = FALSE){
    #1
    for(i in 1:n){#убираем петли 
        adjmatr[i,i]<-0
    }
    #2
    for(i in 1:n){
        if(all(adjmatr[i,]==0) && all(adjmatr[,i]==0)){
            adjmatr <- adjmatr[-i,] 
            adjmatr <- adjmatr[,-i]
            n <- dim(adjmatr)[1]
            # n <- n -1
        }
    }
    
    if(!or){
        #3(поиск в глубину опредленеие связности)
        if (cong()){
            coherent <- TRUE
        }else{
            coherant <- FALSE
        }
        
        
        #4
        smt <- 0
        for(i in 1:n){
            a <- adjmatr[i,]
            if((sum(a[a==1]) %% 2) == 1 ){
                smt <- smt + 1
            }
        }
        if(smt!=0 || smt!=2){
            return(FALSE)
        }else if(coherant){
            return(TRUE)
            #если smt == 0, то эйлеров цикл иначе только эйлеров путь
        }else{
            return(FALSE)
        }
        
        
    }else{
        #3
        
        #4
        smtI <- 0
        smtO <- 0
        for( i in 1:n){
            ao <- adjmatr[i,]
            ai <- adjmatr[,i]
            if((sum(ai[ai==1])) == (sum(ao[ao==1])+1 )){
                smtI <- smtI + 1
            }else if((sum(ai[ai==1])) == (sum(ao[ao==1])-1 )){
                smtO <- smtO + 1
            }
            
        }
        if(smtI == 0 && smtO == 0){
            #существует эйлеров цикл
            return(TRUE)
        }else if(smtI == 1 && smtO == 1){
            #существует эйлеров путь
            return(TRUE)
        }else{
            return(FALSE)
        }
        
    }
    
}