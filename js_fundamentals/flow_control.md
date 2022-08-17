# Flow control

We want some part of our program to get executed only under certain conditions. Depending on different conditions, we may want to execute different parts of our code. The technique for executing different segments of code depending on various conditions is called flow control. 

Conditionals are the core part of flow control: `if (condition1) {do something} else {do something else}`

When comparing strings, the comparison is character-by-character. JavaScript moves from left-to-right in the strings looking for the first character that is different from its counterpart in the other string. Once it finds a character that differs, it compares that character with its counterpart, and makes a decision based on that. If both strings are equal up to the length of the shorter string as in the next to last example, then the shorter string is considered less than the longer string.

JavaScript evaluates parentheses in the usual algebraic order. That is, it evaluates the expression in the innermost set of parentheses first, then works its way out to the outermost part of the expression. When multiple parenthesized subexpressions appear at the same depth, it evaluates them from left to right. Once it evaluates the parenthesized expressions, it evaluates the final expression value.

Switch statementt compares a single value against multiple values with the strict equality operator