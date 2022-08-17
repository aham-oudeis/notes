# Transformation / map

### Build your own `map`

```javascript
function myMap(array, func) {
	let collection = [];
	const transform = 
					(element, index, array) => collection.push(func(element, index, array))
		
	array.forEach(transform);

	return collection;
}
```


Related: [[reduce]]