# Truthiness

JS treats the following values as false:
1. `false`
2. Number 0: [0, -0, 0n]
3. An empty string `''`
4. `undefined`
5. `null`
6. `NaN`

While the values that evaluates as true are truthy, the values that evaluates as false are falsey.