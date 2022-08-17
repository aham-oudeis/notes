# Variable as pointers

Two ways of reasoning:
1. a variable points to or references an object in memory
2. the pointers stored in variables are references

Every time a JS program creates a new variable, JS allocates a spot somewhere in its memory to hold its value. Somehow the variable is linked with this address in memory. If the value stored in the variable is a primitive (except for strings), the value of the variable is stored in this allocated memory. To simply our understanding, we can assume that all primitive values are stored directly in the memory.

Consider the following code:

```javascript
let a = 7;
let b = a;

console.log(a); // logs 7
console.log(b); // logs 7
```
In the above code, a variable `a` is declared with `let` and initialized to `7`. When JS sees this line, it allocates a memory for this variable to hold the value 7. In the next line another variable `b` is declared and initialized to the value of `a`. When JS sees this line, it allocates another memory space for the `b` variable and __copies the value of `a`__ into that memory location. Although both `a` and `b` have the same value, it is not because they point to the same memory address. (Whatever is stored in the stack memory is copied: in case of primitives, its the value and in case of objects, it's the reference.) Rather, `a` and `b` point to different memory addresses that contain the same value. This is quite distinct from what happens in cases of non-primitive types. 

```javascript
let a = [1, 2, 3];
let b = a;

console.log(a); // logs [1, 2, 3]
console.log(b); // logs [1, 2, 3]
```

In this code, when the variable `b` is assigned to the value of `a`, what happens is that JS copies the reference/pointer stored in `a` and associates the variable `b` with this copy of the pointer. Since the pointer stored in both `a` and `b` points to an array object, changing the value stored in one variable amounts to changing the value stored in another variable. 

```javascript
let a = [1, 2, 3];
let b = a;

console.log(a); // logs [1, 2, 3]
console.log(b); // logs [1, 2, 3]

a.push(4);

console.log(a); // logs [1, 2, 3, 4]
console.log(b); // logs [1, 2, 3, 4]
```

Overall, variables store values in case of primitives and references in case of objects. Things are probably lot more complicated than this, but this is a good enough heuristic for understanding how objects and primitives are stored in variables. 


