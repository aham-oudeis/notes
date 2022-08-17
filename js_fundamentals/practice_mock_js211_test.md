# Question 1
Examine the code below. What structure does `{...}` define? Explain with reference to this structure why line 9, `console.log(a)`, outputs `5` but line 10, `console.log(b)`, throws a `ReferenceError` exception. What underlying principle about the structure does this demonstrate?

```javascript
let a = 10

{
  a = 5;
  let b = 15;
}

console.log(a);  // 5
console.log(b);  // Uncaught ReferenceError: b is not defined
```
__Answer__

The structure `{...}` defines a block. 

`console.log(a)` logs `5` because (1) variable `a` is declared with `let` keyword in the global scope and initialized to `10`, and (2) the variable `a` is reassigned to `5` inside the block. Because of lexical scoping rules, variables declared in the outer scope are accessible from the inner scope. 

`console.log(b)` throws an error becausee (1) variable `b` is declared with `let` keyword inside the block, and (2) variables declared with `let` keywords have block scope. Since block-scoped variables are not accessible outside of the block where they are declared, javascript cannot access the variable `b` from the outer scope.

This demonstrates the concept of variable scope in javascript, especially the fact that variables declared in the outer scope are accessible from the inner scope but the variables declared in the inner scope are not accesible from the outer scope.

# Question 2
Explain why the following code outputs `Xyzzy` with precise language. What is the underlying concept?

```javascript
let a = 'Xyzzy';

function myValue(b) {
  b[2] = '-';
}

myValue(a);
console.log(a);
```
__Answer__

The code outputs `Xyzzy` because (1) the variable `a` is declared and initialized to `Xyzzy` in the global scope, and (2) strings are primitive types. Since primitive types are immutable, no methods or functions changes the value stored in the variable. Furthermore, since the variable `a` is not reassigned after it is initialized, it retains the same value when its value is logged in the last line.

Although `a` is passed in as an argument to the `myValue` function, it makes no difference to the primitive value stored in `a`. If `a` were to point to an array, things would be quite different.

What this demonstrates is the concept of immutability of primitive values.


# Question 3
Explain why the line `console.log(sentence)` outputs `hello world` rather than `HELLO WORLD`. What does this demonstrate about what happens on line 2?

```javascript
function shout(string) {
  return string.toUpperCase();
}

let sentence = 'hello world';
shout(sentence);
console.log(sentence);         // hello world
```
__Answer__

`console.log(sentence)` outputs `hello world` and not `HELLO WORLD` because (1) the variable `sentence` is initialized to string primitive `hello world`, (2) the variable `sentence` is not reassigned afterwards to `HELLO WORLD`. Primitive values are immutable and hence method invocation can change the value stored in the variable. Since the variable `sentence` retains its value `hello world`, the same is the output.

# Question 4
What happens when you run the following code? Why?

```javascript
const NAME = 'Shali';
console.log('Good Morning, ' + NAME);
console.log('Good Afternoon, ' + NAME);
console.log('Good Evening, ' + NAME);

NAME = 'Moro';
console.log('Good Morning, ' + NAME);
console.log('Good Afternoon, ' + NAME);
console.log('Good Evening, ' + NAME);
```
__Answer__

The code outputs `Good Morning, Shali`, `Good Afternoon, Shali`, `Good Evening, Shali` and then throws an error and none of the later code is executed, because variables declared with `const` keyword cannot be reassigned. As we can see, the variable `NAME` is declared with the `const` keyword and initialized to `Shali`. But when we try to reassign `NAME` to `Moro`, javascript throws an error.

# Question 5
Take a look at this code snippet:

```javascript
let foo = 'bar';
{
  let foo = 'qux';
}

console.log(foo);
```

What does this program log to the console? Why?

__Answer__

The program logs `bar` to the console, because the value of the variable `foo` is `bar` at the last line.

