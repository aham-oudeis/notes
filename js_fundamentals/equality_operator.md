# Equality Operators

1. Strict equality operator
2. Loose equality operator

## Strict Equality Operator
* compares values without performing implicit coercion.
* the two operands of primitive types (excepting `NaN`) are only equal if they are both the same type and have the same value:

```js
1 === 1               // true
1 === '1'             // false
0 === false           // false
'' === undefined      // false
'' === 0              // false
true === 1            // false
'true' === true       // false
```

* Comparing objects amount to comparing if the operands are the same object.

## Loose Equality Operator
* if the operands are objects, returns true only if the operands references the same object.
* if the operands are primitive and of the same type, returns true (excepting `NaN`) only if the operands have the same value
* if the operands are primitives and of different types, js has following set of rules:
    1. When one operand is a string and the other is a number, the string is converted to a number:
    
    ```js
    1 == '1' // true, bc '1' is converted to 1;
    '5' == 5 // true
    0 == '\n' // true, bc '\n' is converted to 0;
    0 == 'abc' // false, bc 'abc' is converted to NaN;
    ```

    2. When one operand is a boolean, it is converted to a number:
  
    ```js
    true == '1' // true, bc both true and '1' are converted to number 1
    false == '0' // true, bc both are converted to 0
    true == 1 // true, bc true is converted to number
    '' == false // true, bc both are converted to 0;
    ```
    One might wonder if the operands are really converted to numbers or to strings. How would we know? If they were to be converted to strings, `true == 1` should return false, not true. 

    3. When one operand is `null` and the other is `undefined`, the non-strict operator always returns `true`. If both operands are `null` or both are `undefined`, the return value is `true`. Comparing `null` or `undefined` to all other values returns false:

      ```js
      null == undefined      // true
      undefined == null      // true
      null == null           // true
      undefined == undefined // true
      undefined == false     // false
      null == false          // false
      undefined == ''        // false
      undefined == 0         // false
      ```
  