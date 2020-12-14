#Check if number is prime. The program should print the word YES if the number is prime and NO if the number is composite.
#Complexity of an algorithm O(\sqrt{n})

def MinDivisor(n):
    for i in range(2,(int(n**0.5))+1):
        if n%i==0:
            return i
    return n
 
 
def IsPrime(n):
    if MinDivisor(n)==n:
        return True
    else:
        return False
         
         
    
n=int(input())
if IsPrime(n)==True:
    print("YES")
else:
    print("NO")
     
