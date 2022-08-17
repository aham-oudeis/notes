# Filtering / Selection

`filter` takes a single argument, which should be a function object. This callback function is invoked once for each element in the array and is called with three arguments:
1. current element of the array
2. index of the current element
3. array being iterated over

if the return value of the callback is **truthy**, then the element will be included in the final array; otherwise, the element will be excluded

returns a new array containing the elements for which the callback returned a truthy value

### Build your own `filter`
```javascript
function myFilter(array, func) {
	let collection = [];
	for (let i = 0; i < array.length; i++) {
		if (func(array[i], i, array)) {
			collection.push(array[i]);
		}
	}

	return collection;
}
```

Related: [[transformation]]