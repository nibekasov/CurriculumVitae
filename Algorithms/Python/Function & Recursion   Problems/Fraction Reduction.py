#You are given a fraction a: b. It is required to reduce it, that is, write the same number in the form c: d, where c is an integer, d is a natural number and d is the minimum possible.

def gcd(a, b):
    jcnfnjr = 0
    if a == 0 :
        return b
    elif b == 0:
        return a
    elif a == b:
        return a
    else:
        if a > b:
            jcnfnjr = a%b
            a = jcnfnjr
            return gcd(a,b)
        elif a<b:
            (a,b) = (b,a)
            jcnfnjr = a%b
            a=jcnfnjr
            return gcd(a, b)
        
def ReduceFraction(a, b):
    gcd1 = gcd(a,b) 
    a = a//gcd1
    b = b//gcd1
    return (b,a)
    
         
        
a = int(input())
b = int(input())        
            
   

   

a,b=ReduceFraction(a, b)



print(b,a)
