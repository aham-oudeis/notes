# Minimum path sum
#### Team 9: 
##### Nykaela Dodson, Katherine Ebel, Hans Elde, Gagan Sapkota

# Presentation
## Presentation()
["Description", "Humanizing the problem",  "Walkthrough a testcase", "Base Case", "Issues to Consider",  "Pseudocode", "Code without cache", "Code with cache", "Time Complexity"]

When the list of task is empty, stop.

First, [[#Description]]
Then, present the rest.


## Description
Given a `m x n` `grid` filled with non-negative numbers, find a path from top left to bottom right, which minimizes the sum of all numbers along its path.

**Note:** You can only move either down or right at any point in time.

**Example 1:**

![](https://assets.leetcode.com/uploads/2020/11/05/minpath.jpg)

**Input:** grid =` [[1,3,1],[1,5,1],[4,2,1]]`
**Output:** 7
**Explanation:** Because the path 1 → 3 → 1 → 1 → 1 minimizes the sum.

**Example 2:**

**Input:** grid = `[[1,2,3],[4,5,6]]`
**Output:** 12

**Constraints:**

-   `m == grid.length`
-   `n == grid[i].length`
-   `1 <= m, n <= 200`
-   `0 <= grid[i][j] <= 100`

Description over. 
Present the [[#Humanizing the problem]]



## Humanizing the problem
Closest thing to this problem i can think of:

While hiking to a new place, I wanna figure out the quickest path to the destination.  I can get information from people who are returning from different paths.

I can ask people coming from different paths and pick the one that is the least. 

![[Dynamic programming.jpg|1000x900]]


And the thing is, those informants might be doing the same with other informants returning from different paths they might take.


Humanizing problem over.
Now, present [[#Walkthrough a testcase]]





## Walkthrough a testcase
![[Dynamic programming.png]]

How the recursion tree might look like:
![[recursion-tree.jpg]]
Walthrough complete.
Now, present [[#Base Case]]




## Base Case:
When the row and column are both their maximum value, then we have reached the end.
Max value for row is len(grid) - 1
Max value for column is len(grid[0]) - 1

Base Case complete.
Now, present [[#Issues to consider]]





## Issues to consider:
1. How to handle the case when either row or column goes out of bound?
2. What to cache so that we can avoid the redundant work?

Issues to Consider complete.
Now, present [[#Pseudocode]]





## Pseudocode
1. Define the recursive function so that it takes the row and column index
2. if the row index goes out of bounds or column index goes out of bounds, then return -1.
3. otherwise, ask the minimum from the right and the minimum from the bottom.
4. Return the minimum between the two plus the current value
5. Helper: minimum function takes in two values: 
		 - if one of the value is -1, it returns the other value (bc that's the only path forward); 
		 - otherwise, it returns the minimum of the two


Pseudocode complete.
Now, present [[#Code without caching]]





## Code without caching
```go
func minPathSum(grid [][]int) int {
  lastRow, lastColumn := len(grid) -1, len(grid[0]) - 1

	//might not be a good idea, but here we define the recursive function 
	//inside the main function
	//that way, it can make use of the grid through closure
  var findMinPathFrom func(int, int) int

  findMinPathFrom = func(row, column int) int {
    if row > lastRow || column > lastColumn {
      return -1
    }
    
    if row == lastRow && column == lastColumn {
      return grid[lastRow][lastColumn]
    }

    minFromRight := findMinPathFrom(row, column+1)
    minFromBottom := findMinPathFrom(row+1, column)
    
    return grid[row][column] + min(minFromRight, minFromBottom)
  }
  
  return findMinPathFrom(0, 0)
}

func min(n1, n2 int) int {
  if n1 == -1 {
    return n2
  }
  
  if n2 == -1 {
    return n1
  }
  
  if n1 > n2 {
    return n2
  } else {
    return n1
  }
}
```


Code without Caching complete.
Now present [[#Code With Caching]]






## Code With Caching
```go
func min(n1, n2 int) int {
  //if one of the value is out of bounds, 
  //then the other path must be taken
  if n1 == -1 {
    return n2
  }
  
  if n2 == -1 {
    return n1
  }
  
  if n1 > n2 {
    return n2
  } else {
    return n1
  }
}

func minPathSum(grid [][]int) int {
  lastRow, lastColumn := len(grid) -1, len(grid[0]) - 1

  var findMinPathFrom func(int, int, map[[2]int]int) int

  findMinPathFrom = func(row, column int, cache map[[2]int]int) int {
    //if out of bounds, return -1; 
    //this value helps us to discard the out of bounds paths
    if row < 0 || column < 0 {
      return -1
    }
    
    if row == 0 && column == 0 {
      return grid[row][column]
    }

		//we wanna store the value for the corresponding row and column position
    position := [2]int{row, column}


		//if the value is not found in the cache, then compute and store in the cache
    if _, ok := cache[position]; !ok {
      totalFromRight := findMinPathFrom(row, column-1, cache)
      totalFromUp := findMinPathFrom(row-1, column, cache)
       
      cache[position] = min(totalFromRight, totalFromUp) + grid[row][column]
    }

		//return the value from cache
    return cache[position]
  }
  
  cache := make(map[[2]int]int)
  
  return findMinPathFrom(lastRow, lastColumn, cache)
}
```


Code with Caching complete.
Now, present [[#Time Complexity]]





## Time Complexity
Without caching: 2^(m+n)

But caching eliminates the trailing values other than `m^2`. Thus, reduces the time complexity to O(m^2) or O(m x n)
