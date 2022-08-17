# Alternative execution

Concatenation is simply a sequence of characters within the slashes `/`.  The pipe operator `|` introduces alternative execution

1. `/javascript|ruby|python/` matches any string containing `javascript` or `ruby` or `python`
2. `/....|a|the/` matches any string that is at least four characters long OR contains the character `a` OR contains the substring `the`

The pipe operator `|` used for disjunction has the lowest precedence out of all the operators in regular expressions

Parentheses are used to override the lower precedence of the pipe operator:

`/list|lost|lust/` can be rewritten as `/l(i|o|u)st/` 

In this syntax `/list|lost|lust/` , the pipe operator is the last operator.  

But in the syntax  `/l(i|o|u)st/` , the pipe operator is evaluated first and the concatenation is the last one. 