//From the given adjacency matrix of an undirected graph, determine if it contains loops.

#include<iostream>
using namespace std;
int main()
{
    int n;
    cin >> n;
    int n1[100][100];
    for (int i = 0; i < n;i++)
    {
        for (int j = 0; j < n;j++)
        {
            cin >> n1[i][j];
        }

    }
    for (int i = 0; i < n;i++)
    { 
        if(n1[i][i] == 1)
        {
            cout << "YES";
            return 0;
        }
    }
    cout << "NO";
}
