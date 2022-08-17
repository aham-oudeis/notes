# Strict Mode

__Strict Mode__: an optional mode of using JS that modifies the semantics of JS to prevent certain errors and syntax. 

It is enabled by adding "use strict" at the beginning of required scope (top of the file or top of the function but not for blocks). But it cannot be added partway through the program. Nor can it be disabled.

Here, 'use strict` is an example of __pragma__, a language construct that tells a compiler, interpreter, or other translator to proceess the code in a different way. 

Strict mode makes three significant changes:
  1. eliminates silent errors by changing them to raise errors
  2. prevents code that may inhibit JS's performance
  3. Prohibits certain names/syntax that may conflict in the future

One important case where JS throws an error is when a variable is assigned a value without prior declaration of the variable. 

```js
let someWeirdObject = {};

function changeObject {
  someWeirdOBject = { name: 'Gogol' } // a typo while tying the name of the variable
}
```

In sloppy mode, this code defines the variable `someWeirdOBject` as a property on the global object. But in strict mode, it throws an error. 