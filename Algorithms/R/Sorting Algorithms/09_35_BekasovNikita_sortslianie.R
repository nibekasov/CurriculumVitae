#swap()
#include <iostream>
#include <conio.h>

# using namespace std;
# 
# #define maxn 100
# 
# int a[maxn];
# 
# int n;
# 
# void merge(int l, int r) {
#     if (r == l)
#         return;
#     if (r - l == 1) { 
#         if (a[r] < a[l])
#             swap(a[r], a[l]);
#         return;
#     }
#     int m = (r + l) / 2;
#     merge(l, m);
#     merge(m + 1, r);
#     int buf[maxn];
#     int xl = l;
#     int xr = m + 1;
#     int cur = 0;
#     while (r - l + 1 != cur) {
#         if (xl > m)
#             buf[cur++] = a[xr++];
#         else if (xr > r)
#             buf[cur++] = a[xl++];
#         else if (a[xl] > a[xr])
#             buf[cur++] = a[xr++];
#         else buf[cur++] = a[xl++];
#         
#     }
#     for (int i = 0; i < cur; i++)
#         a[i + l] = buf[i];
# }
# 
# int main() {    
#     cin >> n;
#     
#     for (int i = 0; i < n; i++)
#         cin >> a[i];
#     
#     merge(0, n - 1);
#     
#     for (int i = 0; i < n; i++)
#         cout << a[i] << " ";
#     
#     getch();
#     return 0;

merge <- function(vektor){
    l <- 1###
    r <- length(vektor)###
    if (r == l){
        return(vektor)
        
    }else if( r - l == 1){
        if(vektor[r] < vektor[l]){
            tmx <- vektor[r]
            vektor[r] <- vektor[l]
            vektor[l] <- tmx
        }
        return(vektor)
    } 
    
    t <- round((r + l + 1) / 2)
    vektorL <- merge(vektor[l:t])
    vektorR <- merge(vektor[t+1:r])
    RL <- (length(vektorR) + length(vektorL)) 
    vektorRL <- numeric (RL) # a vector of maximum length
    is.na(vektorRL) <- 1:RL # set every item in vektorRL to NA
    counterR <- t + 1
    counterL <- l
    #for(i in 1:RL){
    ti <- 0
    while( (counterR != (length(vektorR) + 1)) || (counterL != (length(vektorL) + 1)) ){
        ti <- ti + 1
        if(vektorR[counterR] < vektorL[couterL]){
            vektorRL[ti] <- vektor[counterR]
            counterR <- counterR + 1
        }else if(vektorR[counterR] > vektorL[counterL]){
            vektorRL[ti] <- vektor[counterL]
            counterL <- counterL + 1
        }
        
    }
    if (counterR == (length(vektorR) + 1)){
        for(j in ti:length(vektorRL)){
            vektor[j] <- vektorL[counterL]
            counterL <- counterL + 1
        }
        
    }else if (counterL == (length(vektorL) + 1)){
        for(j in ti:length(vektorRL)){
        vektor[j] <- vektorR[counterR]
        counterR <- counterR + 1
        }
    }   
    return(vektorRL)
    
    
}
merge(c(1,3,4,2,3,4))
