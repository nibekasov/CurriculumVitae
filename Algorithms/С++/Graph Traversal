//An undirected unweighted graph is given. For it, you need to find the number of vertices lying in one connected component with the vertex (counting this vertex).
#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;

void dfs(int s ,vector<vector<int> > & matr , int n,vector<int>& marked);

int main()
{
    int n,s,counter=0;

    cin>>n>>s;
    s-=1;
    vector < vector<int> > matr(n, vector<int>(n, 0));
    for (int a=0;a<n;a++)
    {
        for(int b=0;b<n;b++)
        {
            cin>>matr[a][b];
        }
    }
    vector<int>marked(n,0);
    dfs( s , matr ,  n, marked);
    for (int i=0; i<n; i++)
    {
        if (marked[i]==1)
        {
            counter+=1;
        }
    }
    cout<<counter;


}

void dfs(int s , vector < vector<int> > & matr, int n , vector<int> & marked)
{
    marked[s]=1;
    for (int i=0; i<n; i++)
    {
        if(matr[s][i]==1 && marked[i]==0)
        {

            dfs(i,matr,n,marked);

        }
    }

}
