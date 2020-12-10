//In an undirected graph, you need to find the length of the minimum path between two vertices.

#include<iostream>
#include<vector>
using namespace std;

int main ()
{
    int n, v1, v2, i;
    cin >> n;
    vector<vector<int> > matr (n, vector<int>(n));
    for (int a = 0; a < n; a++)
    {
        for(int b = 0; b < n; b++)
        {
            cin >> matr[a][b];
        }
    }
    cin >> v1 >> v2;
    vector<int> vqueue;
    vector<int> dist (n, 10009);

    vqueue.push_back(v1 - 1);
    dist[v1 - 1] = 0;
    while (!vqueue.empty())
    {
        i = vqueue[0];
        for (int j = 0; j < n; ++j)
        {
            if (matr[i][j] != 0 && matr[i][j] + dist[i] < dist[j])
            {
                vqueue.push_back(j);
                dist[j] = matr[i][j] + dist[i];

            }
        }
        vqueue.erase(vqueue.begin());
    }
    if (dist[v2 - 1] == 10009)
        cout << "-1";
    else
        cout << dist[v2 - 1];
}
