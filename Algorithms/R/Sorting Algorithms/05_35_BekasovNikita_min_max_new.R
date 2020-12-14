#rm(list = ls())

opverbm<- function(vektor,verbose = TRUE){
  vektor<- c(1,2,3/5,-7)
  minimal_value<- vektor[1]
  maximal_value<- vektor[1]
  maximal_value_index<-1
  minimal_value_index<-1
  
  for (i in 2:length(vektor)) {
    if (maximal_value<vektor[i]){
      maximal_value<- vektor[i]
      maximal_value_index<- i
    }
    if (minimal_value>vektor[i]){
      minimal_value <- vektor[i]
      minimal_value_index <- i
    }
  }
  
  
  if (verbose){
    cat("Minimal number in vector is",minimal_value,",it's index is",minimal_value_index,"\n")
    cat("Maximal number in vextor is",maximal_value,",it's index is",maximal_value_index,"\n")
  }
  else{
    cat(minimal_value, maximal_value,"\n")
    cat(minimal_value_index, maximal_value_index,"\n")
    
    
  }
  
}
#opverbm(vektor, verbose = FALSE) #Function that return numbers and indexes:First line is minimum and maximum numbers, when the second line returns indexes of this numbers.
a <- opverbm(vektor, verbose = FALSE) #Function whith text


