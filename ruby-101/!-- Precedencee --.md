<!-- Precedencee -->

What an expression evaluates to is determined by precedence; these are set of rules on which expression gets priority in the order of evaluation;  But since there is more to the evaluation process in Ruby than just the order of evaluation, it is safer to think in terms of precedence as rules that govern which **operands** the operator takes.

There is what's called **operator precedence**.

But then there is left-to-right and right-to-left evaluation and ternary operators that complicate the idea about the priority of evaluation.

Blocks have the lowest level of precedence and `{}` has a slightly higher precedence over `do...end` block.

```ruby
arr = [1, 2, 3]

p arr.map {|n| n*n}
==> [1, 4, 27]

p arr.map do |n|
  	n*n
	end
==> enumerator

(p arr.map) do |n|
  	n*n
	end
==> enumerator

p (arr.map do |n|
  	n*n
	end)
==> [1, 4, 27]
```

In this sequence of code snippets, the first and last outputs the same result. A bit quiry one is the second where the precedence  skews what we expect. In the second code, `arr.map` gets evaluated first and then it is passed to the method `p` along with the `do..end` block.

Use parenthesis to avoid getting tripped up by the issues with precedence.