vmerge <- function(a,b){
    d <- c()
    
    if(a[length(a)] < b[1]){
        d <- c(d,a,b)
        return(d)
    }else if(a[1] > b[length(b)]){
        d <- c(d,b,a)
        return(d)
    }
    
    for(i in 1:(length(a) + length(b))){
        if(length(a) == 0 || length(b) == 0){
            d <- c(d,a,b)
            return(d)
        }else if (a[1] < b[1]){
            d <- c(d,a[1])
            a <- a[-1]
        }else{
            d <- c(d,b[1])
            b <- b[-1]
        }
    }
}

merge_sort <- function(vek){
    if (length(vek) == 3){
        podvek1 <- vek[1]
        podvek2 <- vek[2]
        podvek3 <- vek[3]
        podvek15 <- c()
        podvek15 <- vmerge(podvek1,podvek2)
        vek <- vmerge(podvek15,podvek3)
        return(vek)
    }else if(length(vek) == 2){
        podvek1 <- vek[1]
        podvek2 <- vek[2]
        vek <- vmerge(podvek1,podvek2)
        return(vek)
    }else if(length(vek) == 1){
        return(vek) 
    }else{
        mea <- (1 + (length(vek) - 1) %% 2)
        left <- vek[0:mea]
        right <- vek[(mea + 1):length(vek)]
        left <- merge_sort(left)
        right <- merge_sort(right)
    }
    vek <- vmerge(left,right)
    return(vek)
}

trans <- function(a){#транспонировние матрицы

    dimon <- dim(a)[1] * dim(a)[2]
    myVec <- numeric(dimon)
    is.na(myVec) <- 1:dimon
    b <- matrix(myVec,nrow = dim(a)[2],byrow = TRUE)#создание пустой матрицы
    for(i in 1:nrow(a)){
        for(j in 1:ncol(a)){
            b[j,i] <- a[i,j]
        }
    }
    return(b)
}

n <- 7

M <- 8
x <- sample(x=1:1000, size = (n*M), replace = TRUE)

ma <- matrix(x,byrow = TRUE,nrow = M, ncol = n)
for(i in 1:nrow(ma)){
    ma[i,] <- sort(ma[i,],decreasing = TRUE )
}

vec <- c()
for(i in 1:nrow(ma)){
    v <- 1
    for(j in 1:ncol(ma)){
        v <- v * ma[i,j]
    }
    vec <- c(vec,v)
}
ma_ob <- matrix(vec,ncol = 1)

mal <- cbind(ma,ma_ob)


tt <- trans(mal)#транспонируем, так как не умею сортировать строку, а учиться не хочу -> свожу задачу к предыдущей
#сортируем по строкам то есть объемы 
s <- merge_sort(tt[ncol(mal),])
trans(trans(mal))

BraveNewMatr <- c()#создаем новую матрицу, отсортированную по объемам
for(k in nrow(mal):1){
    z <- mal == s[k]
    for(i in 1:nrow(mal)){
        if(z[i,ncol(mal)] == TRUE){
            for(j in 1:ncol(mal)){
                z[i,j] <- TRUE
                
            }
            
        }
    }
    print(BraveNewMatrsRow <- mal[z])
    BraveNewMatr <- c(BraveNewMatr,BraveNewMatrsRow)
    
}
Matr1984 <- matrix(BraveNewMatr,byrow = TRUE, nrow = nrow(mal))
(Matr1984)
Matr2049 <- Matr1984[,-ncol(mal)]# Выкидываем объемы
(Matr2049)

maxinsertion <- 0
for(i in 1:(nrow(Matr2049) - 1)){#мы не рассматриваем последний параллелепипед, так как его объем самый маленький и в него ничего нельзя поместить
    insertion <- 0
    for(ii in (i + 1):nrow(Matr2049)){#меняет сравниваемый с i параллелепипед
        smth <- TRUE
        for(j in 1:ncol(Matr2049)){
            if(Matr2049[i,j] < Matr2049[ii,j]){
                smth <- FALSE
                break
                
            }
            
        }
        if(smth){
            insertion <- insertion + 1
        }
        
    }
    if(insertion > maxinsertion){
        maxinsertion <- insertion
    }
}

print(maxinsertion)
