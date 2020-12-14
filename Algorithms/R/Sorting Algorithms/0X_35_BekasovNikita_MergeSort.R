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
    }else if(length(vek) <= 1){
       return(vek) 
    }else{
        mea <- (1 + (length(vek) - 1) %/% 2)
        left <- vek[0:mea]
        right <- vek[(mea + 1):length(vek)]
        left <- merge_sort(left)
        right <- merge_sort(right)
    }
    vek <- vmerge(left,right)
    return(vek)
}

#merge_sort(c(84,1,23,34,12,0,54,99,2,2,0,0))
n <- sample(1:20,size = 1)

vek <- sample(-100:100,size = n, replace = TRUE)
merge_sort(vek)
