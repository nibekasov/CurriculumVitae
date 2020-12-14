fun <- function(x){
    return(x^2)
}

GSS <- function(a,b,e = 10^-3){#Golden-section search
    k <- (sqrt(5)-1)/2
    I0<- b-a#length of  interval[a,b] == l[a,b]
    I1 <- k*I0 #l[a,y]
    y <-a + I1
    x <-b - I1
    if(I0 <= e ){
        return((x+y)/2)
    }else{
        fx <-fun(x)
        fy <-fun(y)
        if(fx > fy){
            a <-x
            return(GSS(a,b))
        }else{
            b <-y
            return(GSS(a,b))
        }
        
    }
}

GSS(-10,10)
