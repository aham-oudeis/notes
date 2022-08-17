## Higher Order Functions 
- Functions that either take a function as an argument or return a function are called higher order functions. 
- This is possible in JS because functions are values in JS

The iteration methods available on array objects, such as `forEach`, `map`, `filter`, `reduuce` are all higher order functions because they take functions are their arguments.

The `bind` method available on function objects is also a higher order function, because it returns a function. See [[bound_Function]]

## Private Data
-functions create a new execution context
-and this new execution context sits on top of the previous execution context
-when we return a function from this execution context, the data inside the closure of the function remains inaccessible to other part of the codebase and only accessible to the returned function

```javascript
function makeCounter() {
	let count = 0;
	
	//return a function that has access to the count variable
	//when executed, the count variable is incremented by one
	return function () {
		count += 1;
		console.log(count);
	} 
}

let counter = makeCounter();

counter(); // increments the private count variable and logs the value

//inside the closure, the count variable is incremented by 1
// count variable comes to store 2
// the value 1 associated with the closure is not used anymore
// hence, it is available for garbage collection
```
Capitalizing on closures, we can return objects with methods that have access to some private data. We can access the private data through the provided interface. For example:

```javascript
function clubMembers() {
	let members = [];
	
	return {
		add(person) {
			members.push(person)
		},
		
		allMembers() {
			//return a copy of the array so that the data cannot be tampered with
			return members.slice();		
		},
			
		remove(person) {
			let idx = members.findIndex(member => member === person);
			
			if (idx === -1) return;
					
			members.splice(idx, 1);
		},
	}
}
```

Use of closures restrict access to data. Hence, closures allow us to enforce the access to the data only through the provided methods.

The downside of this approach is that anytime we want to add a method to the object, we have to change the function itself. Merely adding a method to the object is not enough, because the method added outside of the closure does not have access to the private data.

Hence, if adding methods incrementally is not a concern, then the use of closures is a pretty nice way of making data private.

## [Garbage Collection](/Garbage Collection)
[[garbage_collection]]

## IIFE
- Functions that we define and invoke immediately
- These are useful when you have to create a local scope to do some steps
- Useful for creating private data
- Sometimes, while working with a large codebase, it is safer to work with a local scope than creating new variables in the main scope.

```javascript
(function () {
	console.log('hello');
})();
```

## Partial Function Application
- They are functions (generator) that return a function (applicator) that calls another function (primary function) with some of the arguments from the closures.
- they are used to reduce the number of arguments needed to supply