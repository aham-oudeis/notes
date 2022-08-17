# How primitives and objects are stored
* Primitives are stored in stack, whereas objects are stored in heap. Although objects are stored in the heap, the pointers to the objects are stored in the stack. 

* Stack memory is rather fast because its size is predetermined and not allowed to alter, whereas heap memory is dynamically allocated and is a bit slower. 

* When a variable is initialized to another variable, what is copied is the value stored in the stack memory. For primitives, the stack stores the values. For objects, the stack stores the pointers. That explains another thing: when equality operator is invoked on primitives, the values are compared because that's what is stored on the stack. When equality operatr is invoked on objects, the pointers are compared. 

* Hence, pass-by-value regarding primitives and pass-by-reference regarding objects.

The memory that the values stored in the stack use are allocated and released differently than the values stored in the heap. While the values stored in the heap is garbage collected, the values in the stack are released in a different manner.

```javascript
function test() {
	let a = 1;
	let b = 'hi';
	
	let obj = {
		number: a,
		string: b,
	}
		
	return obj;
}

test();
```

When the `test` function is invoked, it starts a new execution context in which the code inside the function body is executed. The variable `a` is assigned a primitive value `1` and the variable `b` is assigned a primitive value `hi`. These values `1` and `hi` are stored on the stack. 

However, the variable `obj` points to an object and this variable simply stores a pointer to the object on the stack. This pointer points to the place in memory on the heap. 