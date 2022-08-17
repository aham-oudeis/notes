# First Class Functions

Functions are first-class citizens, meaning they can be treated like any other value:
  1. Functions can be assigned to a variable
  2. Functions can be passed as arguments to other functions
  3. Functions can be returned from a function call

## Assigning to a variable

```js
function add(a, b) {
  return a + b;
}

let sum = add;

sum(4, 5)
```

## Passing functions as arguments

```js
function add(a, b) {
  return a + b;
}

[1, 2, 3].reduce(add, 0);
```

## Returning functions

```js
function add(a, b) {
  return a + b;
}

function makeAdder(num) {
  return function (otherNum) {
    return add(num, otherNum);
  }
}

let addFive = makeAdder(5); // makeAdder(5) returns an anonymous function

addFive(4)
```