Async functions always return a promise. If the return value of an async function is not explicitly a promise, it will be implicitly wrapped in a promise.

```javascript
async function foo() {
	let result = await Promise.resolve(1);
	console.log('after the first await');
	return result;
}

console.log('before calling the async function');
console.log(foo());
console.log('before the await....')

/*
=> before calling the async function
=> Promise{<pending>}
=> before the await...
=> after the first await

The Promise object that is printed on the console shows that the aync function returns a promise object that is in pending state. The promsie gets resolved in the next event loop cycle. Hence, the line 'before the await ...' gets printed. Then the execution moves to the line after await.
*/
```