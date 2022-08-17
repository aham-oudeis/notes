```javascript

```


Q1

The first code snippet logs `undefined` and the second code snippet throws an error, because:
1. the variables declarations are hoisted to the top of their respective scope
2. when variables declared with `var` keyword are hoisted, they are assigned the value `undefined` but when variables declared with `let` keyword are hoisted, they are not assigned any value.
3. Hence, in the first code snippet, on line 3 the variable `speak` has the value undefined and that is what is output and in the second code snippet, on line 3 the variable `speak` is not assigned any value and hence it throws an error complaining that the variable cannot be accessed before initialization.

More detail: 

in both code snippets, we use the pragma, `use strict` on the first line to enfore a strict mode. 

on line 3 the expression `speak` is used to determine the kind of value stored in the variable. 

Since in the code snippet 1, the variable `speak` is declared with `var` keyword on line 5 and intialized to an anonymous function (a function expression), what is hoisted is only the variable declaration and its value is simply initialized to `undefined`. 

Since in the code snippet 2, the variable `speak` is declared with `let` keyword on line 5 and intialized to an anonymous function (a function expression), what is hoisted is only the variable declaration and its value is not assigned. But the variable is visible on liine 3. Hence, the error thrown is peculiar: it does not say that the variable is not defined, rather it says that the variable is not accessible before initialization.

Q2

```javascript
function testHoisting() {
  console.log(two);

  if (true) {
    let one = "variable declared with let keyword";
    var two = "variable declared with var keyword";
  }
}

testHoisting();
```

```javascript
function testHoisting() {
  console.log(two);

  if (true) {
    console.log(one)
    let one = "variable declared with let keyword";
    var two = "variable declared with var keyword";
  }
}

testHoisting();
```

```javascript
function testHoisting() {
  console.log(two);
  console.log(one)
  if (true) {
    let one = "variable declared with let keyword";
    var two = "variable declared with var keyword";
  }
}

testHoisting();
```

The three code snippets above shows the difference between the variables declared with `var` and `let` keyword. 

The first code does not raise an error, because variables decalred with `var` keywords have function scope and hence the variable declarations are hoisted to the top of its scope. 

The second code raises an error, but the error thrown is peculiar: it does not say that the variable is not defined, rather it says that the variable is not accessible before initialization. Although the variables declared with `let` keyword are hoisted to the top of their scope (block scope), it does not say that the variable is not defined.

And the third code reveals that the scope of the variables declared with `let` keywords have block scope and not function scope, because JS complains that the variable `one` is not defined. 

The above code throws an error complaining that the variable `one` is not defined, because the variable `two` declared with the `var` keyword is hoisted to the top of the function but the variable `one` declared with the `let` keyword is not available outside of the block where it is defined. This is because variables declared with `var` keyword have function-scope and variables declared with `let` keyword have block-scope.


Q3

1. Variables assignments without prior declarations of the same variable does not raise an error but assigns a new property to the global object. 

```js
let someWeirdObject = {};

function changeObject {
  someWeirdOBject = { name: 'Gogol' } // a typo while tying the name of the variable
}
```

In sloppy mode, this code defines the variable `someWeirdOBject` as a property on the global object. But in strict mode, it throws an error. 

2. Operations on string that seek to change the value of the string do not throw an error in the sloppy mode:
   
```javascript
let hi = 'hello, stranger';

hi[0] = 'H';
```

3. Using a number that begins with 0.

```javascript
let number = 01837;
```

In sloppy mode, this does not throw an error, but in strict mode JS throws an error. 

Q4

Line 6 when executed logs `42` to the console, because variables declared with `var` keyword have function scope. 

Although the variable `number` is declared inside the block on line 3, the variable `number` is available throughout the enclosing function. Since the if-condition evaluates to `true` the block is executed and the value of the variable `number` is assigned the value `42`. It is this value that is available at line 6 and it is the output.

Q5

```javascript
function concatenate(str1, str2) {
  function joinStrs(newString) {
    return str1 + newString;
  }

  if (str2 === undefined) {
    return joinStrs;
  } else {
    return str1 + str2;
  }
}
```

Q6

Line 8 logs `"Hello, Jackie."` to the console, because:
1. On line 1 a `greeting` variable is declared and initialized to string `Hi`.
2. On line 7, the `greeting` variable is reassigned to `Hello`.
3. When on line 8, the `greet` function is invoked with string `Jackie` passed to it as an argument, execution jumps to line 3 and the local variable `name` is assigned the value `Jackie`. 
4. The `greet` function invocation returns a string with the value of the `greeting` variable and `name` variable joined together with a comma and a space. 
5. But the variable `greeting` is not defined in the local scope of the function, hence JS looks for the variable in the parent scope and finds it there. Since the function `greet` is invoked after the reassignment of the `greeting` variable, the new value of the `greeting` variable is reflected. 

This demonstrates the fact that functions are closures in javascript and the lexical scoping rules. 

Q7
The code logs `NaN` because of two behaviors:
1. variables declared with `var` keyword are hoisted and implicitly initialized to `undefined`.
2. When `undefined` is one of the operand and the other being a number, JS coerces `undefined` to a number and returns the value `NaN`. 

So, on the first line, `a` on the right side of the `=` returns `undefined` and the whole expression `undefned + 1` returns `NaN`. This is the value that is stored in the variable `a`. Hence, that's the output from line 2.

Q8
When the execution reaches line 5, there are 4 variables, 5 primitive values (1, 2, 3, 'abc', `undefined`), and 2 objects (array that `a` points to and object that `c` points to).

