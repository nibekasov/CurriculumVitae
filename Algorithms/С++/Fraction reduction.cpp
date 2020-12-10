// You are given a fraction a: b. It is required to reduce it, that is, write the same number in the form c: d, where c is an integer, d is a natural number and d is the minimum possible.
# include <iostream>
#include<algorithm>
using namespace std;

int DP(int *d)
{
    if (d[1]>d[0])
    {
        swap(d[0],d[1]);
    }
    while (d[1]>0)
    {
        d[0]=d[0]%d[1];
        swap(d[0],d[1]);

    }
    return 0;
}

int main ()
{
    int x,SMT=1;
    int a;
    int b;
    int d[3]= {0,0,0};
    cin>> x >> d[1];
    if (x<0)
    {
        SMT=(-1);
    }

    d[0]=abs(x);
    a=SMT*d[0];
    b=d[1];
    DP(d);
    cout << a/d[0]<<" "<<b/d[0];
    return 0;
}
