# Closures

Closure is a programming technique for combining a function with the lexical environment within which the function is defined. 

Closure is a combination of a function and the lexical environment in which the function is defined. 

Functions and methods in JS are closures. The function definition and its scope become a single entity called a closure. So, when the function is invoked, it can access any variables it needs from that environment.

```javascript
let name = "Gogol";

function firstName() {
   console.log(name);
}

function nestedFunc() {
  let name = "Tolstoy";

  return firstName();
}

nestedFunc();
```

Why does the above code output "Gogol" instead of "Tolstoy"?

The code above outputs "Gogol" instead of "Tolstoy" because when the line `console.log(name)` inside the function `firstName` is executed, the variable `name` declared on the first line is in scope but the variable `name` declared inside the `nestedFunc` is not in scope. 

Basically, when the execution reaches the line `nestedFunc()` after `let name = 'Gogol'`, JS creates a new execution context and pushes it onto the stack. In this execution context, a new local variable `name` is declared and initialized to "Tolstoy". Since this variable is declared inside the function, it does not reassign the value of the global variable. The `nestedFunc` returns by executing the `firstName` function (since the function is in scope). JS creates a new execution
context and pushes it onto the stack, where the code inside the `firstName` function is executed. Execution moves to the line `console.log(name)` and JS looks for the variable `name` in the local scope and not finding it in the local scope, it searches in the parent scope. Since the parent scope is the global scope, JS finds the variable `name` there and outputs its value "Gogol".

```javascript
let number = 42;

function printNumber() {
  console.log(number);
}

printNumber(); // => 42

number = 3.1415;
printNumber(); // => 3.1415
```
Explain why the last line prints `3.1415` but the prior function invocation prints `42`.

The main reason is that when JS looks for the variable `number` from inside the function `printNumber` it finds the variable in the global scope. The first time `printNumber` is invoked, the value of the `number` variable is `42` but the second time the `printNumber` is invoked, the value of the `number` variable had been reassigned to `3.1415`. 

In more detail: the variable `number` is declared with the `let` keyword and initialized to `42`. Execution moves to `printNumber()` and the code inside the function `printNumber` is run. JS encounters the `number` variable and looks for it in its lexical environment and finds the variable in the global scope. Hence, it logs `42` to the console.

Second, the variable `number` is reassigned to `3.1415`. When the `printNumber` function is invoked again, JS encounter the `number` variable and looks for it in its lexical environment and finds the variable in the global scope. Since the `number` variable has been reassigned to `3.1415`, it logs `3.1415` to the console.

This code demonstrates the concept of the closure and lexical scoping in Javascript.

```javascript
function foo() {
  let name = "Gogol";

  return function () {
    console.log(name);
  };
}

let printGogol = foo();
printGogol(); // Gogol
```

Explain how the code works.

In this code, `foo` function is invoked that returns a function object. This function object is assigned to the variable `printGogol` declared with `let` keyword. 

Next the we invoke the function stored in the variable `printGogol` and it sets up a new execution context. Inside the function, JS encounters a variable `name` and looks for it in its local scope. It doesn't find it there and then looks for the variable in its parent scope. It finds it there, where the variable `name` is intialized to string `Gogol`. Thus, `console.log(name)` prints `Gogol` to the console and the execution ends.

```javascript
function makeCounter() {
  let counter = 0;

  return function() {
    counter += 1;
    return counter;
  }
}

let incrementCounter = makeCounter();
console.log(incrementCounter()); // 1
console.log(incrementCounter()); // 2
```

Explain why the last two lines log `1` and `2` respectively? 

First, the return value of the `makeCounter` invocation is stored in the variable `incrementCounter`. `makeCounter` invocation sets up a new execution context and a lexical environment, where a local variable `counter` is declared and initialized to `0`. From this lexical environment, the `makeCounter` returns a function object that increments the value of the `counter` variable by `1` and returns the value of `counter`. 

The function object returned by `makeCounter` retains a pointer to the lexical environment where the function was declared.

When the function stored in `incrementCounter` is invoked, it increments the value of the `counter` variable from its lexical environment. Thus, the value of `counter` becomes `1` and thus it returns `1`. 

When tthe function stored in the `incrementCounter` is invoked again, it increments the value of the `counter` variable from its lexical environment. Hence, the value of `counter` becomes `2` and thus it returns `2`. This is logged to the console.

```javascript
function makeCounter() {
  let counter = 0;

  const fun1 = function() {
    counter += 1;
    return counter;
  }

  const fun2 = function() {
    counter += 2;
    return counter;
  }

  return [fun1, fun2];
}

let funs = makeCounter();
let fun1 = funs[0];
let fun2 = funs[1];
console.log(fun1()); // 1
console.log(fun2()); // 3
```

First, the `makeCounter` is invoked and its return value is stored in the variable `funs`.

When the `makeCounter` function is invoked, it creates a new lexical environment where a local variable `counter` is declared and initialized to `0`. 

In this lexical environment, an anonymous function is defined and a variable `fun1` is declared and initialized to this anonymous function. Then another anonymous function is defined and stored in the variable `fun2`. 

The `makeCounter` function returns an array with the two function objects as its elements. These two function `fun1` and `fun2` are closures. That means, they retain access to the lexical environment where they were defined. 

Second, a variable `fun1` is declared and initialized to the function object that is the first element of the array referenced by the variable `funs`. 

Third, another variable `fun2` is declared and initialized to the function object that is the second element of the array referenced by the variable `funs`. 

Fourth, the function object that `fun1` references is invoked. This function increments the `counter` variable from its lexical environment by `1` and returns the value `1`. This is what is output. 

Fifth, the function object that `fun2` references is invoked. This function increments the `counter` variable from its lexical environment, which it shares with the lexical environment of the function referenced by `fun1`. Since the value of the `counter` variable in that lexical environment is `1`, `fun2` increments the value of `counter` by 2 and thus returns `3`. 

