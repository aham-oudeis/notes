# iteration
While there are several ways to iterate:`for`, `while`, `do...while`, the preferred way is to use `forEach` method.

`forEach` invokes the callback function once for each element in the array with three arguments:
1. the value of the current element in the array
2. the index of the current element
3. the array being processed

`forEach` does not use the return value of the callback. 

`forEach` returns `undefined`; hence, its use lies in having side-effects


### Build your own `forEach`

```javascript
function myForEach(array, func) {
	for (let i = 0; i < array.length; i++) {
		func(array[i], i, array);
	}
}

let min = Infinity;
let getMin = value => (min = value <= min ? value : min);
myForEach([4, 5, 12, 23, 3], getMin);
	console.log(min);
```

Related: [[filtering]]