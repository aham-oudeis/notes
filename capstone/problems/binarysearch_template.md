```go
func binarySearch(nums []int, target int) int {
	left, right := 0, len(nums) - 1

	for left < right {
		mid := left + ((right - left) / 2)

		if nums[mid] == val {
			//early return
			return mid
		}

			//main comparison
		if nums[mid] > val {
			right = mid + 1
		} else {
			left = mid - 1
		}
	}

	return left
}
```