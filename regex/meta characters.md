# Meta Characters

- A *meta character* is responsible for an operation similarly to a keyword in a programming language
- characters such as `. \* ^ $ [ ]` are meta characters
- that means, they have a special meaning in the expression

1. period `.`  means **arbitrary character**
2. asterik `*` means **iteratio**: match any number of times
3. tilde `^` means either (1) negation, or (2) anchor matching the start of the string
4. dollar `$` means anchor matching the end of the string or line
5. bracket `[]` means character set

Some more meta characters from PCRE
6. pipe `|` means alternative execution (OR)
7. question `?` means optional parts in the expression
8. plus `+` means match at least once
9. curly braces `{}` is meant to specify a range for the number of times an expression has to match the string
10. parens`()`  used for grouping characters or extracting substrings

Related: [[white space]]
