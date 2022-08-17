# Iterating through Objects

Since there are no decent methods for iterating through object, we just have to convert the object to an array and work with the arrays.

When we need to return an object, we convert the array back to an object

Helpful methods:

- `Object.keys(obj)`
- `Object.values(obj)`
- `Object.entries(obj)`: returns a nested array with key and value as the first and last element
- `Object.fromEntries(nestedArr)` : converts the nested array into objects and returns the object

```js
let myObject = { a: 1, b: 2, c: 3 };

Object.keys(myObject).forEach((key) => {
	console.log("Key: " + key + " | value: " + String(myObject[key]));
});
```

```js
// map to a new object with values doubled from myObject

function transformValues(object, func) {
	let objEntries = Object.entries(object);
	let objMapped = objEntries.map(func);

	return Object.fromEntries(objMapped);
}

const doubler = ([key, value]) => [key, value * 2];

let myObject = { a: 1, b: 2, c: 3 };

transformValues(myObject, doubler);
```

```js
// filter an object to select based on the callback function

function filterObject(obj, func) {
	let objEntries = Object.entries(obj);
	let objFiltered = objEntries.filter(func);

	return Object.fromEntries(objFiltered);
}

const onlyEven = ([key, value]) => value % 2 === 0;

let myObject = { a: 1, b: 2, c: 3 };

filterObject(myObject, onlyEven);
```

```js
// reduce based on values

function reduceObj(obj, func) {
	return Object.values(obj).reduce(func);
}
```
