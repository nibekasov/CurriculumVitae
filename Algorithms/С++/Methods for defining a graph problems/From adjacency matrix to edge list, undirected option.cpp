//A simple undirected graph is given by an adjacency matrix, output its representation as a list of edges.

#include<iostream>
using namespace std;
int main()
{
    int n, counter = 0, answer;
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
            if (n1[i][j] == 1)
            {
                cout << i+1 << " " << j+1 << endl;
                n1[j][i] = 0;
            }

        }
    }







}
