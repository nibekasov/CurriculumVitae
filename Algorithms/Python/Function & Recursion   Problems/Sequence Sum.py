#You are given a sequence of numbers ending with the number 0. Find the sum of all these numbers without using a loop.

def segu_su():
    b = int(input())
    if b != 0:
        return b + segu_su()
    else :
        return 0
    
    
print (segu_su())
