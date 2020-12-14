//A simple undirected graph is given by an adjacency matrix. Find the number of edges in the graph.

#include<iostream>
using namespace std;
int main()
{
    int n,counter=0,answer;
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
            counter += n1[i][j];

        }
    }






cout << (counter / 2);

}
