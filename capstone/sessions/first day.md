### coding interview talk by Gayle
- slower coding changes how you think about the problem
- coding on paper slows you down

## What is Big O

Big O is a function of the number of elements that the code has to hit. But which elements are significant need to be assessed depending on the situation.

```
a = array

for i from 1 to N:
	validate(a[N])
```

Runtime of Recursion

```
int fib(int n) {
	if (n == 0 || n == 1) {
		return 1
	} else {
		return fib(n - 1) + fib(n - 2)
	}
}
```

each level doubles the numbers of function calls, hence runtime is O(2^N)

Notes: 
- Drop constants
- Don't drop non-constants
- Different variables
- Avoid 'n'
- Add vs. Multiply
- Recursion call tree

### What to do while struggling
- Be excited about hard problems
- More than just "correct"
- Drive!
- Keep trying when stuck (Persistence)
- Write real code

Basically the issue is to test what information you provide while solving problems. Show how you think

- silent insight is not informative
- give some headline on where you are in the solving process

### Tips on solving problems
1. Listen for clues, because they are essential to the problem
2. assume that every information matters
3. brute force and naive approaches are okay as starting points
4. lot more time goes into trying to optimize the code

### BUD
1. bottlenecks
2. Unnecessary work
3. Duplicated work

### Testing
- look for high-risk lines
- test cases: small test cases, edge cases, bigger test cases

Interesting points
- test code, not algoritm
- think as you test
- think before you fix

Questions:
1.  Didn't quite understand the runtime of recursive algoritm
2. Didn't quite understand what 'test code, not algorithm' is about.
3. Didn't quite understand the find the anagram problem at all.
4. sliding-window approach
5. What is precomputation?


