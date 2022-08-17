## Promises and async/await
Promises are the underlying javascript constructs that facilitates asynchronous operations.

Instead of nesting callback functions to ensure that the order of operations are performed accurately, JS provides a way of returning an object that gets resolved at a future time. All the functions we attach to the promise (using `then` method) gets added to the list of functions to be called when the promise is resolved to a value. 

```javascript
let promise = new Promise((res, rej) => {
	let a;
	//let's use some async functions
	setTimeout(() => {
		a = Math.floor(Math.random() * 10) + 1;

		if (a <= 5) {
			res("The number is small enough: " + a);
		} else {
			rej("The number is a bit large: " + a);
		}
	}, 3000);
})

promise.then((value) => console.log(value))
			 .catch((error) => console.log("error: ", error));
```

What is happening here is that we create a new promise object and pass in a callback function with two parameters. Inside the callback function, we perform an asynchronous operation by invoking a `setTimeout` method and passing in a callback function to be invoked after 3 seconds. 

The promise object stored in the `promise` variable is not resolved untill the callback function is invoked. Untill then the promise object is in a `pending` state.

By invoking the `then` method on the promise object, we are simply adding the passed in functions to a list of things to be done once the promsise object resolves to a value. That is, the functions passed to the `then` and `catch` method are scheduled. 

Once the promise object resolves to a value, depending on the outcome of the asynchronous function, promise might be rejected or resolved. If it is resolved, the functions scheduled to be performed are executed in order. If it is rejected, the function scheduled to be performed (passed in to the `catch` method) is executed.

[[async await]]