Q9

```javascript
function doSomethingStrange(arg) {
  //say there is a lot of code inside the function
  //and it is hard to reason about how the function works
}

let a = 'hello';

doSomethingStrange(a);

console.log(a);
```

The beauty of immutability of strings is that without having to read any of the code inside the function body of the `doSomethingStrange` function (as long as there is no variable reassignment inside the function), we can infer that that the code logs `hello` to the console (assuming that the `doSomethingStrange` function invocation does not throw an error). You can't make that inference if the value stored in `a` were not a primitive value, because the objects can be mutated with method calls or function calls.

Q10

There are four variables in the global scope (`foo`, `bar`, `greet`, `greeting`).

There is one local variable inside function `greet`, namely `name` variable.


Q11

The code given logs `1` to the console, because:
1. on line 1, a variable `counter` is declared with `let` keyword and initialized to `0`. Since the variable is declared at the top scope, the variable acts like a global variable.
2. on line 7, the function `incrementCounter` is invoked and execution jumps to line 3 and the code in the function body is executed.
3. inside the `incrementCounter` function, the `counter` variable is reassigned to a new value by incrementing it by 1. Since the `counter` variable is not local to the function, JS finds the variable in the global scope, where its value is 0. Hence, `0` added to `1` returns 1 and that is what the `counter` variable is reassigned to.  The `counter` variable is accessed and reassigned from the inner scope. 

This demonstrates the concept of local variable scoping rules in JS, in particular the fact that variables declared in the outer scope can be accessed and reassigned from the inner scope.


Q12

The given code logs `0` to the console, because:
1. on line 1, a variable `counter` is declared with `let` keyword and initialized to `0`. Since the variable is declared at the top scope, the variable acts like a global variable.
2. on line 7, the function `incrementCounter` is invoked and execution jumps to line 3 and the code in the function body is executed.
3. inside the function, a local variable `counter` is declared with `var` keyword and initialized to a value of adding `1` to the hoisted value of `counter`, namely `undefined`. Since variables declared with `var` keywords have function scope, the variable is local to the function. Since JS finds the variable `counter` in the local scope, it stops looking and does not go to the global scope to find the variable. This phenomena is called variable shadowing. The function implicitly returns `undefined`. It does not affect the variable `counter` from the global scope.
4. Hence, the value of `counter` in the global scope remains the same, i.e., `0`. And this is the output.

Q13

The given code logs `0` to the console, because:
1. on line 1, a variable `counter` is declared with `let` keyword and initialized to `0`. Since the variable is declared at the top scope, the variable acts like a global variable.
2. on line 7, the function `incrementCounter` is invoked with the value of `counter` passed to it as an argument. Execution jumps to line 3 and a local variable `counter` is initialized to the argument, i.e., `0`. And the code in the function body is executed.
3. Inside the function, the local variable `counter` is then reassigned to a new value by adding 1 to its previous value. Hence, `counter` is reassigned to `1`. 
4. Since a new variable `counter` is local to the function, it shadows the global variable of the same name. Hence, from this point on the global variable cannot be reassigned from inside the function.
5. Hence, the value of the `counter` variable in the global scope remains the same, i.e., `0`. And this is the output.

Q14
Line 2 of the code throws an error complaining that the `go` function is not defined, because
1. on line 6, the function `run` is invoked and execution jumps to line 1 and the code in the function body is executed.
2. on line 2, when JS tries to find a variable named `go` it cannot find it in its lexical scope. 
3. Although it may seem like there is a function declaration afterwards and that must have been hoisted, in fact what is returned is a function expression with the name `go`. But this `go` name of the function is accessible only inside the function and it is not available outside of the function.
4. Hence, JS cannot find the `go` identifier in its scope and thus throws a `ReferenceEError`.

Q15
The first two lines output false, because both the loose equality operator and the strict equality operator, when both the operands are objects, checks if the two operands are the same object. But the two operands on first and second lines are not the same object. They are two distinct array objects. Hence, the first two lines output `false`.

However, when using loose equality operators, if the operands are of different types, then JS coerces either one or both operands to the same type and then evaluates its value.  On line 3, both the empty string coerced to a number and an empty array coerced to a number have the same value, `0`. Hence, the line 3 outputs `true`.

Q16

The code will not raise error, because JS functions have lenient arity. That means:
   1. Calling a function with too few arguments (less arguments than there are function parameters) does not raise an error.
   2. Nor does calling a function with too many arguments (more arguments than there are function parameters) raise an error. 

Q17

The `swapEnds` function is not a pure function, because it mutates the array passed to it as an argument, by swapping the values stored in the first and the last index.

Pure functions satisfy the following two conditions:

1. They do not have any side effects
2. When called with the same argument, they always return the same value.

Since mutating the object that a non-local variable points to counts as a side-effect, it is not a pure function.



Q18

```javascript
function swapEnds(array) {
  let arr = [...array];
  let first = arr[0];
  let last = arr[arr.length - 1];

  arr[0] = last;
  arr[arr.length - 1] = first;
  return arr;
}

let numbers = [1, 2, 3, 4];
swapEnds(numbers);
console.log(numbers)
```


Q19

let student = {
  firstName: 'Peter',
  lastName: 'Geach',
  semester: 'Spring',
  dateOfBirth: new Date('01/23/1904'),
  grades: {
    math: 'A',
    physics: 'B',
    English: 'A',
  },
}


Q20




Q21




Q22


