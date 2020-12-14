def move(n, x, y):
    xy = 6-x-y

    if n != 0:
        move(n-1, x, xy)
        print(n, x, y)
        move(n-1, xy, y)
         
        
x = 1          
y = 3
n = int(input())



move(n, x, y)
