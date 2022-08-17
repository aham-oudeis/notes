# Arrays

An array is an ordered list of __elements__, where each element has a unique non-negative integer as its index number that gives its position in the array. Elements can be a value of any type. Since arrays can have different types of values as elements, they are heterogenous.

* `Array.prototype.indexOf` returns -1 if the value it is passed is not an element of the array, even if the value is associated with a non-index property. 
* To count all of the properties in an Array object, use `Object.keys(array).length`
* The number of elements in an array isn't necessarily the same as its length: there can be gaps in the array. 

__Weird Bits__
1. Arrays are objects. `typeof [1, 2, 3] // object`
2. Elements are different from properties. Any value other than non-negative integer is a property.

    ```javascript
    let a = [1, 2, 3, 4];
    
    a[-1] = 'hi' // a property and not an element

    Object.keys(a); //[1, 2, 3, 4, '-1'] all the properties and elements show up
    ```
3. You can decrease the `length` property to truncate the array.
4. Increasing the `length` property expands the array but the new elements do not get initialized. They are in a weird 'unset' state. Although trying to access their values returns `undefined`, they do not partake in iteration.

Although, array objects can have keys that are not non-negative integers, they do not count towards the elements length.

The length property of the array is an integer 1 higher than the highest non-negative integer.

```javascript
let array = [1, 2, 3];

array.length;
//=> 3

array['something'] = 'stuff';
array[-1] = 'negative number';

array.length;
//=> 3

array;
//=> [ 1, 2, 3, something: 'stuff', '-1': 'negative number' ]
```

Since `typeof [] //=> 'object'`, to test whether an object is an array, we can use the following method: `Array.isArray([]) //=> true`.

## Iteration Methods

`forEach`

`forEach` method is invoked on an array with a callback function passed in as an argument. `forEach` iterates through the array and invokes the callback function with each element passed in an an argument. `forEach` returns undefined.

`map`

`map` method in invoked on an array with a callback function passed in as an argument. `map` iterates through the array and on each iteration invokes the callback function with the current element passed in as an argument. `map` returns a new array populated with the return values of the callback function.

One benefit of using `map` over using `forEach` to get the same result is that `map` avoids side-effects.

`filter`

`filter` method is invoked on an array with a callback function passed in as an argument. `filter` method returns a new array populated with all the elements for which the callback function returned a truthy value.

`reduce`

`reduce` method effectively reduces the contents of an array to a single value. `reduce` takes two arguments: (1) a callback function, and (2) a value that initializes the __accumulator__. Furthermore, the callback function takes two arguments: (1) current value of the accumulator, and (2) an element from the array.

On each iteration, `reduce` passes the value of the accumulator and the current element to the callback function. The accumulator is set to the return value of the callback function and on the next iteration the value of the accumulator and the current element is passed to the callback function. When the iteration is complete, `reduce` returns the accumulator.



