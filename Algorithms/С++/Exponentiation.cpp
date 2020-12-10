//Write a function double power (double a, int n) (C / C ++) that calculates the value of a ^ n

#include<iostream>
using namespace std;



double power (double a, int n)
{
    double Ans;
    Ans=1;
    if (n==0)
    {
        Ans=1;
        return Ans;
    }
    else
    {

        for(int i=n; i>0; --i)
        {
             Ans=Ans*a;

        }
        return Ans;

    }
}
int main()
{
    double a;
    int n;
    cin>>a>>n;
    cout<< power (a,n);
}