This is because (1) the variable `foo` is declared with the `let` keyword and initialized to 'bar', and (2) another local variable `foo` is declared with the `let` keyword inside the block. Since variables declared with `let` keywords have block scope, the variable `foo` in the inner scope does not affect the `foo` variable in the outer scope. Hence, `foo` retains its original value.

This code demonstrates the concept of variable scope, in particular the fact that variables declared with `let` keyword have block scope.

# Question 6
Will this program produce an error when run? Why or why not?

```javascript
const FOO = 'bar';
{
  const FOO = 'qux';
}

console.log(FOO);
```
__Answer__

The code will not produe an error, because variables decalred with `const` keywords are block-scoped. Hence, the line `const FOO = 'qux'` inside the block creates a variable `FOO` in the inner scope and does not conflict with the variable `FOO` declared in the outer scope. 

Hence, the last line outputs `bar` as the value of the variable `FOO` is `bar`. 

# Question 7
What does this code log to the console? Does executing the `foo` function affect the output? Why or why not?

```javascript
let bar = 1;
function foo() {
  let bar = 2;
}

foo();
console.log(bar);
```
__Answer__

The code logs `1` to the console, because (1) the value of the variable `bar` is declared with `let` keyword and assigned to `1`, and (2) is not further reassigned to a different value. 

`foo` function invocation does not affect the output, because the `bar` variable declared and initialized inside the function `foo` is local in scope. It shadows the global variable of the same name and hence does not affect the value of the global variable.

This demonstrates the concept of variable scope, in particular the fact that variables declared in the inner scope shadows but does not affect the variable of the same name in the outer scope. 

# Question 8
What does this code log to the console? Does executing the `foo` function affect the output? Why or why not?

```javascript
let bar = 1;
function foo() {
  bar = 2;
}

foo();
console.log(bar);
```
__Answer__

The code logs `2` to the console, because (1) the variable `bar` declared with `let` keyword is initialized to `1` in the global scope, and (2) is reassigned to `2` when the `foo` function is invoked. 

The `foo` function invocation affects the output, because the variable `foo` is reassigned only when the function is invoked. This behavior relies on the fact that functions create an inner scope. Varibles declared and initialized in the outer scope can be reassgined from the inner scope.


# Question 9
What does this code log to the console and why?

```javascript
if (true) {
  var grade = 3;
  console.log(grade);
}

function test() {
  var grade = 4;
  console.log(grade);
}

test();

function review() {
  console.log(grade);
}

review();
```

__Answer__

The code logs `3`, `4`, `3` to the console on different lines. 

The first `3` is logged to the console, because the block associated with the if-clause of the if statement is executed since the condition of the if-clause evaluates to `true`. Inside the block, a variable `grade` is declared with `var` keyword. Since variables declared with `var` keywords have function scope, the variable `grade` is declared in the global scope. This value of `grade` is then logged to the console.

`4` is logged to the console, because of the `test` function invocation, within which a local variable `grade` is declared with `var` keyword and initialized to `4`. Since variables declared with `var` keyword have function scope, this new local variable is local to the `test` function. It is this value of `grade` that is output.

The last `3` is logged to the console, because of the `review` function invocation, within which the the global variable `grade` is accessed from inside the function and logged to the console. When js sees the expression `grade` inside the function, it first looks for a variable with the same name in its local scope and not finding the variable there, it looks in the parent scope. It find the variable there with the value `3` and logs it to the console. 

# Question 10
What is the output and why?

```javascript
function ride() {
  bike = 'Schwinn';
  console.log(bike);
}

if (true) {
  console.log(bike);
}

ride();
```
__Answer__

The code throws an error, because as the block associated with the if-clause is executed, js attempts to find a variable with the name `bike` but it cannot find it in its lexical scope. Hence, it throws a reference error.

Although the function `ride` is defined in such a way that when invoked it intializes a global variable with the name `bike`, the function is not invoked before the if-block is executed.


# Question 11
What is the output and why?

```javascript
function ride() {
  bike = 'Schwinn';
  console.log(bike);
}

ride();

if (true) {
  console.log(bike);
}
```
__Answer__

