# Hoisting

Hoisting is a heuristic for explaining the fact that in the creation phase before the execution phase, when Javascript encounters a variable, function, or class declaration, it adds that identifier to the current scope.

So, when JS starts executing the code, JS can find the variables and functions prior to executing the line where the variables and functions are declared. This gives the impression that the variable and function declarations are somehow hoisted to the top of the application.

Another way to say this: prior to executing the code JS collects all the identifiers from the variable,function, or class declarations and adds them to the current scope. 

Hence, during the code execution the identifiers are available in the current scope even though the identifiers are declared later. This gives the impression that somehow JS pulls or hoists the variables and functions to the top. 

One thing to keep in mind here is that function declarations get a priority in this process. 

Now, let's see how hoisting does a pretty good job of explaining this:
Javascript engine operates in two main phases: __a creation phase__ and __an execution phrase__. 

The creation phase does some priliminary work prior to the execution phase. One of the work is to find all the variable, function, and class __declarations__ and move the declarations to the top of their scope: function-scoped delcarations get moved to the top of the function, and block-scoped declarations get moved to the top of the block. This process is __hoisting__.

Consider this case where variable declared with `var` keyword is hoisted to the top of the function and the variable declared with `let` keyword is hoisted to the top of the block. 

```javascript
function testScope() {
  console.log(hi);

  if (true) {
    console.log(greetings);

    let greetings = 'hello from a variable declared with let';
    var hi = 'hello from a variable declared with var';
  }
}

testScope();
```

It is important to note that the line `console.log(hi)` does not throw an error, but the line `console.log(greetings)` throws an error. 

Since `greetings` is declared with `let` keyword, it has block scope and is hoisted to the top of the block. 

Since `hi` is declared with `var` keyword, it has function scope and is hoisted to the top of the function. Although both variables are visible at the top of their scope, `greetings` throws an error because no value is set for the variable. However, `hi` is implicitly initialized to `undefined`.

The visibility of the `greetings` and `hi` variables at the top of their scope shows that they are hoisted. Still, they are hoisted in slightly different ways.


```javascript
hello();

function hello() {
  console.log("hello, stranger!");
}
```

Why is it that we can invoke functions that are declared after the function invocation?

Since function declarations are hoisted, we can invoke the `hello` function before the function declarations. What this means is that when JS engine executes the `hello()`, it already has access to the function, because during the creation phase JS engine has already collected the function declaration and made it available in its scope.

```javascript
console.log(something);

var something = "definitely not undefined.";
```

Why is it that the first line in the above code logs `undefined` instead of throwing an error?

The first line logs `undefined` instead of throwing an error, because the variable `something` is declared with the `var` keyword and hence hoisted to the top of the scope. When variables declared with `var` keyword are hoisted, they are implicitly assigned the value `undefined`. Hence, on the first line, JS tries to find the value of the variable `something` it finds `undefined` and logs the same to the console.


```javascript
console.log(something);

let something = "definitely not undefined.";
```

Why is it that the first line in the above code throws an error saying 'variables cannot be accessed before initialization' instead of throwing 'undefined reference: something is not defined' error?

The first line throws an error, because the variable `something` is declared with the `let` keyword and hence hoisted to the top of the scope. When variables declared with `let` keyword are hoisted, they are not assigned any value. Hence, on the first line, JS tries to find the value of the variable `something` it does not find any value and thus throws an error claiming  that it cannot access the value before initialization. 


```javascript
function testHoisting() {
  console.log(two);
  console.log(one);

  if (true) {
    let one = "variable declared with let keyword";
    var two = "variable declared with var keyword";
  }
}

testHoisting();
```

Does the above code throw an error? If yes, what kind of error does it throw and why? If no, explain what mechanism is involved two `console.log` code execution.

The above code throws an error complaining that the variable `one` is not defined, because the variable `two` declared with the `var` keyword is hoisted to the top of the function but the variable `one` declared with the `let` keyword is not available outside of the block where it is defined. This is because variables declared with `var` keyword have function-scope and variables declared with `let` keyword have block-scope.

```javascript
function testHoisting() {
  if (false) {
    var a = 2;
  }

  console.log(a);
}

testHoisting();
```

Why is it that the variable `a` is available inside the function even though the block where the variable `a` is declared is never executed?

This is where hoisting is relevant. Even though the code in the block is not executed, the variable `a` is hoisted to the top of the function and assigned the value `undefined`. Thus, even though the block is not executed, the variable is available inside the function.

```javascript
console.log(testHoisting());

var testHoisting = function () {
  return 'function assigned to a variable';
};
```

Why does the above code raise an error?

In the above code what is hoisted is the variable declaration `var testHoisting` and in the process it is assigned the value `undefined`. Hence, when we try to invoke a function, JS finds `undefined` stored in the variable `testHoisting`. Hence, it throws an error complaining that `testHoisting` is not a function.

```javascript
bar();

var foo = 'hello';

function bar() {
  console.log(foo);
}
```

Why does the above code log `undefined`?

The code logs `undefined` for two main reasons:
1. function and variable declarations are hoisted to the top of their scope
2. variables declared in the outer scope are accessible in the inner scope

During the creation phase, JS engine identifies all the identifiers for the current scope. JS directly stores the function declarations in memory but the variables declared with `var` keyword are initialized to `undefined`. So when JS executes the first line, it finds the function `bar` and executes it. Inside the function, JS encounters a variable `foo` and looks for it in the local scope and doesn't find it. It goes up another step and looks in the parent scope where it find
that the variable `foo` has the value `undefined`. Thus, the code logs `undefined`.
