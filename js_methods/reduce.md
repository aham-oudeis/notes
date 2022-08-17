# Reducing / folding

`reduce` method takes a required function argument and an optional `initialValue` for the accumulator. 

`reduce` invokes the callback function once for each element in the array and passes four arguments to the callback function on each call:
1. `accumulator` : the return value of the previous callback function
2. `currentValue`: the value of the current element in the array
3. `currentIndex`: index of the current element
4. `array`: array being processed

### Build your own `reduce`
```js
function myReduce(array, func, initialValue) {
	let acc = initialValue;

	if (acc === undefined) {
		acc = array[0];
		array = array.slice(1);
	};

	const foldAcc = function (element, index, array) {
		acc = func(acc, element, index, array);
	}

	array.forEach(foldAcc)
	
	return acc;
}
```

Related: [[interrogation]]