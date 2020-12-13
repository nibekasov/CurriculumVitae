#A list is given. Determine if it is monotonically increasing

def IsAscending(X):
    z=len(X)
    i=0
    while i!=z-1 and X[i]<X[i+1]  :
        i+=1
    if i == z-1:
        return("YES")    
    else:
        return("NO")


X=list(map(int, input().split()))
print(IsAscending(X))
