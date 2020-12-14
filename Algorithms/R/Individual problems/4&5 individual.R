#humanvec <- c(1,2,5,2,4,5,6,3,13)
#humanvec <- c(4,1,1,1,1)
humanvec <- c(4,2,2,1,1)
ohumanvec <- humanvec

humanvec <- sort(humanvec, decreasing = TRUE)#сортируем вектор для удобства: В первую очередь  мы знакомим людей, которые нуждаюься в этом больше всего
#print(humanvec)
t <- length(humanvec)
for(i in 1:t){#проход для каждого человека
  for(j in i:t ){#Проход по его возможным знакомствам
    
    
    if (humanvec[j] == 0){#человек j больше не может знакомиться, так как достиг лимита знакомств
      next
    }
    if (i == j){#нельзя познакомиться с самим собой
      next
    }
    if(humanvec[i] > 0){#если мы нашли человека j с возможностью познакомиться и у i-го человека не превышен лимит на знакомства, то мы их знакомим
      humanvec[j] <- humanvec[j] - 1#У обоих людей, после знакомства лимит на знакомства уменьшается на 1
      humanvec[i] <- humanvec[i] - 1
      
    }
    
    
    
    
  }
}
for(i in 1:length(humanvec)){
  if(humanvec[i] != 0){# если хоть один человек не покрыл свою потребность в знакомствах, то миссия провалена
    #return(FALSE)
    print("Нельзя удовлетворить потребности всех людей в знакомствах")
    #print(humanvec)
    break
  }
}
if (i == length(humanvec)){ # Если все познакомились с необходимым колличеством  людей, то миссия выполнена
  #код задачи номер 5
  #print(ohumanvec)
  cat("Все люди могут познакомиться с желаемым колличеством людей.
      Вот как это можно сделать :","\n")
  humanvec <- ohumanvec
  minim <- min(humanvec) - 1
  while(sum(ohumanvec) != 0 ){
    humanvec <- ohumanvec
    b <- which.max(humanvec)
    bb <- humanvec[b] 
    humanvec[b] <- minim
    while(bb != 0){
      bb <- bb - 1
      ohumanvec[b] <- ohumanvec[b] - 1
      a <- which.max(humanvec)
      humanvec[a] <- minim
      ohumanvec[a] <- ohumanvec[a] - 1
      cat("Знакомим человека", b,"c человеком", a,"\n")
      
    }
    # print(ohumanvec)
    # print(sum(ohumanvec))
  }
  

}





