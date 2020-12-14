cn <- c(3,5,8,13,15)
cm <- c(1,4,5,5,6,7,9 )
maxLength <- (length(cn) + length(cm))
myVec <- numeric (maxLength)  # a vector of maximum length

is.na(myVec) <- 1:maxLength   # set every item in myVec to NA
indexn <- 1
indexm <- 1
for (i in 1:(maxLength )){
    
    if (cn[indexn] < cm[indexm]){
        
        myVec[c(i)] <- cn[indexn]
        indexn <- indexn + 1
        
    }else{ #if (cn[indexn] > cm[indexm]){
        
        myVec[c(i)] <- cm[indexm]
        indexm <- indexm + 1
     }
    m <- (indexn + indexm)
    if ((indexm -1) == length(cm)){
        
        for (j in (m-1):(length(cn) + length(cm))){
            myVec[c(j)] <- cn[indexn]
            indexn <- indexn + 1
        }
        
        break
    }
    if ((indexn -1) == length(cn)){
        
        for (j in (m-1):(length(cn) + length(cm))){
            myVec[c(j)] <- cm[indexm]
            indexm <- indexm + 1
        }
        
        break
    }
    
}

print(myVec)