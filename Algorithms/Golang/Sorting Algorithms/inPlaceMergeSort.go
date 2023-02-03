package main

import "fmt"

func mergeSortInPlace(arr []int) []int {
    if len(arr) <= 1 {
        return arr
    }

    currentSize := 1
    for currentSize < len(arr) {
        left := 0
        for left < len(arr) {
            mid := left + currentSize - 1
            right := min(2*currentSize+left-1, len(arr)-1)

            // Merge the subarrays
            inPlaceMerge(arr, left, mid, right)
            left = left + 2 * currentSize
        }
        currentSize = 2 * currentSize
    }

    return arr
}

func inPlaceMerge(arr []int, l, m, r int) {
    i := l
    j := m + 1

    for i <= m && j <= r {
        if arr[i] <= arr[j] {
            i++
        } else {
            temp := arr[j]
            for k := j; k > i; k-- {
                arr[k] = arr[k-1]
            }
            arr[i] = temp
            i++
            j++
            m++
        }
    }
}

func min(a, b int) int {
    if a < b {
        return a
    }
    return b
}

func main() {
    arr := []int{38, 27, 43, 3, 9, 82, 10}
    fmt.Println("Unsorted array is:", arr)
    sortedArray := mergeSortInPlace(arr)
    fmt.Println("Sorted array is:", sortedArray)
}
