#include<iostream>
#include<cmath>
using namespace std;
int main()
{
    int counter=0,n;
    cin>>n;
    int a[n];
    for (int k=0;k<n;++k)
    {


         a[k]=0;
         cin>>a[k];
    }

    for (int i=0;i<n-1;++i)
    {

        for (int j=1;j<n-i;++j)
        {


        if(a[j]<a[j-1])
            {
             int tmp=a[j];
             a[j]=a[j-1];
             a[j-1]=tmp;
             counter+=1;
            }
        }
    }


    cout << counter;
}
