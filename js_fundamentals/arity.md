# Arity

JS has lenient arity:
 1. Calling a function with too few arguments does not raise an error.
 2. Within a function, an argument that wasn't provided in the call will have the value undefined.
 3. The `NaN `result is caused by the fact that `b` is undefined; it isn't a direct result of the missing parameter. It is merely JavaScript's standard behavior when a number and undefined are added.

Examples

```javascript
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
