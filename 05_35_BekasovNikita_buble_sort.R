#vektor<- c(1,2,3/5,-7)
vektor<- c(3,4,6,2,1,5)
counter<- 0 #variable that count amount of transpositions

for (i in 1:(length(vektor)-1)){
  print(0)
  print(vektor)
  for( j in 1:(length(vektor)-i)){
    print(1)
    if (vektor[j]>vektor[j+1]){
      
      tmp<-vektor[j+1]
      vektor[j+1]<- vektor[j]
      vektor[j]<- tmp
      counter<- counter + 1
    }
  }
  
}
  
print(counter)
print(vektor)
print(i)