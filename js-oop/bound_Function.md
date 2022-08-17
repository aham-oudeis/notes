##  How `bind` might work

Here is how the bind method might be defined:

```javascript
Function.prototype.bind = function (...args) {
	// extract the first argument that is to be used as the value of this
	let thisArg = args.shift();
	
	//since functions are objects, calling a bind method on a function would 
	// set the value of this to the function object. we extract the function 
	// with the this keyword
	let funcToBeInvoked = this;
	
	return function (...rest) {
		// when this function is executed, the value of `this` is set by JS
		// but this does not affect value of `this` inside of the function to 
		// be invoked, bc it is designed to be invoked with the thisArg
		//call the function with prefilled arguments and 
		//then the arguments that are passed 
		return funcToBeInvoked.call(thisArg, ...args, ...rest);
	}
}

```
