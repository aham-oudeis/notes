# Coercion / Conversion

When a value of one type needs to be converted to a value of another type, we can use some function for conversion. This is called explicit coercion.

For example:

```javascript
String(1);
String(0);
String(null);
String(undefined);

Number('2');
Number(null);
Number(false);
Number(true);
Number('');
```

# Implicit Coercion

## Unary + operator

The unary `+` operator works just like the `Number` function.

```js
+('')               // 0
+('     ')          // 0
+('  \r\n\r\n  ')   // 0
+([])               // 0
+([2])              // 2
+('abc')            // NaN
+(undefined)        // NaN
+('1a')             // NaN, quite different from parseInt function
```

## Binary + operator

1. When `+` is used with mixed operands that include a string, JavaScript converts the other operand to a string as well:

```js
'123' + 123     // "123123" -- if a string is present, coerce for string concatenation
123 + '123'     // "123123"
null + 'a'      // "nulla" -- null is coerced to string
'' + true       // "true"
```

2. When `+` is used with objects, both operands are converted to string and concatanated together:

```js
[1] + 2                     // "12"
[1] + '2'                   // "12"
[1, 2] + 3                  // "1,23"
[] + 5                      // "5"
[] + true                   // "true"
42 + {}                     // "42[object Object]"
(function foo() {}) + 42    // "function foo() {}42"
```

3. When both operands are a combination of numbers, booleans, nulls, or undefineds, they are converted to numbers and added together:

```js
1 + true        // 2
1 + false       // 1
true + false    // 1
null + false    // 0
null + null     // 0
1 + undefined   // NaN
```

## Arithmetic Operators

The other arithmetic operators, `-`, `*`, `/`, `%` are only defined for numbers, so JavaScript converts both operands to numbers:

```js
1 - true                // 0
'123' * 3               // 369 -- the string is coerced to a number
'8' - '1'               // 7
-'42'                   // -42
null - 42               // -42
false / true            // 0
true / false            // Infinity
'5' % 2                 // 1
```
