//An undirected graph is defined by an adjacency matrix. Find the degrees of all the vertices of the graph.
using namespace std;
#include<iostream>
int main()
{
    int n, c = 0;
    cin >> n;
    int n1[100][100];
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n; j++)
        {
            cin >> n1[i][j];
        }
    }
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n; j++)
        {
            if(n1[i][j] == 1)
            {
                c += 1;
            }
        }
        cout << c << endl;
        c = 0;
    }

}
