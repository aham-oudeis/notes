## Context loss
Given the peculiarity of how the value of `this` is supplied by JS at function invocation, the value of `this` is not what one would expect it to be in some cases.

### Case 1:
When a method is taken out of the object and assigned to a variable, the value of `this` is no longer the object where the function is located.

```javascript
let obj = {
	a: 'hi',
	greet() {
		console.log(this.a);
	}
}

let sayHi = obj.greet;
sayHi(); //undefined

```

This is because when the function is invoked as a function, JS internally sets the value of `this` to the global object. 

Inside the `greet` method, `this` references the global object. Since there is no 	 key `a` in the global object, it returns `undefined `and that is logged to the console.

One way to deal with this situation is to hard bind the function with the object and pass the function around. That way, whenever the function is invoked, there is no issue about losing the value of `this`.

### Case 2:
Function inside of a method when invoked as a function (without a caller) has the value of `this` set to the global object.

```javascript
let person = {
	name: 'Mosh',
	msg1: "How are you?",
	msg2: 'Are you happy?',
	greet() {
		function message() {
			return this.msg2;
		}
			
		console.log(this.name, message());
	}
}

person.greet(); // Mosh undefined
```

The function invocation `message()` inside of the `greet` method invocation returns undefined, because the value of this inside the function `message` defaults to the window object and since `msg2` key is not present in the global object, it returns `undefined`.

#### Solution 1
One way to handle this problem is to capture the value of `this` in the outer scope and use that value inside the function:

```javascript
let person = {
	name: 'Mosh',
	msg1: "How are you?",
	msg2: 'Are you happy?',
	greet() {
		let self = this;
		function message() {
			return self.msg2;
		}
			
		console.log(this.name, message());
	}
}

person.greet(); // Mosh Are you happy?
```

#### Solution 2
Another way to address this issue is to use arrow function, since arrow functions inherit the value of `this` from their lexical scope.

```javascript
let person = {
	name: 'Mosh',
	msg1: "How are you?",
	msg2: 'Are you happy?',
	greet() {
		const message = () => {
			return this.msg2;
		}
			
		console.log(this.name, message());
	}
}

person.greet(); // Mosh Are you happy?
```

#### Solution 3
Or, pass the value of `this` while calling the function or bind the function with the value of `this`;

```javascript
let person = {
	name: 'Mosh',
	msg1: "How are you?",
	msg2: 'Are you happy?',
	greet() {
		function message() {
			return self.msg2;
		}
			
		console.log(this.name, message.call(this));
	}
}

person.greet(); // Mosh Are you happy?
```

#### Solution 4

Using Bind

```javascript
let person = {
	name: 'Mosh',
	msg1: "How are you?",
	msg2: 'Are you happy?',
	greet() {
		const message = (function () {
			return self.msg2;
		}).bind(this);
			
		console.log(this.name, message());
	}
}

person.greet(); // Mosh Are you happy?
```

### Case 3
When the callback functions have a reference to `this` that gets invoked as a functions from inside another function.

```javascript
function repeatThreeTimes(func) {
	func(); //if func has a reference to `this`, then this will be a problem
	func();
	func();
}

let person = {
	firstName: 'Hafiz',
	lastName: 'Sheikh',
	greetings() {
		repeatThreeTimes(function() {
			console.log('hello, ' + this.firstName + ' ' + this.lastName);		
		});
	},
};

person.greetings();
```

The issue here is that while defining a function, we might think that `this` references the object inside which the function is located, but this is not how JS works. 

What we need to look at is how the function is invoked, when it is invoked. Since the function argument is invoked as a function, JS implicitly sets the value of `this` to the global object. Since the global object does not have the property `firstName` and `lastName`, we get `undefined` where we expect `Hafiz` and `Sheikh`. 

This kind of thing happens when we pass a callback function to array methods such as `forEach`, `map`, `filter`. These methods invoke the callback functions such that the value of `this` is set to the global object. 

To avoid this problem, we can either store the value of `this` in a local variabel and use the variable instead of `this` keyword, or pass in the value of `this` along with the function, or pass a bound function or use an arrow functions.

Strict mode helps with this issue, because the default value of `this` is set to undefined. Hence, when we invoke a function that tries to access the value of `this` and expect it to have a property, we get an error.