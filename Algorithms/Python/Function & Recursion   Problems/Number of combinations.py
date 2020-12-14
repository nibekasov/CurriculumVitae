def CfromNonK(n, k):
    if k == 0:
        return 1
    elif k == n:
        return 1
    else :
        return CfromNonK(n-1, k-1)+ CfromNonK(n-1, k)
                                              
                                              



n = int(input())
k = int(input())

print (CfromNonK(n, k))
