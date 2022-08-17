# Pure Functions

1. They do not have any side effects
2. When called with the same argument, they always return the same value.

# Side effects

A function call that performs any of the following actions is said to have side effects:
  1. It reassigns any non-local variable.
  2. It mutates the value of any object referenced by a non-local variable.
  3. It reads from or writes to any data entity (files, network connections, etc.) that is non-local to your program.
  4. It raises an exception.
  5. It calls another function that has side effects.

An example of a function that has no side effects but is not a pure function:

```javascript
let total = 100;

function addToTotal(num) {
  return total + num;
}

addToTotal(5); // returns 105

total = 200;

addToTotal(5); // returns 205
```


