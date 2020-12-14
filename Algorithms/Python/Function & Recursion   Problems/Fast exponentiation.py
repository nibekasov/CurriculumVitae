#Exponentiation is much faster than n multiplications! To do this, you need to use the following recurrence relations:
#an = (a^2)^(n / 2) for even n,
#an = a⋅a^(n − 1) for odd n.
#Implement the fast exponentiation algorithm. If you do everything correctly, then the complexity of your algorithm will be O (logn).

def power(a, n):
    if n == 0:
        return 1
    elif n%2 == 0:
        
        return power(a*a, n/2)
    elif n%2 != 0:
        return power(a,n-1)*a
         
a = float(input())
n = int(input())

print( power(a, n))
      
