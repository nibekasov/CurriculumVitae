#The original of the Tower of Hanoi was restored by a UNESCO decree. In this regard, while using the puzzle, it was impossible to shift the rings from the first rod directly to the third and vice versa.

def move(n, x, y):
    xy=6-x-y

    if n!=0:
        move(n-1, x, y)
        print (n, x, xy)
        move(n-1, y, x)
        print(n, xy, y)
        move(n-1, x, y)
        
         
        
x=1          
y=3
n=int(input())

move(n, x, y)
