### Binary Search Tree (BST) vs. Binary Tree

-   Binary Search is an algorithm; Trees are data structures
-   Binary Search is the algorithm for searching a BST data structure
-   Binary Search, the algorithm, can also be used for ordered Arrays
-   Interview Tip: 
    -   _Some interviewers mix up the terms. Politely verify with interviewer that, for example, they mean for you to do binary search, the algorithm, over an array even when they accidentally said "binary search tree"._ 

  
**Ordered Array**

-    Read / Index Access
    -   O(1)
-   Search (this is why they're useful!)
    -   O(Log N)
    -   remember that in unordered Array, this is O(n)
-   Insertion 
    -   O(N)
    -   still have move elements backwards
-   Deletion
    -   O(N)

**Array / Binary Search Problems**  

-   Given ordered/sorted Array of numbers, find the first/last/only index of a number that satisfies some condition
-   Cut the problem space in half in O(1) time
    -   O(Log N)
-   Cut the problem space in half in O(N) time? 
    -   O(N Log(N))
-   Interview tip:
    -   _If you already have a linear O(N) solution and the interviewer asks whether you can do better, it's most likely going to involve binary search!_ 
    -   _Even if the array is not ordered, it's still possible to do Binary Search if you can decide which half to keep with a O(1) operation_