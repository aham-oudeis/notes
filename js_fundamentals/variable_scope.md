# Variable Scope

A variable scope determines where the variable is available in the program. The location where the variable is declared along with the keyword with which the variable is declared determine its scope. In Javascript, variables declared with `let` and `const` keywords have block scope. What this means is that if variables are declared with `let` and `const` keywords inside of a block, then those variables are not available outside of that block. But variables declared with `var` keyword have function scope. 

In general, blocks appear in `if...else if...else`, `while`, `do...while`, for, `switch`, and `try...catch` statements, or by themselves. That is, the curly braces in the function definition is not a block. 

For example:

```javascript
function test() {
  if (true) {
    let hi = "hi, stranger!";
    var hello = "hello, stranger";
  }

  console.log(hello); //logs 'hello, stranger' to the console
  console.log(hi); //this throws an error
}

console.log(hello); //this throws an error because variables declared with `var` keyword have function scope
```
In the above example, the varible `hi` is declared with `let` keyword and thus has block scope. That means, it is not available outside of the block where it is declared. Hence, when we try to use the variable outside of the block, it throws an error. 

But, the variable `hello` has function scope because it is declared with `var` keyword. That means, the variables declared with `var` keyword are declared in the scope of the enclosing function. Hence, when we use the variable `hello` outside of the block but inside of the function, it logs the value stored in the variable. Furthermore, since `hello` has function scope, the variable is not available outside the function. 

Since Javascript uses lexical scoping rules, in looking for the value stored in a varible js finds and returns the variable from the closest enclosing scope. Hence, a variable declared in an inner scope can shadow a variable declared in the outer scope. One can also think in terms of the hierarchy of scopes, so that the topmost scope is the global scope. I prefer to think in terms of outer scopes enclosing inner scopes. 

For example:

```javascript
let animal = 'zebra';

function test() {
  let animal = 'kangaroo';

  console.log(animal); //this logs 'kangaroo' because the variable declared in the inner scope shadows the variable from the outer scope
}
```

Both functions and blocks create an inner scope in js. (Unlike js, ruby methods create a self-contained scope)
