# Primitives

There are seven primitive types in JS:
1. Undefined
2. Null
3. Boolean
4. Number
5. String
6. Symbol (Introduced in ES6)
7. BigInt (Introduced in ES9)

Primitive types are immutable. This means, once the values are created, they cannot be changed. 

```javascript
function doSomethingStrange(arg) {
  //say there is a lot of code inside the function
  //and it is hard to reason about how the function works
}

let a = 'hello';

doSomethingStrange(a);

console.log(a);
```

The beauty of immutability of strings is that without having to read any of the code inside the function body of the `doSomethingStrange` function (as long as there is no variable reassignment insidee the function), we can infer that that the code logs `hello` to the console (assuming that the `doSomethingStrange` function invocation does not throw an error). You can't make that inference if the value stored in `a` were not a primitive value.

Given this sort of behavior of primitive types, we can say that JS is pass-by-value when it comes to primitive types. 

Primitive values are implemented at the "lowest level of the language implementation" (whatever that means). Something about that implementation makes it faster to perform certain operations on the primitive values. 

Here is a bit of an explanation: primitives are stored in stack memory, whereas objects are stored in heap memory. Although objects are stored in heap memory, the pointers to the objects are stored in the stack memory. Stack memory is rather fast because its size is predetermined and not allowed to alter, whereas heap memory is dynamically allocated and is a bit slower. When a variable is initialized to another variable, what is copied is the value stored in the stack memory. For
primitives, the stack memory stores the values. For objects, the stack memory stores the pointers.That also explains another thing: when equality operator is invoked on primitives, the values are compared because that's what is stored on the stack. When equality operatr is invoked on objects, the pointers are compared. Hence, pass-by-value regarding primitives and pass-by-reference regarding objects. (Although I am not fully confident about the accuracy of this explanation, it is not wholly speculative.)

None of this means that the variable that contains the primitive value cannot be reassigned to another value. 

```javascript
let a = 'hello';

console.log(a); //logs 'hello'

a = 'greetings';

console.log(a); //logs 'greetings'
```

What happens in this code is not a counterexample to the immutability of the primitive values. The variable `a` declared with the `let` keyword and initialized to the string `hello` is later reassigned to a new string `greetings`. In other words, a different string is stored in the variable `a`.

Nevertheless, we can use the `const` keyword to declare a variable such that the variable cannot be assigned to another value. This does not mean that the value stored in the variable does not change, because if objects are stored in the variable then they can underg change.
