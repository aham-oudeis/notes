
* assignments and comparison
-they are both operators
-assignment has very low precendence
-comparison involves loose/strict and logical comparisons
-assignment without declaration creates a property on the global object

* variable scope, especially how variables interact with function definitions and blocks
  -variable scope is determined by:
  -how it is declared (let/var/const)
  -where it is declared (function/block/global)
  -JS uses lexical scoping
    -structure of source code defines scope
    -whichever scope the variable is declared in, the variable is
     available in all its children scopes

* function scope
-function scope as opposed to global scope
  -variables declared with `var` have function scope, but variables declared with `let` and `const`
  -keywords have block scope.
  -this is the sense captured by 'declared scope'
-function scope as opposed to global scope
  -this is the sense captured by 'visibility scope'
  -the idea is that functions create an inner scope
-the scope of function definitions
  -function declarations have function scope
  -function expressions would depend on the declaration (var/let)

primitive values, types and type conversions/coercions
-primitive types are: string, number, boolean, null, undefined
-primitives are immutable
-null and defined don't have any methods
-pass by value when they are passed to functions
/method invocation
-when operands are different types, implicit coercion may occur

object properties and mutation
-objects are mutable
-pass by reference when they are passed to functions
-key/value pairs are object properties

understand the differences between loose and strict equality
-loose equality operator
  -if they are different types, they are coerced
-strict equality operator
  -same type and value

how passing an argument into a function may or may not permanently change the value that a variable contains or points to
-primitives are pass by value
-objects are pass by reference

working with Strings, Arrays, and Objects. In particular, you should be thoroughly familiar with the basic Array iteration methods (forEach, map, filter, and find) and how to use Object methods to access the keys and values in an Object as an Array.
-these methods take callback functions as arguments
-the return value of the callback functions may be used by the iteration methods

understand that arrays are objects, and be able to determine whether you have an Array
-Array.isArray

console.log vs return
-console.log returns undefined

truthiness: false and true vs. falsy and truthy
-Truthy values: null, undefined, 0, '', false, NaN  

function definition and function invocation
-Functions are defined then invoked 

function declarations, function expressions, and arrow functions
-Declarations start with the function keyword
-Expressions are any other way of defining a function
  -Functions assigned to variables
  -Function within parentheses
-Arrow functions have an implicit return value if the function body contains one expression

implicit return value of function invocations
-undefined, unless there is an explicit return

first-class functions
-variables as pointers

partial function application
side-effects
naming conventions (legal vs idiomatic)
pure functions and side effects
strict mode vs. sloppy mode
JavaScript syntactic sugar
(Closures)
(Hoisting)
(variables as pointers)

Q1
a = 1;

On line 1, `a` is assigned to `1`. Since this is an undeclared variable, `a` becomes a property on the global object. When this code is executed in strict mode, this throws an error as this practice is frowned upon.


Q2
```js
function hello() {
  let a = 1;
}

hello();
```

On line 5, the `hello` function is invoked. Inside the `hello` function, the variable `a` is declared with the `let` keyword and initialized to `1`. Variable `a` is local to the function `hello`, and cannot be accessed outside of it.

Q3

let a;

On line 1, the variable `a` is declared with the `let` keyword. Since it is declared without an initializer, `a` is implicitly initialized to `undefined`. Since it is declared in the global scope, `a` is a global variable.


Q4
```js

let a = 1;

if (true) {
  a = 2;
  let b = 3;
}

a; // 2
b; // error
```

On line 1, variable a is declared with the let keyword and initialized to 1. Since a is declared in the global scope, it is a global variable. 

The structure between lines 3-7 denotes a block. Within the block, `a` is reassigned to `2` on line 5. Next, on line 6, variable `b` is declared with the `let` keyword and initialized to `3`. Variables declared with the `let` keyword are block-scoped, and therefore `b` is local to the block between lines 3-7.

Consequently, line 9 returns `2` and line 10 raises an error.

This example demonstrates variable scoping rules in JavaScript. Specifically, blocks can access variables declared outside its own scope. However, variables local to the block cannot be accessed outside the block.

Q5
```js
let a = 1;

if (true) {
  let a = 2;
}

a; // 1
```

On line 1, variable `a` is declared with the `let` keyword and initialized to `1`. Since `a` is declared in the global scope, it is a global variable.

The structure between lines 3-7 denotes a block. Within the block, another variable `a` is declared and initialized to `2`. Variable `a` declared on line 4 is local to the block between lines 3-5, and is different from `a` declared on line 1. Moreover, this block-scoped `a` *shadows* and prevents access to the global-scoped `a`.

As a result, line 7 returns `1`.

This example demonstrates variable shadowing; specifically, access to an outer-scoped variable is prevented when there is a local variable with the same name.

Q6
```js
let a = "hello";
let b = [1, 2, 3];

function change(arg1, arg2) {
  arg1.toUpperCase();
  arg2.reverse();
}

change(a);

a; // hello
```

On line 1, variable `a` is declared and initialized to `'hello'`. On line 2, `b` is declared and initialized to `[1, 2, 3]`.

On line 9, the `change` function is invoked with `a` and `b` passed in as arguments. `a` is pass-by-value, meaning `a` local to the function is initialized to `'hello'`. `b` is pass-by-reference, and therefore is not an alias to the global `a`.  
`b` local to the function is initialized to the object that the global variable `b` points to. Hence, no method invocation on string mutates the string, but the array object is mutated by the reverse method invocation. Thus, `a` retains its value but the object that `b` points to is mutated. 

