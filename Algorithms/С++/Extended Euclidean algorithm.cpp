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
        d[2]++;
    }
    return 0;
}

int main ()
{
    int a;
    int b;
    int d[3]= {0,0,0};
    cin>> d[0] >> d[1];
    DP(d);
    cout << d[0]<<" "<<d[2];
    return 0;
}