The code logs `Schwinn` twice to the console: (1) because of `ride` function invocation, and (2) because if-block is executed.

The `ride` function invocation assigns the variable `bike` to the string `Schwinn` without any keyword. Since there is no variable of the same name in its lexical scope, what this does is add a property `bike` to the global object and set its value to `Schwinn`. It is this value that is logged to the console. 

Next, the if-condition of the if-statement evaluates to `true` and the if-block is executed. Inside the block, the value of the variable `bike` is logged to the console. js finds the variable `bike` in the global scope and logs its value `Schwinn`.

However, in the strict mode, this code will throw an error.


# Question 12
[Launch School Reference](https://launchschool.com/exercises/a5a1b87c)

What sequence of numbers will be logged to the console and why? Explain with precise language.

```javascript
for (let i = 0; i <= 10; i += 2) {
  console.log(i);
}
```

__Answer__
All the even numbers up to 10 will be logged: 0, 2, 4, 6, 8, 10. This is because the `for` loop starts at value `0` and increments by `2`. The loop continues till the value of `i` is less than or equal to 10. Hence, all the odd numbers are skipped and the loop stops after logging `10`.

# Question 13
[Launch School Reference](https://launchschool.com/exercises/5bd541dc)

The following code results in an infinite loop. Explain why and then explain what can be done to solve this.

```javascript
for (let i = 0; ; i += 1) {
  console.log("and on");
}
```

__Answer__

The code results in an infinite loop, because there is no condition after which the `for` loop stops and hence once started, the loop continues. 

To fix the code, we can add a condition to the `for` loop as follows: `for (let i = 0; i <= 100, i += 1)`.

# Question 14
[Launch School Reference](https://launchschool.com/exercises/76b7ea3d)

What is the difference between the following two code snippets? Explain each code snippet in detail.

```javascript
let counter = 0;

while (counter > 0) {
  console.log('Woooot!');
  counter -= 1;
}
```

```javascript
let counter = 0;

do {
  console.log('Woooot!');
  counter -= 1;
} while (counter > 0);
```
__Answer__

The two loops are different in the sense that `while` loop starts by evaluating the condition, but `do..while` loop first executes the block and then evalutes the condition. Hence, `do..while` loop executes the block at least once, but the `while` loop may not even execute the block. 

In the first code, a `counter` variable is declared with `let` and initialized to 0. JS then evalutes the condition specified for the `while` loop. The condition evaluates to false, because `counter` is not greater than 0. Hence, the block is not executed.

In the second code, a `counter` variable is declared with `let` and initialized to 0. JS executes the `do` block once. Thus, it logs `Woooot!` to the console and decrements the value of the `counter` by 1. It then evaluates the condition, which returns false. Hence the loop is exited. 


# Question 15
[Launch School Reference](https://launchschool.com/exercises/2f3dd3ae)

Take a look at the code below. Without running it, determine what it will log to the console.

```javascript
let animal = 'horse';

switch (animal) {
  case 'duck':
    console.log('quack');
  case 'squirrel':
    console.log('nook nook');
  case 'horse':
    console.log('neigh');
  case 'bird':
    console.log('tweet tweet');
  default:
    console.log('*cricket*');
}
```
__Answer__

The code logs `neigh`, `tweet tweet`, and `*cricket*`, because of the fall-through behavior of the switch statement. The switch statement skips all the case clauses that do not match the value of the given variable, i.e., `horse`. Once it finds a match, it executes the corresponding expression. However, in absence of a `break` statement, the execution falls through and thus execute all the remaining `case` expressions. 

# Question 16
[Launch School Reference](https://launchschool.com/exercises/f83e8ac3)

What does this code output and why?

```javascript
if (false || true) {
  console.log('Yes!');
} else {
  console.log('No...');
}
```
__Answer__

The code logs `Yes!` to the console, because the if-condition of the if-clause evaluates to `true`. When using the logical operator `||`, js evaluates the first operand. If the first operand is falsey, it returns the right operand. In this case, since the first operand is false, the right operand, i.e., `true` is returned. 

Hence, js executes the corresponding block and skips other clauses of the if-statement.


# Question 17
[Launch School Reference](https://launchschool.com/exercises/f1dfe3f6)

What does this code output and why?

```javascript
let sale = true;
let admissionPrice = !sale ? 5.25 : 3.99;

console.log('$' + admissionPrice);
```
__Answer__

The code logs `$3.99`. 

First, a variable `sale` is declared with `let` keyword and initialized to a boolean `true`.

Second, a variable `admissionPrice` is declared and initialized to the return value of the ternary operator that works as follows: since `!sale` evaluates to `false`, `3.99` is returned. Hence, `admissionPrice` is initializeed to `3.99`.

Third, a string `$` is concatanated with the value of `admissionPrice`, whose value is coerced into a string. This concatanated string is then logged to the console.


# Question 18
[Launch School Reference](https://launchschool.com/exercises/58aab02e)

What is the output and why?

```javascript
function multiplesOfThree() {
  let divisor = 1;

  for (let dividend = 3; dividend <= 30; dividend += 3) {
    console.log(dividend + ' / ' + divisor + ' = 3');
    divisor += 1;
  }
}

multiplesOfThree;
```
__Answer__

The code logs a string `3 / 1 = 3` on the first line. There are 10 lines in total, and each line the value of the numerator is increased by 3 and the value of denominator is increased by 1. 

When the `multiplesOfThree` is invoked, a local variable `divisor` is declared and initialized to 1. A `for` loop that starts with the value of `dividend` as `3`, increments the value of `dividend` by 3 and reassigns it to `dividend`, and goes up to the value `30`. On each loop, the block is executed and from within the block the value of `divisor` is incremented and reassigned to `divisor`. In this process, 10 lines are logged to the console.


# Question 19
[Launch School Reference](https://launchschool.com/exercises/e710c517)

What is the output and why?

```javascript
console.log(greeting);

var greeting = 'Hello world!';
```
__Answer__

The code outputs `undefined`, because the variable declaration on the third line is hoisted. What this means is that during the creation phase, js encounters the variable declaration on line 3 and keeps the identifier in the global scope. For variables declared with `var` keyword, js assigns the value `undefined`. Hence, during the execution phase, when js looks for the value of `greeting` it finds it value to be `undefined` and hence logs `undefined`.


# Question 20
[Launch School Reference](https://launchschool.com/exercises/aba8a530)

What is the output and why?

```javascript
console.log(greeting);

let greeting = 'Hello world!';
```
__Answer__

The code raises an eror complaining that the variable `greeting` is not accessible before initialization. Although js recognizes that there is variable with the same name initialized in the same scope later in the code (because the identifiers are collected during the creation stage), js does not find a value assigned to the variable. `greeting` is said to be in a temporary dead zone. 

In a sense, the variable declared with `let` keyword is hoisted but not assigned any value. 

# Question 21
[Launch School Reference](https://launchschool.com/exercises/85bba3f0)

What will the following code log to the console and why? Don't run it until you have tried to answer.

```javascript
if (true) {
  let myValue = 20;
}

console.log(myValue);
```
__Answer__

The code will throw an error, because no variable with the name `myValue` is declared in the global scope. Although a variable `myValue` is declared with `let` keyword and initialized inside the block, the variable is not accessible in the outer scope, because variables declared with `let` keywords are block-scoped.

Hence, there is no variable with the name `myValue`.


# Question 22
[Launch School Reference](https://launchschool.com/exercises/4c097ca6)

What will the following code log to the console and why? Don't run it until you have tried to answer.

```javascript
function myFunction() {
  let a = 1;

  if (true) {
    console.log(a);
  }
}

myFunction();
```
__Answer__

The code logs `1` to the console, because the variable `a` initialized in the outer scope can be accessed in the inner scope.

More detail: when `myFunction` is invoked, execution jumps to the body of the function. Inside the function, a variable `a` is declared and initialized to `1`. 

Next, since the if-condition of the if-statement evalutes to `true`, the associated block is executed. Inside the block, `a` is passed in as an argument to the `console.log` function. This outputs `1`, the value of `a`.


# Question 23
[Launch School Reference](https://launchschool.com/exercises/8bd04112)

What will the following code log to the console and why? Don't run it until you have tried to answer.

```javascript
function myFunction() {
  let a = 1;

  if (true) {
    console.log(a);
    let a = 2;
    console.log(a);
  }
}

myFunction();
```

__Answer__

The code should throw an error, because (1) variable declarations are hoisted, and (2) variables declared with `let` keyword are not initialized when they are hoisted. 

When `myFunction` is invoked, js creates a new execution context where the code inside the function body is executed. A variable `a` is declared with `let` keyword and initialized to `1`. Since  the if-condition evaluates to `true`, the code block is executed. 

Since variables declarations are hoisted, another variable `a` declared inside the block and initialized to `2` is already created for the block scope. When JS encounters `a` on the first line of the block, it finds a variable of the same name in the current scope, but cannot access the value of the variable. Hence, it throws an error. 


# Question 24
[Launch School Reference](https://launchschool.com/exercises/2c7c0c0f)

What will the following code log to the console and why? Don't run it until you have tried to answer.

```javascript
let a = 5;
let b = false;

if (a > 4) {
  let b = true;
}

console.log(b);
```

__Answer__

The code will output `false` because the value of `b` at the last line remains the same as value it was initialized to at the time of its declaration. 

Although the if-block declares a variable `b` and initializes it to `true`, this variable declaration does not alter the value of the variable `b` in the outer scope, because variables declared with `let` keyword have block scope. Hence, the variable `b` declared inside the block is local to the block.


# Question 25
[Launch School Reference](https://launchschool.com/exercises/dbcd15de)

What will the following code log to the console and why? Don't run it until you have tried to answer.

```javascript
let a = 1;

function myFunction() {
  console.log(a);
}

myFunction();
```
__Answer__

The code will log `1` to the console, because variables declared in the outer scope are accessible in the inner scope and functions create inner scope in JS. 


# Question 26
[Launch School Reference](https://launchschool.com/exercises/36d6b9d0)

What will the following code log to the console and why? Don't run it until you have tried to answer.

```javascript
let a = 1;

function myFunction(a) {
  console.log(a);
}

let b = 2;

myFunction(b);
```
__Answer__

The code above logs `2`, because the function `myFunction` is called with the value of `b` passed in as an argument, and the function calls `console.log` passing the same value, `2` as an argument. 

Although there is a variable `a` in the global scope, the parameter `a` of the function `myFunction` is a local variable inside the function. The local variable `a` shadows the global variable. Hence, when `console.log` is invoked with `a` passed in as an argument, it outputs the value of the local variable `a`, that is `2.`

This demonstrates the concept of variable shadowing. 

# Question 27
[Launch School Reference](https://launchschool.com/exercises/73c36214)

What will the following code log to the console and why? Don't run it until you have tried to answer.

```javascript
const a = 1;

function myFunction() {
  a = 2;
}

myFunction(a);
```
__Answer__

The code throws an error, because variables declared with `const` keyword cannot be reassigned.

On line 1, a variable `a` is declared with `const` keyword and initialized to 1. When `myFunction` is invoked with the value of `a` passed in as an argument, JS creates a new execution context where the variable `a` is reassigned to `2`. (JS doesn't throw an error for passing unnecessary arguments). For the reassignment, JS finds the variable in the global scope and recognizes that the variable is declared with `const` keyword. And it throws an error. 

This demonstrates variable scoping rules and the specific behavior of variables declared with `const` keyword.

# Question 28
[Launch School Reference](https://launchschool.com/exercises/84f23c76)

What will the following code log to the console and why? Don't run it until you have tried to answer.

```javascript
const a = {
  firstName: 'John',
  lastName: 'Doe'
};

function myFunction() {
  a.firstName = 'Jane';
}

myFunction();

console.log(a);
```
__Answer__

The code logs `{ firstName: 'Jane', lastName: 'Doe' }`, because the object that `a` references is mutated by the `myFunction`. Although the variable `a` is declared with `const` keyword (preventing any further reassignment), it does not prevent mutation of the object. 

On line 1, a variable `a` is declared with `const` keyword and initialized to an object. Next, `myFunction` is invoked and inside the function, the property `firtName` of the object that `a` points to is reassigned to `Jane` using a dot operator. (`a` is available because of lexical scoping rules). Thus, the object that `a` points to is mutated. 

Hence, when we invoked `console.log` with `a` passed in as an argument, the changes made to the object is reflected.


# Question 29
[Launch School Reference](https://launchschool.com/exercises/0b4ede66)

What is the output of both code snippets and why? Explain any differences.

```javascript
let ocean = {};
let prefix = 'Indian';

ocean.prefix = 'Pacific';

console.log(ocean); // ?
```

```javascript
let ocean = {};
let prefix = 'Indian';

ocean[prefix] = 'Pacific';

console.log(ocean); // ?
```
__Answer__
In the first code snippet, the object that `ocean` points to is assigned a value `Pacific` to the property `prefix` using the dot notation. Hence, the object that `ocean` points to has a key-value pair: `prefix: 'Pacific'`. 

In the second code snippet, the object that `ocean` points to is assigned a value 'Pacific' to the property 'Indian' using the bracket notation. Since the `prefix` inside the bracket is a variable that points to the string `Indian`, the key is set to the string `Indian`. Hence, the object that `ocean` points to has a key-value pair: `Indian: 'Pacific'`


# Question 30
[Launch School Reference](https://launchschool.com/exercises/516713a8)

We are experimenting with some code to get more comfortable working with objects. Run the snippet below and explain why "It's true!" is never output.

```javascript
let obj = {
  num: 42,
  'property name': 'string value',
  true: false,
  fun: function() {
    console.log('Harr Harr!');
  },
};

for (let prop in obj) {
  if (prop === true) {
    console.log("It's true!");
  }
}
```
__Answer__

The main reason is that keys of objects are strings, and the strict equality operator with `'true'` and `true` evaluates to `false`. 

On line 1, a variable `obj` is declared with `let` keyword and initialized to an object with several key-value pairs. 

Next, `for/in` loop iterates through the keys of the object and on each iteration a variable `prop` declared and initialized to the current key. Inside the block, the value that variable `prop` points to is compared to the boolean `true` using the strict equality operator. Since all the keys are strings, the condition always evaluates to `false`. Hence the block associated with the if-clause is never executed. 

# Question 31
When run, the code below outputs the Strings `a`, `b`, `c`, `d`, `e` and `f` in sequence. Provide a precise breakdown of the code to explain why this happens, paying particular attention to the two calls to `#forEach`.

```javascript
let myArr = [["a", "b"], ["c", "d"], ["e", "f"]];

myArr.forEach(function (arr) {
  arr.forEach(function (letter) {
    console.log(letter);
  });
});
```
__Answer__

On line 1, a variable `myArr` is declared and initialized to a nested array: `["a", "b"], ["c", "d"], ["e", "f"]]`. 

Next, `forEach` method is called on the array `myArr` points to, with a callback function passed in as an argument. `forEach` iterates through the elements and calls the callback function passing in the current element. So on first iteration, the callback function is called with `['a', 'b']` passed in as an argument. 

Inside the callback function, this element is assigned to the variable `arr` and from inside function, we invoked another `forEach` method on the array `arr` points to with another callback function passed in as an argument. This inner `forEach` function iterates through `['a', 'b']` and invokes the callback function with each element passed in as an argument. The callback function, logs the current element. Thus, by iterating through the nested arrays and logging each element  of
the nested arrays, we get the output as described. 

# Question 32
When run, the code below outputs this array `["FORD", "CHRYSLER", "TOYOTA"]`. Provide a precise breakdown of the code to explain why this happens, paying particular attention to the call to `map`.

```javascript
let cars = [ 'Ford', 'Chrysler', 'Toyota' ];

let myCars = cars.map(function (car) {
  return car.toUpperCase();
});

console.log(myCars);  // [ "FORD", "CHRYSLER", "TOYOTA" ]
```
__Answer__

On line 1, the variable `cars` is declared with `let` keyword and initialized to an array. 

On line 2, the variable `myCars` is declared with `let` keyword and initialized to what is returned by invoking the `map` method on `cars` array. 

On invoking the `map` method on `cars` array, a callback function is passed as an argument, that returns an uppercased version of the string passed to it as an argument. Hence, `map` method returns a new array populated with the strings converted to upper case. This new array is what the variable `myCars` points to. 

When on the last line, the function `console.log` is invoked with `myCars` passed as an argument, it logs the array that `myCars` points to. Hence, the output is: `[ "FORD", "CHRYSLER", "TOYOTA" ]`. 


# Question 33
When run, the code below outputs this array `["Ford", "Toyota"]`. Provide a precise breakdown of the code to explain why this happens, paying particular attention to the call to `filter`.

```javascript
let cars = [ 'Ford', 'Chrysler', 'Toyota' ];

let myCars = cars.filter(function (car) {
  return car.includes('o');
});

console.log(myCars);  // [ "Ford", "Toyota" ]
```
__Answer__

On the first line, a variable `cars` is declared and initialized to an array. 

On the third line, another variable `myCars` is declared and initialized to the returned value of invoking `filter` method on the `cars` array with a callback function passed in as an argument.

The passed in callback function returns a boolean by calling `includes` method on the string passed to it, with `'o'` as its argument. This checks if the string has a letter `'o'` in it.

The `filter` method returns a new array with items from the original array which when passed to the callback function returns a truthy value. Hence, it returns an array `['Ford', 'Toyota']` because only `Ford` and `Toyota` returns `true` when passed to the callback function, but `Chrysler` returns `false`.

# Question 34
When run, the code below outputs `Ford`. Provide a precise breakdown of the code to explain why this happens, paying particular attention to the call to `find`.

```javascript
let cars = [ 'Ford', 'Chrysler', 'Toyota' ];

let myCars = cars.find(function (car) {
  return car.includes('o');
});

console.log(myCars);  // Ford
```
__Answer__
The `find` method returns the first element that when passed to the callback function returns a truthy value. Since, `Ford` is the first element that returns a truthy value when passed to the callback function, calling `find` method on `cars` returns `Ford`.

# Question 35
When run, the code below outputs `FordChryslerToyota`. Provide a precise breakdown of the code to explain why this happens, paying particular attention to the call to `reduce`.

```javascript
let cars = [ 'Ford', 'Chrysler', 'Toyota' ];

let myCars = cars.reduce(function (prev, cur) {
  return prev + cur;
});

console.log(myCars);  // FordChyrlserTotyota
```
__Answer__
When `reduce` method is invoked on the `car` array, with the callback function that returns the value obtained by using `+` operator on the operands, the array elements are concatanated and returned by the `reduce` method. 


# Question 36
[Launch School Book Reference](https://launchschool.com/books/javascript/read/arrays#iterationmethods)

What is the output and why?

```javascript
let array = ['a', 'b', 'c', 'd', 'e', 'f'];
array.splice(3, 2);
console.log(array);
```

__Answer__

`splice` is a mutating method. When `splice` method is invoked on the array that `array` points to, with `3, 2` as its arguments, it removes two elements starting at index `3`. Hence, it removes `d` and `e`.

When `console.log` is invoked with `array` passed in as an argument, it outputs the following array: `['a', 'b', 'c', 'f']`.
