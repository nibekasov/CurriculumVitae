#Write a recursive function sum (a, b) that returns the sum of two non-negative integers. Of all the arithmetic operations, only +1 and -1 are allowed. Also, you cannot use loops.
def Max(a,b):
    if a > b:
        return a
    else:
        return b
   
def Min(a,b):
    if a < b:
        return a
    else:
        return b
   
 
def Sum(a,b):
    Max1 = Max(a,b)
    Min1 = Min(a,b)
    if Min1 != 0:
        Max1 = Max1+1
        Min1 = Min1-1
        return Sum(Max1,Min1)
    else:
        return Max1
   
      
a = int(input())
b = int(input())
print(Sum(a,b))
