# Error

* When error occurs in JS, it is said to *throw* an error

## ReferenceError

A `ReferenceError` occurs when you attempt to use a variable or function that does not exist.

## TypeError

A `TypeError` occurs when you try to access a property on a value that does not have any properties, such as `null`. 

Trying to call something that isn't a function throws a `TypeError`.

## SyntaxError

A `SyntaxError` usually occurs immediately after loading a Javascript program, and before it begins to run. 

* While `ReferenceError` and `TypeError` are encountered at runtime, `SyntaxError` is detected before runtime.
* One exception is with the following: `JSON.parse('not really JSON')` throws a `SyntaxError` at runtime. 

# Guard Clause

A __guard clause__ is a code that guarantees that data meets certain preconditions before it gets used. For instance, we want to ensure that the string passed in is not an empty string before trying to access the first character. 

## Catching errors

```js
try {
  //perform some tasks that might fail
} catch (error) {
  //this code runs if the code in the try clause throws an error
} finally {
  // this code always runs, no matter if the above code throws an error or not
}
```