# Functions

Key points:

1. Function create an inner scope.
2. Functions are first-class citizens, meaning they can be treated like any other value:
  i. Functions can be assigned to a variable
  ii. Functions can be passed as arguments to other functions
  iii. Functions can be returned from a function call
3. Functions have lenient arity, meaning js won't complain about the number of arguments supplied.
4. Functions without a `return` keyword implicitly returns `undefined`

__Nested Functions__: They are created and destroyed every time the outer function runs. They cannot be accessed outside of the function where they are defined.

__Function composition__:Using function invocations as an argument to another function. For example: `console.log(String(undefined))`.


## Three ways to define a function

__Function declaration__: line starts with function keyword
* function declarations are hoisted

```js
function hello() {
  console.log('hello');
}
```

__Function expression__: line does not start with function keyword.
* function expressions are not hoisted

```js
(function hello() {
  console.log('hello');
})

const hi = function () {
  console.log('hi')
}

function makeGreeter(name) {
  //the following is a function expression
  return function greeter() {
    console.log("Hi, " + name + "!");
  }
}
```

__Arrow functions__: concise syntax
* we can omit return statement when the function body contains a single expression
    * in such cases, the expression is written without a block
* if you use a block, you need to include the return statement
* when there is only one parameter, the brackets around it can be omitted
* Should not be used to define methods for objects

```js
let add = (x, y) => {
  return x + y;
}

let add = (a, b) => a + b;
```
