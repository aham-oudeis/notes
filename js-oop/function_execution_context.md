Summary: In function invocations, the value of`this` resolves to the global object and in method invocations, the value of `this` resolves to the calling object. 

Bound functions are slightly tricky. Although the value of `this` is assigned dynamically, the inner function is already set to call another function with a different value of `this`.

In strict mode, the value of `this` resolves to `undefined` for function invocations. 

Aside: I think it is confusing to refer to the value of `this` as the function execution context. See [Execution Context](execution_context.md) for more details, but LS uses this phrase 'fucntion execution context' to refer to the value of `this`. Hence, I'll keep the notes following LS convention.

> Every time a JavaScript function is invoked, it has access to an object called the **execution context** of that function. This execution context is accessible through the keyword `this`. A JavaScript function can be invoked in a variety of ways. Which object `this` refers to depends on how the function was invoked.

[source](https://launchschool.com/lessons/c9200ad2/assignments/4cc36fd6)

Then there are two types of execution contexts:
1. Implicit: This is an execution context that JS 'implicitly' sets
2. Explicit: This is an execution context that we can 'explicitly' set

Again: It is much cleaner to think of 'implicit' and 'explicit' value of `this` rather than execution context. Or, 'implicit' or 'explicit' binding for functions. 

Basically, when a function is invoked without a receiver/caller, then the implicit binding of the function is the window object. 

```javascript
function test() {
	return 'value of this is:' + this;
}

test(); // 'value of this is: [object Window]'
```

When a function is invoked in this way, JS sets the value of `this` to the global object.

However, when a function is invoked on some object, i.e. as a method, the value of `this` is set to the receiver or calling object.

```javascript
let obj = {
	test() {
		return 'value of this is:' + this; 	
	},
}

obj.test(); // 'value of this is: [object object]'
```

A bit weird example, but works the same:

```javascript
let listOfFuncs = [
	function() {return this[1];},
	'greetings!'
];

listOfFuncs[0](); //since the value of this is set to the current array, this[1] returns the element at index 1.
```

But, when the function is not invoked with an explicit caller, the value of `this` is changed to the global object.

```javascript
let obj = {
	test() {
		return 'value of this is:' + this; 	
	},
}

obj.test(); // 'value of this is: [object object]'

let outsideTest = obj.test; // assigns the function to a new variable

outsideTest(); // 'value of this is: [object Window]'

```

One way to understand this is to think of `this` as a value that JS passes to the function invocation just like JS passes an `arguments` object. Just as the value of that `arguments` object is set at the time of function invocation, the value of `this` is also set at the time of function invocation. Contrast lexical scope, which is set based on where the function is defined. 

[[setting_`this`_explicitly]]