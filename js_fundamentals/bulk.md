# Data Types

[source](https://launchschool.com/books/javascript/read/basics)

[Everything that follows is copied and pasted from LS book on Javascript, except for some of the code illustrations.]

JavaScript has five so-called primitive data types:
 * String
 * Number
 * Undefined
 * Null
 * Boolean

Data type values can be represented by literals. A literal is any notation that lets you represent a fixed value in source code. 

A string is a list of characters in a specific sequence.

An expression is anything that JavaScript can evaluate to a value, even if that value is undefined or null.

# Variables

A variable is simply a named area of a program's memory space where the program can store data. 

A variable declaration is a statement that asks the JavaScript engine to reserve space for a variable with a particular name. Optionally, it also specifies an initial value for the variable. JavaScript supplies several ways to declare variables, but the preferred way in modern JavaScript uses the let keyword:

```javascript
let something; //declaration
let somethingElse = 'hello'; //declaration with an initializer
```

When used in a declaration, the = is just a syntactic token that tells JavaScript that you're going to supply an initial value for the variable. However, in an assignment, the = is called the __assignment operator__.

Constants have an immutable binding to their values. Unlike an ordinary variable, once you declare a constant, you cannot assign it a new value. The constant will continue to have that value until the constant is no longer needed.

Note that const declarations require a value:

```js
const something; 
// raises an error saying that the constant declaration is missing an initializer
```
## Variable Assignment and Initializer

Initializers look a lot like an assignment, but are distinct in terminology. An assignment is a standalone expression that gives a variable a new value; an initializer is the expression to the right of the = in a variable declaration.
[source](https://launchschool.com/lessons/7377ece4/assignments/4a43f341)

```js
let someone = 'Peter'; //declaration with an initializer

let something; //declaration without an initializer
something = 'Person'; //assignment but not an initializer
```

# Variable Scope

A variable's scope determines where it is available in a program. The location where you declare a variable determines its scope. In JavaScript, variables declared with the let or const keywords have block scope. A block is a related set of JavaScript statements and expressions between a pair of opening and closing curly braces.

In general, blocks appear in `if...else if...else`, `while`, `do...while`, for, `switch`, and `try...catch` statements, or by themselves (as in the first example above).

The most notable rule (regarding variable scope) is that all undeclared variables have global scope: they ignore block and function scope entirely. If your program uses that same variable name in a different scope without declaring it, there's a good chance that it will step on the original variable by changing its content. 

# Functions

[source](https://launchschool.com/books/javascript/read/functions)

most languages have a feature called procedures that let you extract the code and run it as a separate unit. In JavaScript, we call these procedures functions.

Functions are called by typing their name and providing some optional values that we call arguments. ... Arguments let you pass data from outside the function's scope into the function so it can access the data. If the function definition doesn't need access to outside data, you don't need any arguments.

When JavaScript encounters the return statement, it evaluates the expression, terminates the function, and returns the expression's value to the location where we called it.

Functions that always return a boolean value, i.e., true or false, are called __predicates__. You will almost certainly encounter this term in future readings and videos, so commit it to memory.

Nested Functions: Such nested functions get created and destroyed every time the outer function runs. (This has a mostly negligible effect on performance.) They are also private functions since we can't access a nested function from outside the function where it is defined.

In JavaScript, there are two types of variables based on where they're accessible: __global variables__ and __local variables__. Global variables are available throughout a program, while local variables are confined to a function or a block. The keyword you use to declare a variable and the location where you declare it combine to determine whether the variable is global or local. 

Local variables are short-lived; they go away when the function that corresponds to their scope stops running. When we invoke the function, we start a new scope. If the code within that scope declares a new variable, that variable belongs to the scope. When the last bit of code in that scope finishes running, the local variables in that scope go away. JavaScript repeats this process each time we invoke a function.

in a process called __function composition__, JavaScript lets us use a function call as an argument to another function.

Passing the function call's return value to console.log is the canonical example of function composition in JavaScript. 

```js
let greetPeople = function () {
  console.log("Hello everybody!");
};
greetPeople();
```

Our example declares a variable named greetPeople and assigns it to the function expression after the = sign. We can do that since JavaScript functions are first-class functions. The key feature of first-class functions is that you can treat them like any other value. In fact, all JavaScript functions are objects. Thus, you can assign them to variables, pass them as arguments to other functions, and return them from a function call. 

# Arity

```js
function takeTwo(a, b) {
  console.log(a);
  console.log(b);
  console.log(a + b);
}

takeTwo(1, 2);

// logs:
1
2
3

takeTwo(1);

// logs:
1
undefined
NaN
```

 1. Calling a function with too few arguments does not raise an error.
 2. Within a function, an argument that wasn't provided in the call will have the value undefined.
 3. The `NaN `result is caused by the fact that `b` is undefined; it isn't a direct result of the missing parameter. It is merely JavaScript's standard behavior when a number and undefined are added.

# Functional Scopes and Lexical Scoping

A variable's scope is the part of the program that can access that variable by name. This is true in all programming languages. Specifically, variable scoping rules describe how and where the language finds and retrieves values from previously declared variables.

```js
let name = 'Julian';

function greet() {
  let myName = name;
  console.log(myName);
}

greet();   // => Julian
```
With this code, we now have two scopes: (1) the global scope and (2) the scope from the declaration of the greet function. In this code, name and greet are in the global scope, while myName is in the local scope of greet.

# Lexical Scoping

JavaScript uses Lexical Scoping to determine where it looks for variables; it uses the structure of the source code to determine the variable's scope. That is, the source code defines the scope. This means that when you write a function in your code, it creates a scope even if the function never gets executed and has no variables of its own. At any point in a JavaScript program, there is a hierarchy of scopes from the local scope of the code up to the program's global scope.

When JavaScript tries to find a variable, it searches this hierarchy from the bottom to the top. It stops and returns the first variable it finds with a matching name. This means that variables in a lower scope can shadow, or hide, a variable with the same name in a higher scope.

# Variable Shadowing

If a function definition has a parameter with the same name as a variable from an outer scope, the parameter shadows the outer variable:

```js
let name = 'Julian';

function greet(name) {
  console.log(name);
}
```

When this code runs, the value of `name` inside `greet` is not dependent on the value in the outer scope. Instead, `name` receives the value passed to `greet` in the invocation.

# Function Scope

At the top level of a program -- outside of any function -- function scope refers to the entire file. Some people use the term global scope to refer to function scope at the top level. Technically, that's a bit of a misnomer -- file scope or module scope would be better -- but most people talk about global scope, so we will too.

# Closures

the term first-class value or first-class object is used to describe values that meet the following conditions:

 * They can be assigned to a variable or an element of a data structure (such as an array or object).
 * They can be passed as an argument to a function.
 * They can be returned as the return value of a function.


# Flow control

[source](https://launchschool.com/books/javascript/read/flow_control)

When writing programs, you want your data to take the correct path. You want it to turn left or right, up, down, reverse, or proceed straight ahead when it's supposed to. We call this __flow control__.

# Arrays

`filter` iterates over the elements of the array. During each iteration, it invokes the callback function, using the value of the current element as an argument. If the callback returns a truthy value, filter appends the element's value to a new array. Otherwise, it ignores the element's value and does nothing. When filter finishes iterating, it returns the array of selected elements: the elements for which the callback returned a truthy value. 

`reduce` takes two arguments: a callback function and a value that initializes something called the __accumulator__. In its simplest form, the callback function takes two arguments: the current value of the accumulator and an element from the array. It returns a value that will be used as the accumulator in the next invocation of the callback.

# Operators

An operator is a symbol that tells the computer to perform operations on values (operands). 

Operators usually operate on two operands, as in the statement `a + b;`. Here, `+` is the operator and `a` and `b` are the operands. The surrounding operands serve as the operator's input.

A __comparison operator__ compares its operands and returns a boolean value (true or false).

```js
let a = 1;
let b = '1';

a == b; //returns true, non-strict equality operator
a != b; //returns false, non-strict non equality operator
a === b; //returns false, strict equality operator
a !== b; //returns true, strict non equality operator
```

```js
'a' < 'b';         // true
'Ant' > 'Falcon';  // false
// String comparisons use Unicode lexicographical ordering
'50' < '6';        // true ('5' precedes '6' lexicographically)
```
# Expression

Put simply, an expression is any valid code that resolves to a value.

Unlike expressions, __statements__ in JavaScript don't resolve to useful values. Instead, they control the execution of the program.

Just remember that statements help to "do something", instead of giving you a value to use.

# Implicit Coercion

JavaScript provides non-strict equality operators, == and !=, and strict equality operators, === and !==. The strict operators never perform type coercions. The non-strict operators have a set of rules for coercing types before performing the comparison.
