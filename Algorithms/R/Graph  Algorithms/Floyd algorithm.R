array1 = c(5,10,15)
array2 = c(15,20,25,30,35,40)

my.Array <- array(c(array1,array2),dim = c(3,3,2))
print(my.Array)

array1 = c(5,10,15,15,20,25,30,35,40)

my.Array <- array(c(array1),dim = c(3,3,2))

my.Array[1,1,1]




edges <- c(0, 1, 1, 0, 0, 1, 0, 0, 0,
           1, 0, 0, 0, 0, 0, 0, 0, 0,
           1, 0, 0, 1, 0, 1, 0, 0, 0,
           0, 0, 1, 0, 0, 1, 0, 0, 0,
           0, 1, 0, 0, 0, 1, 0, 0, 0,
           0, 0, 0, 1, 1, 0, 0, 0, 0,
           0, 0, 0, 0, 0, 0, 0, 1, 0,
           0, 0, 0, 0, 0, 0, 1, 0, 0,
           0, 0, 0, 0, 0, 0, 0, 0, 0)
adjmatr <- matrix(edges, nrow = 9, byrow = T)

edges <- numeric(16)
edges[edges == 0] <- Inf
edges[3] <- -2
edges[5] <- 4
edges[7] <- 3
edges[12] <- 2
edges[14] <- -1
edges[1] <- 0

for(i in 2:n){
    edges[i+4*(i-1)] <- 0
}


adjmatr <- matrix(edges, nrow = 4, byrow = T)



n <- dim(adjmatr)[1]

my.Array <- array(c(edges),dim = c(n,n,2))

for(k in 2:n){#первая уже заполнена
    layer <- (k %% 2) + 1#достаточно двух слоев, так как формула рассчитывается для текущей матрицы по предыдущей
    for(i in 1:n){
        for(j in 1:n){
            my.Array[i,j,layer] <- min(my.Array[i,j,(layer + (-1)^(1+layer))],
                                       my.Array[i,k,(layer + (-1)^(1+layer))] +  my.Array[k,j,(layer + (-1)^(1+layer))])#если был 2, станет 1, если 1, то 2# 1 + (-1)^2 = 2
        }
    }
}

print(my.Array[,,(k %% 2) + 1])

funx <- (my.Array)