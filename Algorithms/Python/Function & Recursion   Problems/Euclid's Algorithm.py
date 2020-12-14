#The Euclidean algorithm is used to quickly calculate the greatest common divisor of two numbers. It is built on the following relationship: GCD (a, b) = GCD (b, a mod b)
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
        elif a < b:
            (a,b) = (b,a)
            jcnfnjr = a%b
            a = jcnfnjr
            return gcd(a, b)            
            
    
a = int(input())
b = int(input())
print (gcd(a,b))
