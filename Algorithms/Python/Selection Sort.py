def SelectionSort(A):
	n = len(A)
	for i in range(n-1):
		smallest = i
		j = i + 1
		while j < n:
			if A[j] < A[smallest]:
				smallest = j
			j+=1
		A[i], A[smallest] = A[smallest], A[i]
	return A


A=list(map(int, input().split()))
SelectionSort(A)
A[ :: ]=A[ ::-1 ]
for i in range(len(A)):
    print(A[i], end=' ')
