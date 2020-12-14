vekt <- c(2,1,6,3)
vekt <- sort(vekt,decreasing = FALSE)

element_in_vector <- function(x, a){
    t = FALSE
    for (i in  (1:length(x))){
        if (x[i] == a){
            
            t = TRUE
            return (TRUE)
            break
        }
        
    }
    if (t == FALSE){
        return (FALSE)
        
    }
    
}

Solution_ten <- function(vekt, natural = TRUE){
    vekt <- sort(vekt,decreasing = FALSE)
    if (natural){#пункт № 1 
        for(i in 1:(length(vekt) / 2)){
            cat(i,"-ая пара чисел:",vekt[i], vekt[length(vekt) - i + 1],"\n")
        }
    }else{#пункт №2
     if (element_in_vector(vekt,0)){#все суммы = 0
         io <- 1
         while(vekt[io] != 0){#ищем первый 0
             io <- io + 1
         }
         ios <- 0
         for(i in 1:(io - 1)){
             cat(i,"-ая пара чисел:",vekt[i], vekt[io + i - 1],"\n")
         }
         for(j in (length(vekt) - 2*i):length(vekt)){
             i <- i + 1
             cat(i,"-ая пара чисел:",vekt[j], vekt[io + i - 2],"\n")#i увеличилось еще на 1 перед выводом на экран
         }
     }else{
         sum_postive <- 0
         sum_negative <- 0
         for(i in 1:length(vekt)){
             if(vekt[i] < 0){
                sum_negative <- sum_negative + 1
             }else if(vekt[i] > 0){#На самом деле if тут излишен, так как в векторе не может быть 0, так как иначе произведение элементов во всех парах == 0
                 sum_postive <- sum_postive + 1
             }
         }
         min_negative <- vekt[1]
         max_positive <- vekt[length(vekt)]
         if(sum_postive != sum_negative){#только случай с положительным произведением, так как каждому положительному нельзя подобрать своё отрицательное и наооборот
             ipo <- 1
             while(vekt[ipo] < 0){#ищем первый положительный элемент
                 ipo <- ipo + 1
             }
             for (i in 1:((ipo -1)/2)){#выводим произведение отрицательных чисел
                cat(i,"-ая пара чисел:",vekt[i], vekt[ipo - i],"\n")
             }
             k <- 0
             for (j in ipo:((length(vekt)/4)*3)){
                i <- i + 1
                cat(i,"-ая пара чисел:",vekt[j], vekt[length(vekt) - k],"\n")
                k <- k + 1
             }
             rm(k)#k больше не нужно
            
         }else{#произведение может быть как отрицательное так и положительное, 
             for(i in 1:length(vekt)){
                 if(vekt[i] > 0){
                     index_of_first_positive <- i
                     min_positive <- vekt[i]
                     max_negative <- vekt[i-1]
                     break
                 } 
                 
             }
             tmin_negative <- min_negative
             tmax_positive <- max_positive

             for ( i in 1:(length(vekt)/4)){
                 if(vekt[i] * vekt[index_of_first_positive  + i - 1] == vekt[length(vekt)/2 - i + 1] * vekt[length(vekt) - i + 1]){#если произведение всех самых больших по модулю отрицательных чисел на роизведение самых маленьких положительных чисел будет равно произведнеию самых больших положительных чисел на произведение самых маленьких по модулю отрицательных чисел, то мы так их и перемножим, иначе перемножим как во втором случае(положительные на положительные, отрицательные на отрицательные)
                     tmp <- TRUE
                 }else{
                     tmp <- FALSE
                     break
                 
             }
             }
             if(tmp){#перемножаем как написанно в предыдущем условном операторе
                 rm(tmp)
                 for(i in 1:length(vekt)/2){
                     if (i %% 1 == 0){
                         cat(i,"-ая пара чисел:",vekt[i], vekt[index_of_first_positive + i - 1],"\n") 
                     }
                     
                     
                 }
             }else{
                 rm(tmp)
                 
                 ipo <- 1#копипаста  55 - 68 строка
                 while(vekt[ipo] < 0){#ищем первый положительный элемент
                     ipo <- ipo + 1
                 }
                 for (i in 1:((ipo -1)/2)){#выводим произведение отрицательных чисел
                     cat(i,"-ая пара чисел:",vekt[i], vekt[ipo - i],"\n")
                 }
                 k <- 0
                 for (j in ipo:((length(vekt)/4)*3)){
                     i <- i + 1
                     cat(i,"-ая пара чисел:",vekt[j], vekt[length(vekt) - k],"\n")
                     k <- k + 1
                 }
                 rm(k)#k больше не нужно
             }
             
         }

         
     }   
    }
}

Solution_ten(vekt)

vekt <- c(1,2,0,0,0,0,-1,-2,0,0,0,1,1,1,0,5,0,6,1,0,1,0,1,0,-2,-2)

Solution_ten(vekt,FALSE)

vekt <- c(-1,-2,-3,-6,2,2,3,3)#почти где-то съехал индекс в 55 - 68, а следовательно и 101-117
Solution_ten(vekt,FALSE)

vekt <- c(-6,-3,-2,-1,1,2,3,6)#пофикшено условным оператором(больше не выдает не целый номер пар)
Solution_ten(vekt,FALSE)