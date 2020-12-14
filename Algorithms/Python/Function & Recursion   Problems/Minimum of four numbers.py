def Min (a,z): #analogue of standart function
    if a<z:
        return a
    else:
        return z
    
    
def Min4 (x,y,z,a):
    return (Min(Min(Min(a,z),y),x))
               

x=int(input())
y=int(input())
z=int(input())
a=int(input())
    
    
  
print(Min4(a,y, z,x))
