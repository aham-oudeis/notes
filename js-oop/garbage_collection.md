## Garbage Collection
The job of garbage colllector is to reclaim memory occupied by unsued objects.

> In Javascript, values are allocated memory when they are created, and they are eventually 'automatically' freed up when they are not in use. This process of 'automatically' freeing memory up is called **garbage collection**. 

[source](https://launchschool.com/lessons/0b371359/assignments/48d2a179)

JS keeps primitive values stored in variables in stack memory, but objects stored in variables are stored in heap. The pointers to those objects are stored in the stack memory.

> When a function or block begins executing in a javascript program, javascript allocates memory on the stack for the variable defined in that block or function. Since each item has fixed size, javascript can calculate the amount of memory it needs during the creation phase of execution without knowing the specific values. That means it can determine how much stack space it needs when hoisting occurs. When the block or function is done running, the allocated stack memory gets returned to the system automatically. 

[source](https://launchschool.com/lessons/0b371359/assignments/48d2a179)

Here, it helps to think of the execution context. Stack memory is associated with the execution context. For a given execution context, all the primitive values and the pointers to the objects needed for the execution context are stored in the stack. Stack memory does not participate in GC. When the execution context is popped off the stack, depending on what is returned, the values created in the execution context may or may not be necessary to keep around. The values that are not necessary to keep around can be discarded and the memory they take up can be freed up for future use.

Things are different for values stored in heap. Values stored in heap do not have a fixed size that can be dtermined ahead of time, new values are added as they get created. The values in the heap cannot be discarded as the values stored in the stack. The memory they occupy have to be freed up in a different way. This is where Garbage Collection comes into play. GC has to find the values that are in not in use and free up the memory they occupy. 

However, the problem of finding whether or not a value is in use is NP hard. That means, the problem has not be solved. But there are approaches that come close to doing a good enough job.

A naive approach to GC is to keep a counter of references that object has. If the object has zero references, then it is eligible for GC. But the trouble with this approach is that some objects can have circular references, such that even if those objects are not used, the reference counter is greater than zero. Hence, such objects are not eligible for GC.

JS implements a mark-and-sweep algorithm to find the values that are no longer in use. Basically, the approach is to start with the root node (global object, DOM node) and see if there is a path that connects with the values. If the value is not reachable, then it is eligible for GC.

## GC and Closures
Since closures store references to all the variables it can access, as long as the closure exists, those variables remain in existence, which means that the values that are accessible to the closure remain in memory. Hence, those values are not eligible for GC. If the closure is no longer useful, the it is better to reassign the variable to null so that all the values accessible to the closure can be garbage collected. 

```javascript
function makeArrayLogger(arr) {
	return function() {
		console.log(arr);
	};
}

let logger = makeArrayLogger([1, 2, 3]);

logger();

//suppose you don't need to use this closure anymore
//in that case, you can free up the values by reassigning the value of looger 
//to null.
```