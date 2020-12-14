#Задача 11. Имеются числа А1,А2,...,АN и B1,B2,...,BN. Составить из них N пар (Аi, Bj) таким образом, чтобы сумма произведений пар была максимальна (минимальна). Каждое Ai и Bj в парах встречаются ровно по одному разу.

vektorA <- c(1,4,2,5)
vektorB <- c(6,5,4,3)

min_function <- function(vektor){
    
    minimal_value <- vektor[1]
    minimal_value_index <- 1
    
    for (i in 1:length(vektor)) {
        
        if (minimal_value > vektor[i]){
            minimal_value <- vektor[i]
            minimal_value_index <- i
        }
    }
    vek <- c(minimal_value, minimal_value_index )
    return(vek)
}


select_sort_function <- function(vektor){
    for (j in 1:(length(vektor) - 1)){
        tmp_value <- (min_function(vektor[j:length(vektor)]))[1]
        tmp_index <- (min_function(vektor[j:length(vektor)]))[2]
        vektor[tmp_index + j - 1] <- vektor[j]
        vektor[j] <- tmp_value
        
        
    }
    return(vektor)  
}
 
vektor_a <- select_sort_function(vektorA)
vektor_b <- select_sort_function(vektorB)

my_fun <- function(vektor_a, vektor_b, max_sum = TRUE){
    counter <- 0
    for (i in 1:length(vektor_a)){
        
        if (max_sum == TRUE){
            print(vektor_a[i])
            print(vektor_b[i])
            counter <- counter + vektor_a[i] * vektor_b[i]
        }else{
            print(vekor_a[length(vektor_a)])
            print(vekor_b[i])
            counter <- counter + vekor_a[length(vektor_a)] * vekor_b[i]
        }
        
    }
    return(counter)
    
}
my_fun(c(1,4,2,5),c(6,5,4,3) )