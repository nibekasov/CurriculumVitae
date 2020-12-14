#For a given square n × n matrix of zeros and ones, determine whether this matrix can be the adjacency matrix of a simple undirected graph.

#include<iostream>
using namespace std;
int main()
{
    int n,counter = 0;
    cin>>n;
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
            if(i != j)
            {
             if(n1[i][j] != n1[j][i])
                counter = 1;
            }
            else if(i == j)
            {
                if(n1[i][j] == 1)
                {
                    counter = 1;

                }

            }

        }

    }
    if (counter == 1)
    {
        cout << "NO";
    }
    else
    {
        cout << "YES";
    }
}
