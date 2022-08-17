# Functions and Methods
- Methods are functions with a calling object / receiver.
- If a function is invoked with an explicit receiver, then it is a method invocation
- Otherwise, it's a function invocation

```javascript
let person = {
	name: "Herman",
	speak: function() {
		console.log('Hello, friend! How have you been?');
	}
}

function saySomething() {
	console.log('Hi! What I say is false!');
}

//the function saySomething is invoked without an explicit receiver
//it is a function call
saySomething();

//the function speak is invoked with on an object
//it is a method call
person.speak();
```