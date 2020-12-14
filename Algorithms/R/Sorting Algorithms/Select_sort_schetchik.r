#rm(list = ls())

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
  counter_select_sort_function <- 0
  for (j in 1:(length(vektor) - 1)){
    tmp_value <- (min_function(vektor[j:length(vektor)]))[1]
    tmp_index <- (min_function(vektor[j:length(vektor)]))[2]
    if (vektor[tmp_index + j - 1] !=  vektor[j] ){
      counter_select_sort_function <- counter_select_sort_function + 1
    }
    vektor[tmp_index + j - 1] <- vektor[j]
    vektor[j] <- tmp_value
    
    
  }
  print(counter_select_sort_function)
  return(vektor)  
}

#q <- c(1, 5, 6, 4, 3)
q <- c(0, 1, 1, 4, 5, 6, 3, 3)
print(select_sort_function(q))
#cat("counter = ",counter_select_sort_function,"\n")
