# Interrogation
- `some`
- `every`


### Build your own `some` and `every`

```js
function mySome(array, func) {
	let verdict = false;

	for (let i = 0; i < array.length; i++) {
		if (func(array[i], i, array)) {
			verdict = true;
			break;
		}
	}

	return verdict;
}


function myEvery(array, func) {
	let verdict = true;

	for (let i = 0; i < array.length; i++) {
		if (!(func(array[i], i, array))) {
			verdict = false;
			break;
		}
	}

	return verdict;
}

// WARNING
// shouldn't be using forEach when one may want to break out of the iteration early
// forEach loops through the whole list

```


#warning